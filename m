Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B08AFCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DFE2613E8;
	Fri,  6 Mar 2026 19:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efslgPuqMdFw; Fri,  6 Mar 2026 19:51:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 513AE613E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826678;
	bh=n1lUYseBHqa9acCzG6esytQkq/cRs085Cs4P7FUJJdM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WW/4ixEc8eKpfsJ96jbch1Oh5tZc8j/JbibUk+Ic6l56zsl0uERBOFz/D34IuydiE
	 UrQgx3wbg6Zpf44MgmsazvarQJLcg4Pw56iMbNL8N4ceSaL2qVC2SntiRgZuZkQ46I
	 Eat3zG0NA8SqKGa2sNpyEd1OYl/nYxXzQArtdg38zfvbW0wkBSwj14FtBuVurSZaPw
	 kmn7hj1jYVcoqhVpSlk2iFuJcLreL3+Lm3onjxligIvaR4dr2+XKSdP4nbGKfZaAIZ
	 oEu1UraaP2Gr7QATTDDyIHoRHVbX0ztjul4SAtpS2vonkaoty3s+LLPkfvgARddPzp
	 MRx13QdNwavWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 513AE613E9;
	Fri,  6 Mar 2026 19:51:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01DA025B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F10BA613E5
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kpLjJrfkwl6B for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E7E0613EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E7E0613EF
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43A55841E4; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:15:13 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 30e89e9983f8441b47c3c51c00d69775f09e3bea
X-Git-Newrev: 507b3aff7a18bd611fb0be2067ae77d8c345f326
X-Patchwork-Hint: ignore
Message-Id: <20260306195051.43A55841E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/freerdp: add
 CVE-2024-32662 to IGNORE_CVES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/507b3aff7a18bd611fb0be2067ae77d8c345f326
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The CVE-2024-32662 was Introduced in v3.0.0-beta1.
For more information see [1].

[1] https://security-tracker.debian.org/tracker/CVE-2024-32662

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a3329fd4923b7f1451560b589f101091574cb4dc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freerdp/freerdp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 07b9d36339..f240d789dd 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -13,6 +13,10 @@ FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 FREERDP_CPE_ID_VENDOR = freerdp
 
+# Introduced in v3.0.0-beta1
+# https://security-tracker.debian.org/tracker/CVE-2024-32662
+FREERDP_IGNORE_CVES += CVE-2024-32662
+
 FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
