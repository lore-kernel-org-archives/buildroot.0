Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA58CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 19:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F15CF418E2;
	Sun, 24 Sep 2023 19:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F15CF418E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 97hqEWPGbj4e; Sun, 24 Sep 2023 19:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC070418EC;
	Sun, 24 Sep 2023 19:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC070418EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A29F1BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4335E819D2
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4335E819D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HWvtrQY13bnt for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 19:05:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6317F81A12
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 19:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6317F81A12
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54160875B0; Sun, 24 Sep 2023 19:05:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 21:02:55 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7fe9b7eb8fec85f0f49a6a622ca4a4348b9b9ebe
X-Git-Newrev: 5944ae28a3181e9bd1397ef9b063d14278b6814c
X-Patchwork-Hint: ignore
Message-Id: <20230924190551.54160875B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libjxl: security
 bump to version 0.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=5944ae28a3181e9bd1397ef9b063d14278b6814c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix CVE-2023-35790: An issue was discovered in dec_patch_dictionary.cc
in libjxl before 0.8.2. An integer underflow in patch decoding can lead
to a denial of service, such as an infinite loop.

https://github.com/libjxl/libjxl/releases/tag/v0.8.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Julien Olivain <ju.o@free.fr>
Tested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e4572cc705b92f593e87095619b30f016ae507d9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libjxl/libjxl.hash | 2 +-
 package/libjxl/libjxl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
index 6b4c9d8d0a..c8f98d10ea 100644
--- a/package/libjxl/libjxl.hash
+++ b/package/libjxl/libjxl.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  60f43921ad3209c9e180563025eda0c0f9b1afac51a2927b9ff59fff3950dc56  libjxl-0.8.1.tar.gz
+sha256  c70916fb3ed43784eb840f82f05d390053a558e2da106e40863919238fa7b420  libjxl-0.8.2.tar.gz
 sha256  8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede  LICENSE
 sha256  91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575  PATENTS
diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index f603327bf6..47c110eb53 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJXL_VERSION = 0.8.1
+LIBJXL_VERSION = 0.8.2
 LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
 LIBJXL_LICENSE = BSD-3-Clause
 LIBJXL_LICENSE_FILES = LICENSE PATENTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
