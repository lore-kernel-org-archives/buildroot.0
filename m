From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 21 Sep 2019 00:38:25 +0300
Subject: [Buildroot] [PATCH 3/4] package/wpewebkit: bump to version 2.26.0
In-Reply-To: <20190920213826.2531495-1-aperez@igalia.com>
References: <20190920213826.2531495-1-aperez@igalia.com>
Message-ID: <20190920213826.2531495-4-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a new major release which brings in many improvements and new
features. For a complete list, please refer to the release notes:

  https://wpewebkit.org/release/wpewebkit-2.26.0.html

The new support for accessibility and the Bubblewrap sandbox need
additional dependencies and therefore are explicitly disabled at the
moment.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
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
-- 
2.23.0
