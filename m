From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Aug 2018 11:37:59 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libssh: bump version to 0.8.1
Message-ID: <20180818093759.26718-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixed broken _SITE, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libssh/libssh.hash | 8 +++-----
 package/libssh/libssh.mk   | 5 +++--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 009a335e3b..7220c337cf 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,3 @@
-# from https://red.libssh.org/projects/libssh/files/
-md5	d3fc864208bf607ad87cdee836894feb	libssh-0.7.5.tar.xz
-# Locally calculated after checking signature on uncompressed libssh-0.7.5.tar
-# https://red.libssh.org/attachments/download/217/libssh-0.7.5.tar.asc
-sha256	54e86dd5dc20e5367e58f3caab337ce37675f863f80df85b6b1614966a337095  libssh-0.7.5.tar.xz
+# Locally calculated after checking pgp signature
+sha256 d17f1267b4a5e46c0fbe66d39a3e702b8cefe788928f2eb6e339a18bb00b1924  libssh-0.8.1.tar.xz
+sha256 468cf08f784ef6fd3b3705b60dd8111e2b70fbb8f6549cd503665a6bbb3bc625  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 34716c502a..4295aa42ee 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIBSSH_VERSION = 0.7.5
+LIBSSH_VERSION_MAJOR = 0.8
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).1
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
-LIBSSH_SITE = https://red.libssh.org/attachments/download/218
+LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
 LIBSSH_LICENSE_FILES = COPYING
 LIBSSH_INSTALL_STAGING = YES
-- 
2.18.0
