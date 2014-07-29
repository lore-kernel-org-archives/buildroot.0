From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 23:42:52 +0200
Subject: [Buildroot] [git commit] uclibc: rename SETUP_DOT_CONFIG to
	FIXUP_DOT_CONFIG
Message-ID: <20140729214349.B16B59D333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f3c642413416e2761baf68489af5e8bed1d423e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In a subsequent patch, the behavior of UCLIBC_SETUP_DOT_CONFIG will change
so that it only applies fixups to the (already copied) configuration file.
This patch renames this function to UCLIBC_FIXUP_DOT_CONFIG to better match
the future behavior.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 2620a33..ab2e57c 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -393,7 +393,7 @@ UCLIBC_MAKE_FLAGS = \
 	UCLIBC_EXTRA_CFLAGS="$(UCLIBC_EXTRA_CFLAGS) $(TARGET_ABI)" \
 	HOSTCC="$(HOSTCC)"
 
-define UCLIBC_SETUP_DOT_CONFIG
+define UCLIBC_FIXUP_DOT_CONFIG
 	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@D)/.config
 	$(call KCONFIG_SET_OPT,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D)/.config)
 	$(call KCONFIG_ENABLE_OPT,TARGET_$(UCLIBC_TARGET_ARCH),$(@D)/.config)
@@ -433,7 +433,7 @@ define UCLIBC_SETUP_DOT_CONFIG
 endef
 
 define UCLIBC_CONFIGURE_CMDS
-	$(UCLIBC_SETUP_DOT_CONFIG)
+	$(UCLIBC_FIXUP_DOT_CONFIG)
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
