From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 15 Dec 2018 18:35:52 -0500
Subject: [Buildroot] [PATCH v9 1/4] binutils: install libiberty for host
 build.
Message-ID: <20181215233555.98482-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Add --enable-install-libiberty to HOST_BINUTILS_CONF_OPTS to allow
prelink-cross to build properly.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v7:
  - Add patch to series.

Changes v7 -> v9:
  - None

 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 4531b8d9c8..388e2192b4 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -84,6 +84,7 @@ HOST_BINUTILS_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
 	--disable-shared \
 	--enable-static \
+	--enable-install-libiberty \
 	--with-sysroot=$(STAGING_DIR) \
 	--enable-poison-system-directories \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
-- 
2.19.2
