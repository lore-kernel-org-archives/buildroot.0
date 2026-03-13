Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38A8107BCED
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 22:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B736140F16;
	Fri, 13 Mar 2026 22:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6bVdX5wRdgn; Fri, 13 Mar 2026 22:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A08EE40F39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773442253;
	bh=nLitkCKXxeVZTrDlVrQWcz/99oPtqEEBrdkYgFE+Yk4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fQUpI7QZAHcOxKEftI4K4hxQkdaFwCn7n2cLcKkmBuRH1xOCvuQPoWipbU6wGGtx9
	 5nxRS97Z828OUg+RHOFJHTIM6f7fdHkWmGsWherBNW1IvFucqlUWJ6Qod3/uIF3BHZ
	 JaByr78uKuAdL5lZ7lWvQRXfvNtqwrPRlQW4l3DqYqsZC19zkaTbW5ml//tRohP8VH
	 fFuLiqdSKS0x0d4BqcQkfXleZzQKBfQZyVKuExEBc0WHB4kgG1LDK5Q0W3TSm6H+Dj
	 27YeKfRkF1vIEFrd4Mt2/YuP8MVNf/OKuV0taJsjPdnTYzWh/I0OONI4rhpBmJrjZ8
	 Pxoq64sc3IPVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A08EE40F39;
	Fri, 13 Mar 2026 22:50:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2CC0786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B2EE81D34
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMkqzkCUv9ji for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8866581D68
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8866581D68
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F0E487396; Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 23:29:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c03712d8ec3fcffadb9486084c1e92e4736059b0
X-Git-Newrev: 3ce11070cb42f1819d1ff296a4600d314bdc126d
X-Patchwork-Hint: ignore
Message-Id: <20260313225044.9F0E487396@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xfsprogs: bump version to 6.18.0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ce11070cb42f1819d1ff296a4600d314bdc126d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/doc/CHANGES?h=v6.18.0

This commit refreshes the patch 0001 (rebase and update upstream link
to lore mailing list). It also removes the patch 0002 included in
this new version and removes the corresponding _AUTORECONF and
_POST_CONFIGURE_HOOKS.

Also, the upstream commit [1] introduced a usage of the "capacity"
field of zoned block devices, introduced in Kernel commit [2],
first included in v5.9. For this reason, this commit adds the new
dependency to BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9.

For that reason, this commit updates the test_xfsprogs runtime test
to switch to a Bootlin external toolchain, which includes Kernel
headers that meet this new requirement.

Finally, this commit also updates this runtime test Kernel version
to the LTS 6.18.9. This is because the default filesystem options
of mkfs.xfs were updated in upstream commit [3] to include new
features supported in the new Kernel 6.18.y LTS series. The commit [3]
is included in xfsprogs v6.18.

[1] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=48ccc2459039309cfbaf358febea53a86f07827c
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=82394db7383d33641f3f565bd79792fb41b1741f
[3] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=54aad16b4b9b923442b4042afaba4438ca1aa868

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...crub-do-not-do-dynamic-linking-of-libtool.patch | 12 +++---
 ...e-additionally-get-icu-uc-from-pkg-config.patch | 47 ----------------------
 package/xfsprogs/Config.in                         |  4 +-
 package/xfsprogs/xfsprogs.hash                     |  2 +-
 package/xfsprogs/xfsprogs.mk                       | 11 +----
 5 files changed, 11 insertions(+), 65 deletions(-)

diff --git a/package/xfsprogs/0001-mdrestore-scrub-do-not-do-dynamic-linking-of-libtool.patch b/package/xfsprogs/0001-mdrestore-scrub-do-not-do-dynamic-linking-of-libtool.patch
index cb30e68db4..434658307c 100644
--- a/package/xfsprogs/0001-mdrestore-scrub-do-not-do-dynamic-linking-of-libtool.patch
+++ b/package/xfsprogs/0001-mdrestore-scrub-do-not-do-dynamic-linking-of-libtool.patch
@@ -1,4 +1,4 @@
-From fa3a4e036c8c78325216ed21eff6145aeb186686 Mon Sep 17 00:00:00 2001
+From e09511b7cf91c6c00b72c568571d0b0984acd381 Mon Sep 17 00:00:00 2001
 From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Date: Wed, 25 Nov 2015 10:50:00 +0000
 Subject: [PATCH] mdrestore, scrub: do not do dynamic linking of libtool
