Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325D5C77B7F
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 12:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90493815CD;
	Sun, 14 May 2023 12:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90493815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aeJYHM2nYnTV; Sun, 14 May 2023 12:43:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CC3B8135D;
	Sun, 14 May 2023 12:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CC3B8135D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 093C61BF48B
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E27E341DD2
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E27E341DD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5puX8ntEolr1 for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 12:43:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB31741DD1
 for <buildroot@buildroot.org>; Sun, 14 May 2023 12:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB31741DD1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B848786692; Sun, 14 May 2023 12:43:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 May 2023 14:41:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a3e81bf5492c61dfe14b5e1485b9adb034ce4e8
X-Git-Newrev: 0f417e28984f67f2327446118ff5a7fc574afcc3
X-Patchwork-Hint: ignore
Message-Id: <20230514124354.B848786692@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mmc-utils: bump to version
 d4c2910981ff99b983734426dfa99632fb81ac6b
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f417e28984f67f2327446118ff5a7fc574afcc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Let's also switch to a _SITE that can be accessed from a web browser and
results to be the official one for mmc-utils.

The license file we use is a header, so it changes every now and then,
even when the licenins terms do not. Switch to using README instead, as
it identifies the license (albeit just by name, b ut that's enough for
us), which is still GPL-2.0 (only).

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998@free.fr: switch to README]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mmc-utils/Config.in      | 2 +-
 package/mmc-utils/mmc-utils.hash | 4 ++--
 package/mmc-utils/mmc-utils.mk   | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/mmc-utils/Config.in b/package/mmc-utils/Config.in
index d65988c749..d938b5dea3 100644
--- a/package/mmc-utils/Config.in
+++ b/package/mmc-utils/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_MMC_UTILS
 	help
 	  MMC utils
 
-	  https://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git
+	  https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 
 if BR2_PACKAGE_MMC_UTILS
 
diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 1256f63487..0d0b6ac1b9 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f6ed1cb2f02d49df4244f8872b47b22780dd634fa19d857298ce1b793752776f  mmc-utils-dfc3b6ecda84d21418fb4408b39c5c71db4c6458-br1.tar.gz
-sha256  f57e3c6169116aa9ff06eec95734ca000e4d0196467bb221e80e50530c768081  mmc.h
+sha256  e5a8dacf26a178010202c8fa7cb28b01f50fe967da98cdbdf320b2f110920106  mmc-utils-d4c2910981ff99b983734426dfa99632fb81ac6b-br1.tar.gz
+sha256  4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  README
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 435e6ae7f1..9da9c30293 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = dfc3b6ecda84d21418fb4408b39c5c71db4c6458
-MMC_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
+MMC_UTILS_VERSION = d4c2910981ff99b983734426dfa99632fb81ac6b
+MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
-MMC_UTILS_LICENSE_FILES = mmc.h
+MMC_UTILS_LICENSE_FILES = README
 
 MMC_UTILS_CFLAGS = $(TARGET_CFLAGS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
