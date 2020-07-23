From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 22 Jul 2020 18:08:09 -0700
Subject: [Buildroot] [PATCH 11/12] package/libblockdev: add
 gobject-introspection support
In-Reply-To: <20200723010810.3237608-1-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
Message-ID: <20200723010810.3237608-12-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libblockdev/libblockdev.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 2fd24e6103..da5c76c946 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -21,7 +21,6 @@ LIBBLOCKDEV_DEPENDENCIES = \
 	udev
 
 LIBBLOCKDEV_CONF_OPTS = \
-	--enable-introspection=no \
 	--without-bcache \
 	--without-btrfs \
 	--without-dm \
@@ -50,4 +49,11 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-fs
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBBLOCKDEV_DEPENDENCIES += gobject-introspection
+LIBBLOCKDEV_CONF_OPTS += --enable-introspection=yes
+else
+LIBBLOCKDEV_CONF_OPTS += --enable-introspection=no
+endif
+
 $(eval $(autotools-package))
-- 
2.26.2
