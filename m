From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Dec 2017 20:41:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/icu: bump version to 60.1
Message-ID: <20171203194140.8138-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed 0006-i18n-Drop-include-xlocale.h.patch, problem was fixed
upstream with a different solution:
http://bugs.icu-project.org/trac/changeset/40603

Added upstream sha512 hash and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/icu/0006-i18n-Drop-include-xlocale.h.patch | 39 ----------------------
 package/icu/icu.hash                               |  7 ++--
 package/icu/icu.mk                                 |  2 +-
 3 files changed, 4 insertions(+), 44 deletions(-)
 delete mode 100644 package/icu/0006-i18n-Drop-include-xlocale.h.patch

diff --git a/package/icu/0006-i18n-Drop-include-xlocale.h.patch b/package/icu/0006-i18n-Drop-include-xlocale.h.patch
deleted file mode 100644
index a5eb9cb072..0000000000
--- a/package/icu/0006-i18n-Drop-include-xlocale.h.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5f38e4f8c4be351db96a3be23ce25c97597cc508 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Oct 2017 22:41:02 +0200
-Subject: [PATCH] i18n: Drop include <xlocale.h>
-
-glibc 2.26 drops this header
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Reported Upstream: http://bugs.icu-project.org/trac/ticket/13385
-From: https://git.yoctoproject.org/cgit.cgi/poky/commit/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch?id=931430f94c018bc3f58d70e11ca4a4ae7cb2e19c
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
-Upstream-Status: Pending
----
- source/i18n/digitlst.cpp | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/source/i18n/digitlst.cpp b/source/i18n/digitlst.cpp
-index 4d7c3f4..f111cf3 100644
---- a/source/i18n/digitlst.cpp
-+++ b/source/i18n/digitlst.cpp
-@@ -61,11 +61,7 @@
- #endif
- 
- #if U_USE_STRTOD_L
--# if U_PLATFORM_USES_ONLY_WIN32_API || U_PLATFORM == U_PF_CYGWIN
--#   include <locale.h>
--# else
--#   include <xlocale.h>
--# endif
-+# include <locale.h>
- #endif
- 
- // ***************************************************************************
--- 
-2.9.5
-
diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index d10a061322..8b54e22443 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,4 +1,3 @@
-# From http://download.icu-project.org/files/icu4c/59.1/icu4c-src-59_1.md5
-md5 54923fa9fab5b2b83f235fb72523de37  icu4c-59_1-src.tgz
-# Calculated based on the hash above
-sha256 7132fdaf9379429d004005217f10e00b7d2319d0fea22bdfddef8991c45b75fe  icu4c-59_1-src.tgz
+# From http://download.icu-project.org/files/icu4c/60.1/SHASUM512.txt
+sha512 a6798f70add1b3bac2197a49e09a0bb636279af7019ce572f63a30ab713e09657ee9d9b20aac7ea806fbb84667ca2eca981411e5053b47c3c705aa496a669233  icu4c-60_1-src.tgz
+sha256 24c771ce37201a3ab604852e47d10d21595d0493269dd6c8a5e567e998e18c00  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 166890e080..6ac4a25378 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ICU_VERSION = 59.1
+ICU_VERSION = 60.1
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
 ICU_LICENSE = ICU License
-- 
2.11.0
