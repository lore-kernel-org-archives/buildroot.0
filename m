From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Dec 2017 21:00:41 -0000
Subject: [Buildroot] [git commit] tslib: update to 1.14
Message-ID: <20171201205315.41A717FFA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8624afbb83984cdcb0b0179e9b4a4711c1e56f07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As usual, https://github.com/kergoth/tslib/releases has the changelog
summary.

This release includes a new plugin "lowpass" that is being built by
default; so we add that to the list of statically compiled in plugins
for static builds.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index cca74fc..8184143 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,5 +1,5 @@
-# https://github.com/kergoth/tslib/releases/download/1.13/tslib-1.13.tar.xz.sha256
-sha256  b381279f2d6ad6acb80cfc4852860853b7bcd1a9440821e9fe920c33f4e4f8da  tslib-1.13.tar.xz
+# https://github.com/kergoth/tslib/releases/download/1.14/tslib-1.14.tar.xz.sha256
+sha256  56ce7adfb896442001938470a7f946cc029bfb03ed74e7f62db92d9c9ba83df4  tslib-1.14.tar.xz
 
 # Locally computed
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 06f887a..7a6379c 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.13
+TSLIB_VERSION = 1.14
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
@@ -26,7 +26,8 @@ TSLIB_CONF_OPTS += \
 	--enable-iir=static \
 	--enable-dejitter=static \
 	--enable-debounce=static \
-	--enable-skip=static
+	--enable-skip=static \
+	--enable-lowpass=static
 endif
 
 $(eval $(autotools-package))
