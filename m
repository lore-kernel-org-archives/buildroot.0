Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88086C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3207E41581;
	Mon, 27 Jun 2022 22:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3207E41581
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0NUjnc3fF_v8; Mon, 27 Jun 2022 22:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E202403B4;
	Mon, 27 Jun 2022 22:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E202403B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17DB51BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6F644155F
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6F644155F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kMsQD5xRvuCO for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:43:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B61DC4159A
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B61DC4159A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4714487705; Mon, 27 Jun 2022 22:30:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 00:42:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b7f8da96be549a52630cd87b30851d600f163a4
X-Git-Newrev: b1fe952835ba0113f0f6f4f54686e29d6e1fc73b
X-Patchwork-Hint: ignore
Message-Id: <20220627223026.4714487705@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libusb: bump to version 1.0.26
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
Content-Type: multipart/mixed; boundary="===============4122121673520956359=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4122121673520956359==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b1fe952835ba0113f0f6f4f54686e29d6e1fc73b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstreamed patches.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Peter: drop _AUTORECONF]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-configure.ac-link-with-latomic-if-needed.patch | 39 ----------------------
 ...linux_usbfs-fix-maybe-uninitialized-error.patch | 37 --------------------
 package/libusb/libusb.hash                         |  2 +-
 package/libusb/libusb.mk                           |  4 +--
 4 files changed, 2 insertions(+), 80 deletions(-)

diff --git a/package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch b/package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch
deleted file mode 100644
index 5f6c88e57d..0000000000
--- a/package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0b857081d687f7ee41483a3d7e9846af44a5ba7d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 7 Feb 2022 11:55:54 +0100
-Subject: [PATCH] configure.ac: link with -latomic if needed
-
-libusb unconditionally uses atomic_fetch_add since version 1.0.25 and
-https://github.com/libusb/libusb/commit/1a08aa84d96397a3840a75abe66051f5360c2c84
-https://github.com/libusb/libusb/commit/eed8a371ea53939096ba94d44001e0637d042572
-but some architectures (e.g. sparc) needs to link with -latomic to be
-able to use it. So check if -latomic is needed and update libusb-1.0.pc
-accordingly to avoid the following build failure with openocd:
-
-/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.so: undefined reference to `__atomic_fetch_add_4'
-collect2: error: ld returned 1 exit status
-
-Fixes:
- - http://autobuild.buildroot.org/results/4a27a769bb3cdf78643c3049b87d792178d6512c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/libusb/libusb/pull/1064]
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index f6cf2f9..002bcf6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -152,6 +152,7 @@ if test "x$platform" = xposix; then
- 	AC_SEARCH_LIBS([pthread_create], [pthread],
- 		[test "x$ac_cv_search_pthread_create" != "xnone required" && AC_SUBST(THREAD_LIBS, [-lpthread])],
- 		[], [])
-+	AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
- elif test "x$platform" = xwindows; then
- 	AC_DEFINE([PLATFORM_WINDOWS], [1], [Define to 1 if compiling for a Windows platform.])
- else
--- 
-2.34.1
-
diff --git a/package/libusb/0002-linux_usbfs-fix-maybe-uninitialized-error.patch b/package/libusb/0002-linux_usbfs-fix-maybe-uninitialized-error.patch
deleted file mode 100644
index ea299081aa..0000000000
--- a/package/libusb/0002-linux_usbfs-fix-maybe-uninitialized-error.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From bea5891591402f14940a607eafbdcd169ff8827f Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Sun, 6 Feb 2022 07:12:14 +0100
-Subject: [PATCH] linux_usbfs: fix maybe-uninitialized error
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Initialize active_config to an invalid value to avoid the following
-compilation error:
-
-os/linux_usbfs.c: In function ‘op_get_configuration’:
-os/linux_usbfs.c:1452:12: error: ‘active_config’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
- 1452 |  *config = (uint8_t)active_config;
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-Upstream: https://github.com/libusb/libusb/pull/1062
----
- libusb/os/linux_usbfs.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libusb/os/linux_usbfs.c b/libusb/os/linux_usbfs.c
-index c300675..285d9ca 100644
---- a/libusb/os/linux_usbfs.c
-+++ b/libusb/os/linux_usbfs.c
-@@ -1429,7 +1429,7 @@ static int op_get_configuration(struct libusb_device_handle *handle,
- 	uint8_t *config)
- {
- 	struct linux_device_priv *priv = usbi_get_device_priv(handle->dev);
--	int active_config;
-+	int active_config = -1; /* to please compiler */
- 	int r;
- 
- 	if (priv->sysfs_dir) {
--- 
-2.17.0
-
diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
index a18935fe03..bbb0ccf5b9 100644
--- a/package/libusb/libusb.hash
+++ b/package/libusb/libusb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8a28ef197a797ebac2702f095e81975e2b02b2eeff2774fa909c78a74ef50849  libusb-1.0.25.tar.bz2
+sha256  12ce7a61fc9854d1d2a1ffe095f7b5fac19ddba095c259e6067a46500381b5a5  libusb-1.0.26.tar.bz2
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index aa306e295d..98a4a578b2 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_VERSION_MAJOR = 1.0
-LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).25
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).26
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPL-2.1+
@@ -13,8 +13,6 @@ LIBUSB_LICENSE_FILES = COPYING
 LIBUSB_CPE_ID_VENDOR = libusb
 LIBUSB_DEPENDENCIES = host-pkgconf
 LIBUSB_INSTALL_STAGING = YES
-# We're patching configure.ac
-LIBUSB_AUTORECONF = YES
 
 # Avoid the discovery of udev for the host variant
 HOST_LIBUSB_CONF_OPTS = --disable-udev

--===============4122121673520956359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4122121673520956359==--
