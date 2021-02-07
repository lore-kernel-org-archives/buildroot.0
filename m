From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:43:18 +0100
Subject: [Buildroot] [git commit] package/libbytesize: bump version to 2.5
Message-ID: <20210207092319.66EB281964@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d51f520bca7ff06a6c98bb52b2d90160805f0844
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/storaged-project/libbytesize/releases/tag/2.4
https://github.com/storaged-project/libbytesize/releases/tag/2.5

Removed patch which was applied upstream:
https://github.com/storaged-project/libbytesize/commit/f2b6600f5483fc68c46d596d578be10546f5ac43

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-remove-msgcat-dependency.patch            | 36 ----------------------
 package/libbytesize/libbytesize.hash               |  2 +-
 package/libbytesize/libbytesize.mk                 |  5 +--
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/libbytesize/0001-remove-msgcat-dependency.patch b/package/libbytesize/0001-remove-msgcat-dependency.patch
deleted file mode 100644
index 4c9b96020e..0000000000
--- a/package/libbytesize/0001-remove-msgcat-dependency.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ac16b1a905dbdb06ac7bba6ac105686aa7958093 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Fri, 24 Jul 2020 11:49:14 -0700
-Subject: [PATCH] remove msgcat dependency
-
-Gettext-tiny does not include the msgcat utility, which causes issues when
-building libbytesize for embedded systems, as many embedded systems do not
-build the full gettext, but instead use the gettext-tiny library.
-
-Because msgcat is not needed to build libbytesize, it's safe to remove the
-dependency.
-
-Upstream-status: pending
-https://github.com/storaged-project/libbytesize/pull/76
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
----
- configure.ac | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2ec4062..7d7f218 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -13,8 +13,7 @@ AC_CONFIG_MACRO_DIR([m4])
- AC_PATH_PROG([XGETTEXT], [xgettext])
- AC_PATH_PROG([MSGFMT], [msgfmt])
- AC_PATH_PROG([MSGMERGE], [msgmerge])
--AC_PATH_PROG([MSGCAT], [msgcat])
--AS_IF([test -z "$XGETTEXT" -o -z "$MSGFMT" -o -z "$MSGMERGE" -o -z "$MSGCAT"],
-+AS_IF([test -z "$XGETTEXT" -o -z "$MSGFMT" -o -z "$MSGMERGE"],
-       [AC_MSG_FAILURE([gettext not found])])
- 
- # Define this so gettext.h works without requiring the whole gettext macro
--- 
-2.26.2
-
diff --git a/package/libbytesize/libbytesize.hash b/package/libbytesize/libbytesize.hash
index 34cb3b210f..51fa43aef1 100644
--- a/package/libbytesize/libbytesize.hash
+++ b/package/libbytesize/libbytesize.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3c74113fc8cd1a2fbd8870fa0ed7cef2ef24d60ef91e7145fbc041f9aa144479  libbytesize-2.3.tar.gz
+sha256  6305addae2b7be313dbfc36b96094ec0544d5144859ab4a5685ca6d314d6fdda  libbytesize-2.5.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libbytesize/libbytesize.mk b/package/libbytesize/libbytesize.mk
index b1309c1731..0ba380dc74 100644
--- a/package/libbytesize/libbytesize.mk
+++ b/package/libbytesize/libbytesize.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-LIBBYTESIZE_VERSION = 2.3
+LIBBYTESIZE_VERSION = 2.5
 LIBBYTESIZE_SITE = https://github.com/storaged-project/libbytesize/releases/download/$(LIBBYTESIZE_VERSION)
 LIBBYTESIZE_LICENSE = LGPL-2.1+
 LIBBYTESIZE_LICENSE_FILES = LICENSE
 LIBBYTESIZE_INSTALL_STAGING = YES
 
-# 0001-remove-msgcat-dependency.patch
-LIBBYTESIZE_AUTORECONF = YES
-
 LIBBYTESIZE_DEPENDENCIES = \
 	host-pkgconf \
 	host-gettext \
