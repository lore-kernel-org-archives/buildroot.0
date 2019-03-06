From: Norbert Lange <nolange79@gmail.com>
Date: Wed,  6 Mar 2019 17:33:16 +0100
Subject: [Buildroot] [PATCH] package/musl: remove rcrt1.o from target
 installation
Message-ID: <20190306163316.6117-1-norbert.lange@andritz.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Norbert Lange <nolange79@gmail.com>

Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
---
 package/musl/musl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 90c753926e..ff807c0cba 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -58,7 +58,7 @@ endef
 define MUSL_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) install-libs
-	$(RM) $(addprefix $(TARGET_DIR)/lib/,crt1.o crtn.o crti.o Scrt1.o)
+	$(RM) $(addprefix $(TARGET_DIR)/lib/,crt1.o crtn.o crti.o rcrt1.o Scrt1.o)
 endef
 
 $(eval $(generic-package))
-- 
2.20.1
