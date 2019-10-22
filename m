From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 20:40:48 +0200
Subject: [Buildroot] [git commit] package/tslib: update to 1.21
Message-ID: <20191022193052.A8D7C83C16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27cbe1e1969a97124d9f3de7d9e27380024b161d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The release page https://github.com/libts/tslib/releases has the short
changelog overview and we include the added plugin when building statically
linked.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index b250783fda..521e6c94bf 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,5 +1,5 @@
-# https://github.com/libts/tslib/releases/download/1.20/tslib-1.20.tar.xz.sha256
-sha256  fda8c088e348b40cc68269460d562778aa4ad8f8c2281f147b09f305ba714777  tslib-1.20.tar.xz
+# https://github.com/libts/tslib/releases/download/1.21/tslib-1.21.tar.xz.sha256
+sha256  d2a57b823ea59e53a3b130eef05dfed1190b857854f886eec764e1ca1957cf56  tslib-1.21.tar.xz
 
 # Locally computed
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 6d6e85033b..3a1b7a2188 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.20
+TSLIB_VERSION = 1.21
 TSLIB_SITE = https://github.com/libts/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
@@ -28,7 +28,8 @@ TSLIB_CONF_OPTS += \
 	--enable-debounce=static \
 	--enable-skip=static \
 	--enable-lowpass=static \
-	--enable-invert=static
+	--enable-invert=static \
+	--enable-evthres=static
 endif
 
 $(eval $(autotools-package))
