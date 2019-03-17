From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 10:31:04 +0100
Subject: [Buildroot] [git commit] package/binutils: install libiberty for
 host build
Message-ID: <20190317093858.D9DC28EC53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ec7ba54055919d89afc93606794d161505fa2d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add --enable-install-libiberty to HOST_BINUTILS_CONF_OPTS to allow
prelink-cross to build properly.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 6798356ff2..cfaf0bdeb7 100644
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
