From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 28 Jul 2018 19:24:52 -0400
Subject: [Buildroot] [PATCH v7 1/5] binutils: install libiberty for host
 build.
In-Reply-To: <20180728232456.19550-1-aduskett@gmail.com>
References: <20180728232456.19550-1-aduskett@gmail.com>
Message-ID: <20180728232456.19550-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add --enable-install-libiberty to HOST_BINUTILS_CONF_OPTS to allow
prelink-cross to build properly.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v7:
  - Add patch to series.

 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 090065a3e4..40fe4b394d 100644
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
2.17.1
