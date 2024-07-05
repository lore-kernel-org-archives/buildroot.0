Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB82FC3271E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 19:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BFCF610F7;
	Fri,  5 Jul 2024 19:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kx_ZiUVa0Mug; Fri,  5 Jul 2024 19:31:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C330610E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C330610E5;
	Fri,  5 Jul 2024 19:31:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD2C41BF98E
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 19:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6B55408BF
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 19:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMxODVOiMJJk for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 19:30:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCE94414BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCE94414BB
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 19:30:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C96283C18; Fri,  5 Jul 2024 19:30:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jul 2024 21:27:27 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: c35da0196387968dd86ecb39a2c254d3b376ae51
X-Git-Newrev: 18a7440bb86e9a34641899523e9754d084419666
X-Patchwork-Hint: ignore
Message-Id: <20240705193056.3C96283C18@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/glibc: drop
 ignores for 2.38 specific CVEs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=18a7440bb86e9a34641899523e9754d084419666
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Commit b5680f53d60 (package/glibc: bump to 2.39) forgot to drop the ignores
for the 2.38 specific CVEs.  Do that now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 722804c4a1307e4d2eeae7496c4645da2bb63329)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 96a850516f..8bc4cd4666 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -24,34 +24,6 @@ GLIBC_CPE_ID_VENDOR = gnu
 # allow proper matching with the CPE database.
 GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 
-# Fixed by b25508dd774b617f99419bdc3cf2ace4560cd2d6, which is between
-# 2.38 and the version we're really using
-GLIBC_IGNORE_CVES += CVE-2023-4527
-
-# Fixed by 5ee59ca371b99984232d7584fe2b1a758b4421d3, which is between
-# 2.38 and the version we're really using
-GLIBC_IGNORE_CVES += CVE-2023-4806
-
-# Fixed by 750a45a783906a19591fb8ff6b7841470f1f5710, which is between
-# 2.38 and the version we're really using.
-GLIBC_IGNORE_CVES += CVE-2023-4911
-
-# Fixed by 5ee59ca371b99984232d7584fe2b1a758b4421d3, which is between
-# 2.38 and the version we're really using.
-GLIBC_IGNORE_CVES += CVE-2023-5156
-
-# Fixed by 23514c72b780f3da097ecf33a793b7ba9c2070d2, which is between
-# 2.38 and the version we're really using.
-GLIBC_IGNORE_CVES += CVE-2023-6246
-
-# Fixed by d0338312aace5bbfef85e03055e1212dd0e49578, which is between
-# 2.38 and the version we're really using.
-GLIBC_IGNORE_CVES += CVE-2023-6779
-
-# Fixed by d37c2b20a4787463d192b32041c3406c2bd91de0, which is between
-# 2.38 and the version we're really using.
-GLIBC_IGNORE_CVES += CVE-2023-6780
-
 # All these CVEs are considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
