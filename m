From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] libtomcrypt: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132038.822BA819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae8f0a375fc72e43b8797729ca23a3ab1b471a09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtomcrypt/libtomcrypt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index 53dbfd5..8cc02b2 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -17,11 +17,11 @@ LIBTOMCRYPT_CFLAGS = -I./src/headers $(TARGET_CFLAGS) -DLTC_SOURCE -DLTM_DESC \
 	$(if $(BR2_USE_WCHAR),,-DLTC_NO_WCHAR)
 
 define LIBTOMCRYPT_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(LIBTOMCRYPT_CFLAGS)"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(LIBTOMCRYPT_CFLAGS)"
 endef
 
 define LIBTOMCRYPT_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" NODOCS=1 INSTALL_USER=$(shell id -u) INSTALL_GROUP=$(shell id -g) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" NODOCS=1 INSTALL_USER=$(shell id -u) INSTALL_GROUP=$(shell id -g) install
 endef
 
 $(eval $(generic-package))
