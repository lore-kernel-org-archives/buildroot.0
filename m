From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 21:33:28 +0200
Subject: [Buildroot] [git commit] package/xterm: bump to version 348
Message-ID: <20190915192922.682AF8E557@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=260229eaa3f79cc798783e528670f10089a95bfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace version.c by COPYING in LICENSE_FILES, and add a hash for the
license file.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
[Thomas: drop version.c in the license files, the newly introduced
COPYING file is much better]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xterm/xterm.hash | 4 +++-
 package/xterm/xterm.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index bbd0e11002..4b68e4a85a 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	66fb2f6c35b342148f549c276b12a3aa3fb408e27ab6360ddec513e14376150b	xterm-327.tgz
+sha256 8b1f5121dbf3690de9d85a3b9329e3357021705dd7c21da192e47542769275be xterm-348.tgz
+# Locally calculated
+sha256 b0d302c6d67f63122bbe8d622dd8a66cfadccc32853f606b7558103609201993 COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 201280fd46..9203536b0a 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-XTERM_VERSION = 327
+XTERM_VERSION = 348
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
 XTERM_LICENSE = MIT
-XTERM_LICENSE_FILES = version.c
+XTERM_LICENSE_FILES = COPYING
 XTERM_CONF_OPTS = --enable-256-color \
 	--x-includes=$(STAGING_DIR)/usr/include \
 	--x-libraries=$(STAGING_DIR)/usr/lib
