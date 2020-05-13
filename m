From: Lecopzer Chen <lecopzer@gmail.com>
Date: Thu, 14 May 2020 01:02:33 +0800
Subject: [Buildroot] [PATCH 1/1] package/binutils: install libopcodes for
 perf
Message-ID: <20200513170233.2983421-1-lecopzer@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After 5.6.x linux-tool perf installed, it can't be executed due
to lack of libopcodes:

    perf: ...libopcodes-2.33.1.so: cannot open shared object file

Signed-off-by: Lecopzer Chen <lecopzer@gmail.com>
---
 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 876c9c59f8..81308e2e81 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -112,6 +112,7 @@ endef
 ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
 define BINUTILS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
 endef
 endif
-- 
2.25.1
