From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 13 May 2021 19:33:21 +0300
Subject: [Buildroot] [PATCH 2/6] package/wlroots: bump to version 0.13.0
In-Reply-To: <20210513163325.1775639-1-aperez@igalia.com>
References: <20210513163325.1775639-1-aperez@igalia.com>
Message-ID: <20210513163325.1775639-3-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update wlroots to version 0.13.0. This is a release which changes
API/ABI, applications which use wlroots need to be rebuilt. Currently in
Buildroot there is only cage, to be updated by a follow-up patch of the
series.

Additionally, remove usage of the xcb-icccm build option, which is no
longer available.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wlroots/wlroots.hash | 4 ++--
 package/wlroots/wlroots.mk   | 9 +--------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 2fab9b30b4..024ea93cae 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,5 +1,5 @@
-# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.12.0/wlroots-0.12.0.tar.gz.sig
-sha256  c9e9f4f6d2f526d0b2886daf3ec37e64831773059aa669fb98a88522a1626bdb  wlroots-0.12.0.tar.gz
+# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.13.0/wlroots-0.13.0.tar.gz.sig
+sha256  f6bea37fd4a6f5e5f552b83d61adae8c73e64b0bcb9ae0ab464ebcd9309d3cf3  wlroots-0.13.0.tar.gz
 
 # Hashes for license files:
 sha256  ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 0160b1aedb..95fadfef5e 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.12.0
+WLROOTS_VERSION = 0.13.0
 WLROOTS_SITE = https://github.com/swaywm/wlroots/releases/download/$(WLROOTS_VERSION)
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
@@ -53,11 +53,4 @@ else
 WLROOTS_CONF_OPTS += -Dxwayland=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_XCB_UTIL_WM),y)
-WLROOTS_CONF_OPTS += -Dxcb-icccm=enabled
-WLROOTS_DEPENDENCIES += xcb-util-wm
-else
-WLROOTS_CONF_OPTS += -Dxcb-icccm=disabled
-endif
-
 $(eval $(meson-package))
-- 
2.31.1
