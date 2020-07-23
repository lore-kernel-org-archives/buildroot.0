From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 22 Jul 2020 18:08:10 -0700
Subject: [Buildroot] [PATCH 12/12] package/udisks: add gobject-introspection
 support
In-Reply-To: <20200723010810.3237608-1-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
Message-ID: <20200723010810.3237608-13-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/udisks/udisks.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index d934b51cfd..44889382e9 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -28,7 +28,6 @@ UDISKS_DEPENDENCIES = \
 UDISKS_CONF_OPTS = \
 	--disable-bcache \
 	--disable-btrfs \
-	--disable-introspection \
 	--disable-iscsi \
 	--disable-lsm \
 	--disable-man \
@@ -39,4 +38,11 @@ UDISKS_DEPENDENCIES += lvm2
 UDISKS_CONF_OPTS += --enable-lvm2
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+UDISKS_DEPENDENCIES += gobject-introspection
+UDISKS_CONF_OPTS += --enable-introspection
+else
+UDISKS_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
-- 
2.26.2
