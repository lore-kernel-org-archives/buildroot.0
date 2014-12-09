From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Tue,  9 Dec 2014 02:44:36 +0100
Subject: [Buildroot] [PATCH 2/2] package/musl: remove obsolete setting of
	prefix
In-Reply-To: <1418089476-15360-1-git-send-email-jkrause@posteo.de>
References: <1418089476-15360-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418089476-15360-2-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using the config option '--libdir=/lib' makes the setting of prefix to an
empty path obsolete in MUSL_INSTALL_TARGET_CMDS.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/musl/musl.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 3a45575..1f1af05 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -40,11 +40,9 @@ define MUSL_INSTALL_STAGING_CMDS
 		DESTDIR=$(STAGING_DIR) install-libs install-tools install-headers
 endef
 
-# prefix is set to an empty value to get the C library installed in
-# /lib and not /usr/lib
 define MUSL_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) prefix= install-libs
+		DESTDIR=$(TARGET_DIR) install-libs
 	$(RM) $(addprefix $(TARGET_DIR)/lib/,crt1.o crtn.o crti.o Scrt1.o)
 endef
 
-- 
2.1.3
