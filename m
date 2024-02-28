Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7481FC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 458784178D;
	Wed, 28 Feb 2024 21:26:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RODB3oKYcqTh; Wed, 28 Feb 2024 21:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 223A14178F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 223A14178F;
	Wed, 28 Feb 2024 21:26:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04A861BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF1A081B71
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bozmpK2fqOSl for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BF84817A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BF84817A9
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18D9A87CDC; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:02:40 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 1c93f28c12154478143e2c1757aa44e8f428c172
X-Git-Newrev: efa40febd9bb7dbbd6cd86cbdde5c3d0ffec3947
X-Patchwork-Hint: ignore
Message-Id: <20240228212552.18D9A87CDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/glibc: add CVE
 ignore for CVE-2023-4806
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

commit: https://git.buildroot.net/buildroot/commit/?id=efa40febd9bb7dbbd6cd86cbdde5c3d0ffec3947
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit 8519de517e22 (package/{glibc, localedef}: security bump to version
glibc-2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701) correctly mentioned
CVE-2023-4806 in the commit message, but forgot to add an ignore for it.

Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 62b767fd3ed27d245937066f77ec53bd0b1e9329)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 596697bb8f..d49da6457c 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -28,6 +28,10 @@ GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 # 2.38 and the version we're really using
 GLIBC_IGNORE_CVES += CVE-2023-4527
 
+# Fixed by 5ee59ca371b99984232d7584fe2b1a758b4421d3, which is between
+# 2.38 and the version we're really using
+GLIBC_IGNORE_CVES += CVE-2023-4806
+
 # Fixed by 750a45a783906a19591fb8ff6b7841470f1f5710, which is between
 # 2.38 and the version we're really using.
 GLIBC_IGNORE_CVES += CVE-2023-4911
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
