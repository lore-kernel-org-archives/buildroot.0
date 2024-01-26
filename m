Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B69DC47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 21:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDC6440502;
	Fri, 26 Jan 2024 21:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDC6440502
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Kj9a3vVmW8Z; Fri, 26 Jan 2024 21:30:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 908494377A;
	Fri, 26 Jan 2024 21:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 908494377A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D4E21BF2EC
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 21:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B72B760AAD
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 21:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B72B760AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YdA7aFHasHmw for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 21:29:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA5A161499
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 21:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA5A161499
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8404865B1; Fri, 26 Jan 2024 21:29:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 22:26:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca76f99d95c018652c8217a3a382f8eba72a69f3
X-Git-Newrev: 40f7130a671ad5fc15628d9ecf852ece12d013da
X-Patchwork-Hint: ignore
Message-Id: <20240126212947.A8404865B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189fs: bump to version
 2024-01-22
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

commit: https://git.buildroot.net/buildroot/commit/?id=40f7130a671ad5fc15628d9ecf852ece12d013da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this version we can build with Linux 6.8.
Let's also drop local patch that has been upstreamed.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ve-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 41 ----------------------
 package/rtl8189fs/rtl8189fs.hash                   |  2 +-
 package/rtl8189fs/rtl8189fs.mk                     |  2 +-
 3 files changed, 2 insertions(+), 43 deletions(-)

diff --git a/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
deleted file mode 100644
index f9e2d6845d..0000000000
--- a/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f48d99fab8b79e573850067a3ff2d8c16aa95ce1 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 28 Sep 2022 21:17:17 +0200
-Subject: [PATCH] Makefile: move 'EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)' at the
- end of EXTRA_FLAGS assignment
-
-At the moment USER_EXTRA_CFLAGS can't override local Makfile EXTRA_CFLAGS
-since it's assigned at the beginning of the Makefile. For example it's not
-possible to undefine the hardcoded CONFIG_LITTLE_ENDIAN and this doesn't
-allow to build these modules for big endian architectures. So let's move
-the assignment of USER_EXTRA_CFLAGS to EXTRA_CFLAGS after the last
-EXTRA_CFLAGS assignment.
-
-Upstream: https://github.com/jwrdegoede/rtl8189ES_linux/pull/101
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index dfca305..6f91d0a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,4 +1,3 @@
--EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
- EXTRA_CFLAGS += -O1
- #EXTRA_CFLAGS += -O3
- #EXTRA_CFLAGS += -Wall
-@@ -2208,6 +2207,8 @@ ifneq ($(USER_MODULE_NAME),)
- MODULE_NAME := $(USER_MODULE_NAME)
- endif
- 
-+EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
-+
- ifneq ($(KERNELRELEASE),)
- 
- ########### this part for *.mk ############################
--- 
-2.34.1
-
diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index 377812fba8..e3d63ac4b0 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9ff7aa9ee8cd7a8f386531d3b009e7bcbce1ff71bb676c187c40e538755eb8b5  rtl8189fs-75a566a830037c7d1309c5a9fe411562772a1cf2.tar.gz
+sha256  c92e1d800258665835922c1e927708f7a0477a1cbb281dc98ba5d33d5e3271ee  rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index bd29469242..86a2ac734b 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 75a566a830037c7d1309c5a9fe411562772a1cf2
+RTL8189FS_VERSION = 5d523593f41c0b8d723c6aa86b217ee1d0965786
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
