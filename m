From: Paul Cercueil <paul@crapouillou.net>
Date: Wed,  6 Aug 2014 01:00:09 +0200
Subject: [Buildroot] [PATCH 1/2] binutils: Also install libopcodes in staging
Message-ID: <1407279610-15589-1-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This library will be used later in the "lightning" package.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/binutils/binutils.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 4888eeb..d4f6753 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -75,9 +75,11 @@ HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 			$(BINUTILS_DISABLE_GDB_CONF_OPT) \
 			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
-# We just want libbfd and libiberty, not the full-blown binutils in staging
+# We just want libbfd, libiberty and libopcodes,
+# not the full-blown binutils in staging
 define BINUTILS_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
+	$(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
 	$(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
 endef
 
-- 
2.0.1
