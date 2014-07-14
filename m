From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 14 Jul 2014 13:50:28 +0200
Subject: [Buildroot] [PATCH 4 of 6] uclibc: rename SETUP_DOT_CONFIG to
	FIXUP_DOT_CONFIG
In-Reply-To: <patchbomb.1405338624@localhost>
References: <patchbomb.1405338624@localhost>
Message-ID: <1f15cd84996d1bb6fb3a.1405338628@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To better match the actual behavior, rename function UCLIBC_SETUP_DOT_CONFIG
to UCLIBC_FIXUP_DOT_CONFIG.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/uclibc/uclibc.mk |  4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff -r 0b5a6fcf97ef -r 1f15cd84996d package/uclibc/uclibc.mk
--- a/package/uclibc/uclibc.mk	Wed Jul 09 20:45:46 2014 +0200
+++ b/package/uclibc/uclibc.mk	Wed Jul 02 21:31:07 2014 +0200
@@ -393,7 +393,7 @@
 	UCLIBC_EXTRA_CFLAGS="$(UCLIBC_EXTRA_CFLAGS) $(TARGET_ABI)" \
 	HOSTCC="$(HOSTCC)"
 
-define UCLIBC_SETUP_DOT_CONFIG
+define UCLIBC_FIXUP_DOT_CONFIG
 	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@D)/.config
 	$(call KCONFIG_SET_OPT,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D)/.config)
 	$(call KCONFIG_ENABLE_OPT,TARGET_$(UCLIBC_TARGET_ARCH),$(@D)/.config)
@@ -433,7 +433,7 @@
 endef
 
 define UCLIBC_CONFIGURE_CMDS
-	$(UCLIBC_SETUP_DOT_CONFIG)
+	$(UCLIBC_FIXUP_DOT_CONFIG)
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
