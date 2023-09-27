Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86443E82CB7
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34705401F3;
	Wed, 27 Sep 2023 19:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34705401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7tkPwxxE9fTI; Wed, 27 Sep 2023 19:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F0DF42C88;
	Wed, 27 Sep 2023 19:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F0DF42C88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BDD81BF98E
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93952419A9
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93952419A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9QwMPhg3zOkj for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1D3D40B56
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1D3D40B56
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B157882645; Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 21:04:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 757c81f12690449e290078d9a2b8f8191e057616
X-Git-Newrev: 56c7da8e08c141ef078f5e6812c2380d76085baf
X-Patchwork-Hint: ignore
Message-Id: <20230927190533.B157882645@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xxhash: bump to version 0.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=56c7da8e08c141ef078f5e6812c2380d76085baf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop all patches (already in version)
- Update hash of LICENSE file (year updated with
  https://github.com/Cyan4973/xxHash/commit/f035303b8a86c1db9be70cbb638678ef6ef4cb2d)

https://github.com/Cyan4973/xxHash/releases/tag/v0.8.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  4 --
 .../xxhash/0001-fix-man-page-installation.patch    | 66 --------------------
 ...02-Makefile-add-dedicated-install-targets.patch | 71 ----------------------
 ...-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch | 29 ---------
 ...ile-add-install_libxxhash.includes-target.patch | 39 ------------
 package/xxhash/xxhash.hash                         |  4 +-
 package/xxhash/xxhash.mk                           |  2 +-
 7 files changed, 3 insertions(+), 212 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index cb1d333fe3..f7e82ed9e2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1557,10 +1557,6 @@ package/xinetd/0004-configure-rlim_t.patch Upstream
 package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch Upstream
 package/xl2tp/xl2tpd TrailingSpace
 package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch Upstream
-package/xxhash/0001-fix-man-page-installation.patch Upstream
-package/xxhash/0002-Makefile-add-dedicated-install-targets.patch Upstream
-package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch Upstream
-package/xxhash/0004-Makefile-add-install_libxxhash.includes-target.patch Upstream
 package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch Upstream
 package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch Upstream
 package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch Upstream
diff --git a/package/xxhash/0001-fix-man-page-installation.patch b/package/xxhash/0001-fix-man-page-installation.patch
deleted file mode 100644
index 5d2a5a4efa..0000000000
--- a/package/xxhash/0001-fix-man-page-installation.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 836f4e735cf368542f14005e41d2f84ec29dfd60 Mon Sep 17 00:00:00 2001
-From: Yann Collet <yann.collet.73@gmail.com>
-Date: Sat, 4 Dec 2021 10:29:49 -0800
-Subject: [PATCH] fix man page installation
-
-for variant redirectors (`xxh32sum`, `xxh64sum` and `xxh128sum`).
-fix #647, reported by @jpalus.
-
-Also : slightly updated man page text, for clarity and accuracy.
-
-[Retrieved (and updated to keep only Makefile update) from:
-https://github.com/Cyan4973/xxHash/commit/836f4e735cf368542f14005e41d2f84ec29dfd60]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile        | 14 ++++++++------
- cli/xxhsum.1    |  8 ++++----
- cli/xxhsum.1.md |  8 +++++---
- 3 files changed, 17 insertions(+), 13 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 2fbefbc6..63273e16 100644
---- a/Makefile
-+++ b/Makefile
-@@ -457,6 +457,7 @@ endif
- 
- INSTALL_PROGRAM ?= $(INSTALL)
- INSTALL_DATA    ?= $(INSTALL) -m 644
-+INSTALL_DIR     ?= $(INSTALL) -d -m 755
- 
- 
- # Escape special symbols by putting each character into its separate class
-@@ -496,7 +497,7 @@ libxxhash.pc: libxxhash.pc.in
- .PHONY: install
- install: lib libxxhash.pc xxhsum  ## install libraries, CLI, links and man page
- 	@echo Installing libxxhash
--	$(Q)$(INSTALL) -d -m 755 $(DESTDIR)$(LIBDIR)
-+	$(Q)$(INSTALL_DIR) $(DESTDIR)$(LIBDIR)
- 	$(Q)$(INSTALL_DATA) libxxhash.a $(DESTDIR)$(LIBDIR)
- 	$(Q)$(INSTALL_PROGRAM) $(LIBXXH) $(DESTDIR)$(LIBDIR)
- 	$(Q)ln -sf $(LIBXXH) $(DESTDIR)$(LIBDIR)/libxxhash.$(SHARED_EXT_MAJOR)
-@@ -508,19 +509,20 @@ ifeq ($(DISPATCH),1)
- 	$(Q)$(INSTALL_DATA) xxh_x86dispatch.h $(DESTDIR)$(INCLUDEDIR)
- endif
- 	@echo Installing pkgconfig
--	$(Q)$(INSTALL) -d -m 755 $(DESTDIR)$(PKGCONFIGDIR)/
-+	$(Q)$(INSTALL_DIR) $(DESTDIR)$(PKGCONFIGDIR)/
- 	$(Q)$(INSTALL_DATA) libxxhash.pc $(DESTDIR)$(PKGCONFIGDIR)/
- 	@echo Installing xxhsum
--	$(Q)$(INSTALL) -d -m 755 $(DESTDIR)$(BINDIR)/ $(DESTDIR)$(MANDIR)/
-+	$(Q)$(INSTALL_DIR) $(DESTDIR)$(BINDIR)/
- 	$(Q)$(INSTALL_PROGRAM) xxhsum $(DESTDIR)$(BINDIR)/xxhsum
- 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh32sum
- 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh64sum
- 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh128sum
- 	@echo Installing man pages
-+	$(Q)$(INSTALL_DIR) $(DESTDIR)$(MANDIR)/
- 	$(Q)$(INSTALL_DATA) $(MAN) $(DESTDIR)$(MANDIR)/xxhsum.1
--	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh32sum.1
--	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh64sum.1
--	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh128sum.1
-+	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh32sum.1
-+	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh64sum.1
-+	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh128sum.1
- 	@echo xxhash installation completed
- 
- .PHONY: uninstall
diff --git a/package/xxhash/0002-Makefile-add-dedicated-install-targets.patch b/package/xxhash/0002-Makefile-add-dedicated-install-targets.patch
deleted file mode 100644
index 17d34a0823..0000000000
--- a/package/xxhash/0002-Makefile-add-dedicated-install-targets.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 0e7418bce83bb9c236d9cb4535a36a80cd0cc663 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 15 Dec 2021 21:45:14 +0100
-Subject: [PATCH] Makefile: add dedicated install targets
-
-Add dedicated install targets to allow the user to install only xxhsum,
-the static library, the shared library, etc.
-
-This is especially useful on embedded systems where dynamic library is
-not always supported by toolchains
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/Cyan4973/xxHash/commit/db9c199e99f7b4d419647b1ef49c547fc2547516]
----
- Makefile | 18 +++++++++++++++---
- 1 file changed, 15 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 8d4fcd21..5fe72972 100644
---- a/Makefile
-+++ b/Makefile
-@@ -505,11 +505,14 @@ libxxhash.pc: libxxhash.pc.in
-           $< > $@
- 
- 
--.PHONY: install
--install: lib libxxhash.pc xxhsum  ## install libraries, CLI, links and man page
--	@echo Installing libxxhash
-+install_libxxhash.a: libxxhash.a
-+	@echo Installing libxxhash.a
- 	$(Q)$(INSTALL_DIR) $(DESTDIR)$(LIBDIR)
- 	$(Q)$(INSTALL_DATA) libxxhash.a $(DESTDIR)$(LIBDIR)
-+
-+install_libxxhash: libxxhash
-+	@echo Installing libxxhash
-+	$(Q)$(INSTALL_DIR) $(DESTDIR)$(LIBDIR)
- 	$(Q)$(INSTALL_PROGRAM) $(LIBXXH) $(DESTDIR)$(LIBDIR)
- 	$(Q)ln -sf $(LIBXXH) $(DESTDIR)$(LIBDIR)/libxxhash.$(SHARED_EXT_MAJOR)
- 	$(Q)ln -sf $(LIBXXH) $(DESTDIR)$(LIBDIR)/libxxhash.$(SHARED_EXT)
-@@ -519,21 +522,30 @@ install: lib libxxhash.pc xxhsum  ## install libraries, CLI, links and man page
- ifeq ($(DISPATCH),1)
- 	$(Q)$(INSTALL_DATA) xxh_x86dispatch.h $(DESTDIR)$(INCLUDEDIR)
- endif
-+
-+install_libxxhash.pc: libxxhash.pc
- 	@echo Installing pkgconfig
- 	$(Q)$(INSTALL_DIR) $(DESTDIR)$(PKGCONFIGDIR)/
- 	$(Q)$(INSTALL_DATA) libxxhash.pc $(DESTDIR)$(PKGCONFIGDIR)/
-+
-+install_xxhsum: xxhsum
- 	@echo Installing xxhsum
- 	$(Q)$(INSTALL_DIR) $(DESTDIR)$(BINDIR)/
- 	$(Q)$(INSTALL_PROGRAM) xxhsum $(DESTDIR)$(BINDIR)/xxhsum
- 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh32sum
- 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh64sum
- 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh128sum
-+
-+install_man:
- 	@echo Installing man pages
- 	$(Q)$(INSTALL_DIR) $(DESTDIR)$(MANDIR)/
- 	$(Q)$(INSTALL_DATA) $(MAN) $(DESTDIR)$(MANDIR)/xxhsum.1
- 	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh32sum.1
- 	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh64sum.1
- 	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh128sum.1
-+
-+.PHONY: install
-+install: install_libxxhash.a install_libxxhash install_libxxhash.pc install_xxhsum install_man ## install libraries, CLI, links and man page
- 	@echo xxhash installation completed
- 
- .PHONY: uninstall
diff --git a/package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch b/package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch
deleted file mode 100644
index 3b65ae1d6c..0000000000
--- a/package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 6189ecd3d44a693460f86280ccf49d33cb4b18e1 Mon Sep 17 00:00:00 2001
-From: Yann Collet <cyan@fb.com>
-Date: Sun, 26 Dec 2021 15:15:26 -0800
-Subject: [PATCH] do no longer depend on `<assert.h>` for XXH_STATIC_ASSERT
-
-since some versions are buggy.
-
-Use `_Static_assert` instead, which is part of the C11 language.
-[Retrieved from:
-https://github.com/Cyan4973/xxHash/commit/6189ecd3d44a693460f86280ccf49d33cb4b18e1]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- xxhash.h | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/xxhash.h b/xxhash.h
-index 311a69c7..5dfd5c45 100644
---- a/xxhash.h
-+++ b/xxhash.h
-@@ -1749,8 +1749,7 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
- /* note: use after variable declarations */
- #ifndef XXH_STATIC_ASSERT
- #  if defined(__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L)    /* C11 */
--#    include <assert.h>
--#    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { static_assert((c),m); } while(0)
-+#    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { _Static_assert((c),m); } while(0)
- #  elif defined(__cplusplus) && (__cplusplus >= 201103L)            /* C++11 */
- #    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { static_assert((c),m); } while(0)
- #  else
diff --git a/package/xxhash/0004-Makefile-add-install_libxxhash.includes-target.patch b/package/xxhash/0004-Makefile-add-install_libxxhash.includes-target.patch
deleted file mode 100644
index 22c8cdaadf..0000000000
--- a/package/xxhash/0004-Makefile-add-install_libxxhash.includes-target.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From b7c91f761b6d0b79398d0a064d2d6e34de3dfa47 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 27 Dec 2022 23:12:37 +0100
-Subject: [PATCH] Makefile: add install_libxxhash.includes target
-
-Add install_libxxhash.includes to be able to install headers when
-building and installing the static library
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/Cyan4973/xxHash/pull/776]
----
- Makefile | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index cfa5779..2276282 100644
---- a/Makefile
-+++ b/Makefile
-@@ -557,6 +557,8 @@ install_libxxhash: libxxhash
- 	$(Q)$(INSTALL_PROGRAM) $(LIBXXH) $(DESTDIR)$(LIBDIR)
- 	$(Q)ln -sf $(LIBXXH) $(DESTDIR)$(LIBDIR)/libxxhash.$(SHARED_EXT_MAJOR)
- 	$(Q)ln -sf $(LIBXXH) $(DESTDIR)$(LIBDIR)/libxxhash.$(SHARED_EXT)
-+
-+install_libxxhash.includes:
- 	$(Q)$(INSTALL) -d -m 755 $(DESTDIR)$(INCLUDEDIR)   # includes
- 	$(Q)$(INSTALL_DATA) xxhash.h $(DESTDIR)$(INCLUDEDIR)
- 	$(Q)$(INSTALL_DATA) xxh3.h $(DESTDIR)$(INCLUDEDIR) # for compatibility, will be removed in v0.9.0
-@@ -586,7 +588,7 @@ install_man:
- 	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh128sum.1
- 
- .PHONY: install
--install: install_libxxhash.a install_libxxhash install_libxxhash.pc install_xxhsum install_man ## install libraries, CLI, links and man page
-+install: install_libxxhash.a install_libxxhash install_libxxhash.includes install_libxxhash.pc install_xxhsum install_man ## install libraries, CLI, links and man page
- 	@echo xxhash installation completed
- 
- .PHONY: uninstall
--- 
-2.35.1
-
diff --git a/package/xxhash/xxhash.hash b/package/xxhash/xxhash.hash
index 2c99236a45..216d07ddbd 100644
--- a/package/xxhash/xxhash.hash
+++ b/package/xxhash/xxhash.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  3bb6b7d6f30c591dd65aaaff1c8b7a5b94d81687998ca9400082c739a690436c  xxhash-0.8.1.tar.gz
-sha256  553d0035773ddd1590045f8fdc3a4c6ead31e36336721aeca8421e88ed1c9f80  LICENSE
+sha256  baee0c6afd4f03165de7a4e67988d16f0f2b257b51d0e3cb91909302a26a79c4  xxhash-0.8.2.tar.gz
+sha256  6ffedbc0f7878612d2b23589f1ff2ab15633e1df7963a5d9fc750ec5500c7e7a  LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  cli/COPYING
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 75d375a2fa..7708ba1e19 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XXHASH_VERSION = 0.8.1
+XXHASH_VERSION = 0.8.2
 XXHASH_SITE = $(call github,Cyan4973,xxHash,v$(XXHASH_VERSION))
 XXHASH_LICENSE = BSD-2-Clause (library), GPL-2.0+ (xxhsum)
 XXHASH_LICENSE_FILES = LICENSE cli/COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
