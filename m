Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD302C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 21:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 743098134C;
	Mon, 13 Dec 2021 21:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6UEh2fqsX2qP; Mon, 13 Dec 2021 21:18:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B79468134E;
	Mon, 13 Dec 2021 21:17:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C5CE1BF97C
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7FF58134D
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QncJhoZWqjY8 for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 21:15:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A908981352
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 21:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D0B5883825; Mon, 13 Dec 2021 21:09:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 20:28:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f18936a78b277c09884d079b8951ae7f9191dd48
X-Git-Newrev: a1ae7121f9ad46402a5dc292012f4417f647bb47
X-Patchwork-Hint: ignore
Message-Id: <20211213210951.D0B5883825@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/iwd: bump to
 version 1.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1ae7121f9ad46402a5dc292012f4417f647bb47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

iwd fails to build since bump of ell to version 0.39 in commit
9988ca9eadb90cbf10d150b420f4d1f5eb38482c:

/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: src/ie.o: in function `ie_parse_data_rates':
ie.c:(.text+0x23ac): undefined reference to `minsize'

This is fixed by
https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=17cf4da72613e80d08d51401399d02683ba8664b

Use official iwd tarball which will contain ell/useful.h header

https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog?h=1.13

Fixes:
 - http://autobuild.buildroot.org/results/44e243530cbcec1c88511bb22f5e8e4655c43824

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 552ba842b73e6ffc97931b2d8fb3c3b7518e3c60)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iwd/iwd.hash |  4 ++--
 package/iwd/iwd.mk   | 14 +++-----------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index b043af745d..7975b0b3ce 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  c0d827f446012cd14e63d174d52b69b0806ae23f0708933d50c57fea64af9c8a  iwd-1.12-br1.tar.gz
+# From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
+sha256  b005f7ed0f0a96a2c6181c44560fc868533a18e7034bd4cb43ea0d40c21b4e7a  iwd-1.13.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index f38552de99..aaa07a25ba 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.12
-IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
-IWD_SITE_METHOD = git
+IWD_VERSION = 1.13
+IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
+IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
 IWD_LICENSE_FILES = COPYING
 IWD_CPE_ID_VENDOR = intel
 IWD_CPE_ID_PRODUCT = inet_wireless_daemon
-# sources from git, no configure script provided
-IWD_AUTORECONF = YES
 IWD_SELINUX_MODULES = networkmanager
 
 IWD_CONF_OPTS = \
@@ -20,12 +18,6 @@ IWD_CONF_OPTS = \
 	--enable-external-ell
 IWD_DEPENDENCIES = ell
 
-# autoreconf requires an existing build-aux directory
-define IWD_MKDIR_BUILD_AUX
-	mkdir -p $(@D)/build-aux
-endef
-IWD_POST_PATCH_HOOKS += IWD_MKDIR_BUILD_AUX
-
 ifeq ($(BR2_PACKAGE_DBUS),y)
 IWD_CONF_OPTS += --enable-dbus-policy --with-dbus-datadir=/usr/share
 IWD_DEPENDENCIES += dbus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