@@ -11,12 +11,12 @@ linking for libuuid only. Otherwise the build will fail like this:
 ld: attempted static link of dynamic object `/usr/lib/libuuid.so'
 
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Upstream: Proposed: https://www.spinics.net/lists/xfs/msg36149.html
+Upstream: Proposed: https://lore.kernel.org/linux-xfs/1448449838-47261-1-git-send-email-Vincent.Riera@imgtec.com/
 [baruch: update for v4.15.1; extend to include scrub]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 [matt: update for v4.16.1; adjusted libunistring -> libicu]
 Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
-[Julien: rebased on v6.4.0]
+[Julien: rebased on v6.18.0]
 Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  mdrestore/Makefile | 2 +-
@@ -37,10 +37,10 @@ index 4a932efb..7ea1fd45 100644
  default: depend $(LTCOMMAND)
  
 diff --git a/scrub/Makefile b/scrub/Makefile
-index aba14ed2..f0ef492f 100644
+index 6375d77a..26414491 100644
 --- a/scrub/Makefile
 +++ b/scrub/Makefile
-@@ -71,7 +71,7 @@ xfs_scrub.c
+@@ -90,7 +90,7 @@ xfs_scrub.c
  LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBICU_LIBS) $(LIBRT) $(LIBURCU) \
  	$(LIBPTHREAD)
  LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG)
@@ -50,5 +50,5 @@ index aba14ed2..f0ef492f 100644
  ifeq ($(HAVE_MALLINFO),yes)
  LCFLAGS += -DHAVE_MALLINFO
 -- 
-2.45.2
+2.52.0
 
diff --git a/package/xfsprogs/0002-configure-additionally-get-icu-uc-from-pkg-config.patch b/package/xfsprogs/0002-configure-additionally-get-icu-uc-from-pkg-config.patch
deleted file mode 100644
index 714d1e1257..0000000000
--- a/package/xfsprogs/0002-configure-additionally-get-icu-uc-from-pkg-config.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0b3e7284c7fa20dd27f8a584f8db417d1d6fa27b Mon Sep 17 00:00:00 2001
-From: Alyssa Ross <hi@alyssa.is>
-Date: Fri, 14 Feb 2025 09:45:10 +0100
-Subject: configure: additionally get icu-uc from pkg-config
-
-Upstream libicu changed its pkgconfig files[0] in version 76 to require
-callers to call out to each .pc file they need for the libraries they
-want to link against.  This apparently reduces overlinking, at a cost of
-needing the world to fix themselves up.
-
-This patch fixes the following build error with icu 76, also seen by
-Fedora[1]:
-
-	    /bin/ld: unicrash.o: undefined reference to symbol 'uiter_setString_76'
-	    /bin/ld: /lib/libicuuc.so.76: error adding symbols: DSO missing from command line
-	    collect2: error: ld returned 1 exit status
-	    make[2]: *** [../include/buildrules:65: xfs_scrub] Error 1
-	    make[1]: *** [include/buildrules:35: scrub] Error 2
-
-Link: https://github.com/unicode-org/icu/commit/199bc827021ffdb43b6579d68e5eecf54c7f6f56 [0]
-Link: https://src.fedoraproject.org/rpms/xfsprogs/c/624b0fdf7b2a31c1a34787b04e791eee47c97340 [1]
-Signed-off-by: Alyssa Ross <hi@alyssa.is>
-Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
-
-Upstream: https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=0b3e7284c7fa20dd27f8a584f8db417d1d6fa27b
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- m4/package_icu.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-(limited to 'm4/package_icu.m4')
-
-diff --git a/m4/package_icu.m4 b/m4/package_icu.m4
-index 3ccbe0cc98..6b89c874f1 100644
---- a/m4/package_icu.m4
-+++ b/m4/package_icu.m4
-@@ -1,5 +1,5 @@
- AC_DEFUN([AC_HAVE_LIBICU],
--  [ PKG_CHECK_MODULES([libicu], [icu-i18n], [have_libicu=yes], [have_libicu=no])
-+  [ PKG_CHECK_MODULES([libicu], [icu-i18n icu-uc], [have_libicu=yes], [have_libicu=no])
-     AC_SUBST(have_libicu)
-     AC_SUBST(libicu_CFLAGS)
-     AC_SUBST(libicu_LIBS)
--- 
-cgit 1.2.3-korg
-
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 1a29579d8b..1ecffa3e0e 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -1,7 +1,8 @@
-comment "xfsprogs needs a toolchain w/ threads, C++"
+comment "xfsprogs needs a toolchain w/ threads, headers >= 5.9, C++"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9 || \
 		!BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_XFSPROGS
@@ -10,6 +11,7 @@ config BR2_PACKAGE_XFSPROGS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP # liburcu
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9 # blkzoned.h (capacity)
 	select BR2_PACKAGE_INIH
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index a86693419d..24c2e20a7e 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
-sha256  dae3bb432196f7b183b2e6bd5dc44bf33edbd7d0e85bd37d25c235df81b8100a  xfsprogs-6.11.0.tar.xz
+sha256  3a6dc7b1245ce9bccd197bab00691f1b190bd3694d3ccc301d21b83afc133199  xfsprogs-6.18.0.tar.xz
 
 # Hash for license files
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 552ff69bd6..ab78f8e2cc 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,21 +4,12 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 6.11.0
+XFSPROGS_VERSION = 6.18.0
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
 XFSPROGS_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
 
-# 0002-configure-additionally-get-icu-uc-from-pkg-config.patch
-XFSPROGS_AUTORECONF = YES
-
-# restore upstream install-sh script overwritten by autoreconf
-define XFSPROGS_FIX_INSTALL_SH
-	mv $(@D)/install-sh~ $(@D)/install-sh
-endef
-XFSPROGS_POST_CONFIGURE_HOOKS = XFSPROGS_FIX_INSTALL_SH
-
 XFSPROGS_DEPENDENCIES = inih liburcu util-linux
 
 XFSPROGS_CONF_ENV = ac_cv_header_aio_h=yes ac_cv_lib_rt_lio_listio=yes PLATFORM="linux"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
