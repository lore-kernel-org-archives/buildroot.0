From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 17:10:55 +0100
Subject: [Buildroot] [git commit] busybox: remove actions that depend on
	removed netkit* packages
Message-ID: <20150311161148.92F6981822@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0fb30bc567c91169c5a66f055db731a3c00c7ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Both "netkitbase" and "netkittelnet"  packages were removed by this
commit:
http://git.buildroot.net/buildroot/commit/?id=560fe85bf7fb81956e80848c8bb28d7a6d00a2a2

Now we may safely remove reminders in busybox.mk that depend on
mentioned packages that are no longer in Buildroot.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk |   16 ----------------
 1 files changed, 0 insertions(+), 16 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 61f6a16..a3ac7e7 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -124,20 +124,6 @@ define BUSYBOX_PREFER_STATIC
 endef
 endif
 
-# Disable usage of inetd if netkit-base package is selected
-ifeq ($(BR2_PACKAGE_NETKITBASE),y)
-define BUSYBOX_NETKITBASE
-	$(call KCONFIG_DISABLE_OPT,CONFIG_INETD,$(BUSYBOX_BUILD_CONFIG))
-endef
-endif
-
-# Disable usage of telnetd if netkit-telnetd package is selected
-ifeq ($(BR2_PACKAGE_NETKITTELNET),y)
-define BUSYBOX_NETKITTELNET
-	$(call KCONFIG_DISABLE_OPT,CONFIG_TELNETD,$(BUSYBOX_BUILD_CONFIG))
-endef
-endif
-
 # Disable shadow passwords support if unsupported by the C library
 ifeq ($(BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS),)
 define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
@@ -193,8 +179,6 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_PREFER_STATIC)
 	$(BUSYBOX_SET_MDEV)
 	$(BUSYBOX_SET_CRYPT_SHA)
-	$(BUSYBOX_NETKITBASE)
-	$(BUSYBOX_NETKITTELNET)
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
