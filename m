From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 23:29:59 +0200
Subject: [Buildroot] [git commit] package/wpewebkit: bump to version 2.26.0
Message-ID: <20190928212515.8326D826E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d68b3fa22faa195ebfb415af8ae75a11958052c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a new major release which brings in many improvements and new
features. For a complete list, please refer to the release notes:

  https://wpewebkit.org/release/wpewebkit-2.26.0.html

The new support for accessibility and the Bubblewrap sandbox need
additional dependencies and therefore are explicitly disabled at the
moment.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 4 +++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 8d09930267..7390369b38 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.24.3.tar.xz.sums
-md5 b5c6fe640b03c3e87594da2c0a0a8469 wpewebkit-2.24.3.tar.xz
-sha1 c9ccb6c4c65446e96ed6d534a1556db0fcca8268 wpewebkit-2.24.3.tar.xz
-sha256 907b20907a32a4288cbf67b56eab04cbbd997a7ca0f40b3c466cbbbbfba0e7ca wpewebkit-2.24.3.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.26.0.tar.xz.sums
+md5 59a2e64f145b3445187a22eff1f73293 wpewebkit-2.26.0.tar.xz
+sha1 757ab5da23ef7944332d4c57fcf56a932e933ce4 wpewebkit-2.26.0.tar.xz
+sha256 a97a24fe0c22243c873c359d7636512c01016ea2068a457ba651040f1a07ee3e wpewebkit-2.26.0.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 48ed4f4afe..9db974299b 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.24.3
+WPEWEBKIT_VERSION = 2.26.0
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
@@ -18,7 +18,9 @@ WPEWEBKIT_DEPENDENCIES = host-gperf host-python host-ruby \
 
 WPEWEBKIT_CONF_OPTS = \
 	-DPORT=WPE \
+	-DENABLE_ACCESSIBILITY=OFF \
 	-DENABLE_API_TESTS=OFF \
+	-DENABLE_BUBBLEWRAP_SANDBOX=OFF \
 	-DENABLE_MINIBROWSER=OFF
 
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA),y)
