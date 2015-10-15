From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 09:40:20 +0200
Subject: [Buildroot] [git commit] busybox: enable fully featured hush shell
	for nommu
Message-ID: <20151015074026.0457A81EFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80024a76ae45d79c079f6e5c169cb92787f40fc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed by Rich Fekler on IRC the basic hush shell is pretty much
useless since it doesn't support if conditionals, loops, functions, case
or even interactive mode.
So enable the full feature-set.
Size delta: +10184 bytes uncompressed for blackfin fdpic.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 3494456..d3a6fd8 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -89,6 +89,21 @@ define BUSYBOX_SET_MMU
 	$(call KCONFIG_DISABLE_OPT,CONFIG_SWAPONOFF,$(BUSYBOX_BUILD_CONFIG))
 	$(call KCONFIG_DISABLE_OPT,CONFIG_ASH,$(BUSYBOX_BUILD_CONFIG))
 	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_BASH_COMPAT,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_BRACE_EXPANSION,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_HELP,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_INTERACTIVE,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_SAVEHISTORY,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_JOB,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_TICK,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_IF,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_LOOPS,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_CASE,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_FUNCTIONS,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_LOCAL,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_RANDOM_SUPPORT,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_EXPORT_N,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_MODE_X,$(BUSYBOX_BUILD_CONFIG))
 endef
 endif
 
