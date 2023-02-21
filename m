Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2960C64EC4
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 20:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57DB1416CE;
	Tue, 21 Feb 2023 20:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57DB1416CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YRSJ51mSVEWX; Tue, 21 Feb 2023 20:02:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FD62416D8;
	Tue, 21 Feb 2023 20:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FD62416D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E1BA1BF362
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65C0F402E4
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65C0F402E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krUhEq49fC_6 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 20:02:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80078400B8
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 20:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80078400B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B5768660C; Tue, 21 Feb 2023 20:02:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 21:01:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: db97a1d196da07d2c1d1f41061dcac851c110915
X-Git-Newrev: ec7258f3f4ea4442cd1f8c78a066a062a4d0cbd0
X-Patchwork-Hint: ignore
Message-Id: <20230221200211.6B5768660C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openmpi: bump to
 version 4.1.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ec7258f3f4ea4442cd1f8c78a066a062a4d0cbd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Notable changes in this commit:

- change from v4.0.x to v4.1.x "current" version series,

- move the sha256 hash out of the "Locally computed" section,
  as the value comes from the download page,

- the LICENSE file hash changed, as the file was updated
  (copyright years updated and new contributors added),

- the IME (Infinite Memory Engine), introduced in v4.1.x,
  is disabled to workaround a failure when cross-compiled,

- the package now requires a toolchain with atomic support,
  and needs to link against libatomic when needed.

For change log since v4.0.0, see:
- https://github.com/open-mpi/ompi/blob/v4.1.4/NEWS#L61

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openmpi/Config.in    |  2 ++
 package/openmpi/openmpi.hash | 10 +++++-----
 package/openmpi/openmpi.mk   | 17 ++++++++++++++---
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/package/openmpi/Config.in b/package/openmpi/Config.in
index 4413c55f9c..e64eb81c3e 100644
--- a/package/openmpi/Config.in
+++ b/package/openmpi/Config.in
@@ -1,5 +1,6 @@
 comment "openmpi needs a toolchain w/ dynamic library, NPTL, wchar, C++"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_sparc
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
@@ -8,6 +9,7 @@ config BR2_PACKAGE_OPENMPI
 	bool "openmpi"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
diff --git a/package/openmpi/openmpi.hash b/package/openmpi/openmpi.hash
index a399adc758..745ed7c580 100644
--- a/package/openmpi/openmpi.hash
+++ b/package/openmpi/openmpi.hash
@@ -1,6 +1,6 @@
-# From: https://www.open-mpi.org/software/ompi/v4.0/
-md5  e3da67df1e968c8798827e0e5fe9a510  openmpi-4.0.0.tar.bz2
-sha1  fee1d0287abfb150bae16957de342752c9bdd4e8  openmpi-4.0.0.tar.bz2
+# From: https://www.open-mpi.org/software/ompi/v4.1/
+md5  f057e12aabaf7dd5a6a658180fca404e  openmpi-4.1.4.tar.bz2
+sha1  357c61a8e06e103d987c0e4a054e8780a034c8b1  openmpi-4.1.4.tar.bz2
+sha256  92912e175fd1234368c8730c03f4996fe5942e7479bb1d10059405e7f2b3930d  openmpi-4.1.4.tar.bz2
 # Locally computed
-sha256  2f0b8a36cfeb7354b45dda3c5425ef8393c9b04115570b615213faaa3f97366b  openmpi-4.0.0.tar.bz2
-sha256  8298a80ed5f09cfd007bae1c0e7d67d1c2810c6389876778dad070c31a691dac  LICENSE
+sha256  2db71de9577ebfe15c186605844c470dcecd3717f4ef0118c9440d801c0f58f8  LICENSE
diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index 8bdc3fa188..f14b55ced5 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -4,14 +4,21 @@
 #
 ################################################################################
 
-OPENMPI_VERSION_MAJOR = 4.0
-OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).0
+OPENMPI_VERSION_MAJOR = 4.1
+OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).4
 OPENMPI_SITE = https://www.open-mpi.org/software/ompi/v$(OPENMPI_VERSION_MAJOR)/downloads
 OPENMPI_SOURCE = openmpi-$(OPENMPI_VERSION).tar.bz2
 OPENMPI_LICENSE = BSD-3-Clause
 OPENMPI_LICENSE_FILES = LICENSE
 OPENMPI_INSTALL_STAGING = YES
 
+# The macro searching for IME (Infinite Memory Engine) filesystem
+# brings "-I/usr/local/include" in the CPPFLAGS, even if not
+# found. This makes the configuration fail. See:
+# https://github.com/open-mpi/ompi/blob/v4.1.4/config/ompi_check_ime.m4#L35
+# Disable explicitly to avoid the issue.
+OPENMPI_CONF_OPTS = --without-ime
+
 # Enabling Fortran support requires pre-seeding the configure script
 # with various values that cannot be guessed, so we provide cache
 # files for various architectures.
@@ -43,6 +50,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 OPENMPI_CFLAGS += -O0
 endif
 
-OPENMPI_CONF_ENV = CFLAGS="$(OPENMPI_CFLAGS)"
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+OPENMPI_LIBS += -latomic
+endif
+
+OPENMPI_CONF_ENV = CFLAGS="$(OPENMPI_CFLAGS)" LIBS="$(OPENMPI_LIBS)"
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
