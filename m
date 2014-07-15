From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 15 Jul 2014 20:43:35 +0200
Subject: [Buildroot] [PATCH 1 of 3 v2] uclibc: rename SETUP_DOT_CONFIG to
	FIXUP_DOT_CONFIG
In-Reply-To: <patchbomb.1405449814@localhost>
References: <patchbomb.1405449814@localhost>
Message-ID: <9634175cf29d7c48d2a6.1405449815@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In a subsequent patch, the behavior of UCLIBC_SETUP_DOT_CONFIG will change
so that it only applies fixups to the (already copied) configuration file.
This patch renames this function to UCLIBC_FIXUP_DOT_CONFIG to better match
the future behavior.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: update commit message (ThomasP)

 package/uclibc/uclibc.mk |  4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff -r c7afd4612342 -r 9634175cf29d package/uclibc/uclibc.mk
--- a/package/uclibc/uclibc.mk	Tue Jul 01 19:39:16 2014 +0200
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
