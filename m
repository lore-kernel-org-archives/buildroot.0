Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B679D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AF9B83A41;
	Tue, 13 Jan 2026 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GFTiLmHirWAd; Tue, 13 Jan 2026 19:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 617B083916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333026;
	bh=W+dKkptWs+jtEJhqCaJ0WEP5tw5Yrqb0ZWNeCDjj+MM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AkUBLLZtCmblo8OzeQhgPTEs1cJD1VRU/5TA8nCAu1e2Mym4DjJUTzbrdvRbBK5EF
	 31eYIVx7P3IRPlp6VHqz9iQFQ8/XyEwBbAXHJXNzICRWepo66+olPn/rjtE/mT5/p6
	 yNCVh+xa+cW5uXDj1/ERND+jwulOQKLidJ+Uv4hczjccEpv6Mc+ZuPdRxJPUmL8gRj
	 c9Cia5hSb4y3s92ELO8CG7gGtGVdEpz+reyp+Y65Ud9M82Q1gRW/Hy0eVUAu8x6T1T
	 n2WBMOFQbkHx/h7UzX+NfqhDxMb9DPCHsmYV3B4GkrgrRUpKjzAeUN5CoGOT1LKtEp
	 r/Arh/+h06jCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 617B083916;
	Tue, 13 Jan 2026 19:37:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3A591C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6BA6404EB
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWvpFI2ScuBt for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D8B74037A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D8B74037A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CE8E86184; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:58:08 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8d47bca9a5a06e5b524eb29cd0e3fcddf01de4cc
X-Git-Newrev: f3490f35fb929e62100a4bc29ecdefb9b242a3b7
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.4CE8E86184@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/fontconfig:
 disable doc and tests for host
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3490f35fb929e62100a4bc29ecdefb9b242a3b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

On Debian 13 doc generation fails. Disable it like for
the target.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 20f31f90ad55b3e0654b6bc1b1ed76e7a1e6032e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/fontconfig/fontconfig.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 7ac8872e82..ea29c41189 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -16,6 +16,10 @@ FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 FONTCONFIG_CPE_ID_VALID = YES
 
+HOST_FONTCONFIG_CONF_OPTS = \
+	-Dtests=disabled \
+	-Ddoc=disabled
+
 FONTCONFIG_CONF_OPTS = \
 	-Dcache-dir=/var/cache/fontconfig \
 	-Dtests=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
