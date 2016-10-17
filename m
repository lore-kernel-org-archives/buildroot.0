From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:41 -0300
Subject: [Buildroot] [PATCH 54/93] libtomcrypt: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-55-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.7.3
