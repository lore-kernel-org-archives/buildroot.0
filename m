Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7748D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD02D60D9B;
	Tue, 13 Jan 2026 19:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6bdVRNWTeef; Tue, 13 Jan 2026 19:37:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC3DB60DBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333042;
	bh=07XMu7j+vC6xWzFPv/JzVx4bLyYw4im9w0X+d1hf87A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gFga4d0iMIMg1qss6MQ+GDGf6Yx3is00wa2yZwtEvEpZEqmKyuIUEvQEzkvyBFwBi
	 Amgc2CUA2PcGeS6VctK+JiJ0Q7sgrP6HeHxrLyoyTqh/nRW4//AWy4Rv0uzi5uDy/6
	 iwHED3Pdq0f6rc/c+guvULbEpKNCV/u8JoB93v7/RlzvkAFbTR5Eo2aQ0/n9+CP2eX
	 D22hK0/AE2yXE1R+LTEI9E/zFncdfdP7LDX+P10CUaxd6UQYOIB5JOCIIq0TMX0BFg
	 WNCVHlEYR6JHGHY9CVBceC9oWuPGYi+wasVuv76jjX00tNHcEyD5Q9BTLffDlT3eUs
	 uTowUZ4rgR8pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC3DB60DBD;
	Tue, 13 Jan 2026 19:37:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 331BE231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 149A640541
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKGHXyjp7gkM for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAD794047A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAD794047A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8CEF87E62; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:04:24 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ad4df54b844b4e94a633eb0a6490b632021ed87f
X-Git-Newrev: 503adba18a0cae211e2f71e8ef0c08df6b612b07
X-Patchwork-Hint: ignore
Message-Id: <20260113193617.D8CEF87E62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/freerdp: remove
 stale IGNORE_CVES
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=503adba18a0cae211e2f71e8ef0c08df6b612b07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The NVD DB is now correctly tracking the vulnerability starting version
3.0 (see [1]). The IGNORE_CVES entry introduced in [2] is then no longer
needed.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-4478
[2] f741e8f6e6 package/freerdp: ignore CVE-2025-4478

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b3007ebcaf4736dde948a43ea6f8abee6b83c8c5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freerdp/freerdp.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 391b9a4675..3a1ba61621 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -13,10 +13,6 @@ FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 FREERDP_CPE_ID_VENDOR = freerdp
 
-# As explained on https://github.com/FreeRDP/FreeRDP/pull/11573#issuecomment-2904160524,
-# the affected code is new with 3.x, was not there on 2.x
-FREERDP_IGNORE_CVES += CVE-2025-4478
-
 FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
