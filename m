From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 10 Nov 2020 17:40:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/wlroots: bump to version 0.12.0
Message-ID: <20201110154022.1739043-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wlroots/wlroots.hash | 4 ++--
 package/wlroots/wlroots.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 636f391011..2fab9b30b4 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,5 +1,5 @@
-# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.11.0/wlroots-0.11.0.tar.gz.sig
-sha256  a7645e77229aab4942748c621be8bdb8b073d94f35f3e032b867246862bf2d01  wlroots-0.11.0.tar.gz
+# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.12.0/wlroots-0.12.0.tar.gz.sig
+sha256  c9e9f4f6d2f526d0b2886daf3ec37e64831773059aa669fb98a88522a1626bdb  wlroots-0.12.0.tar.gz
 
 # Hashes for license files:
 sha256  ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index c1771df41d..5665d5a956 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.11.0
+WLROOTS_VERSION = 0.12.0
 WLROOTS_SITE = https://github.com/swaywm/wlroots/releases/download/$(WLROOTS_VERSION)
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
@@ -21,7 +21,7 @@ WLROOTS_DEPENDENCIES = \
 	wayland \
 	wayland-protocols
 
-WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled
+WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled -Dlibseat=disabled
 
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
 WLROOTS_DEPENDENCIES += ffmpeg
-- 
2.29.2
