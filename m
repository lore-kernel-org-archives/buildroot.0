From: Carlos Santos <casantos@datacom.com.br>
Date: Sun,  4 Nov 2018 19:02:38 -0200
Subject: [Buildroot] [PATCH 1/4] linux: enable MICROCODE_INTEL if
 intel-microcode is selected
In-Reply-To: <20181104210241.20237-1-casantos@datacom.com.br>
References: <20181104210241.20237-1-casantos@datacom.com.br>
Message-ID: <20181104210241.20237-2-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We already turn on kernel features for several packages, so let's do it
for intel-microcode too, otherwise it's impossible to load the microcode
(by means of iucode-tools).

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 linux/linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 476ff16329..b0cdbe933d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -323,6 +323,9 @@ define LINUX_KCONFIG_FIXUP_CMDS
 	$(if $(BR2_PACKAGE_AUDIT),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT,$(@D)/.config))
+	$(if $(BR2_PACKAGE_INTEL_MICROCODE),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE_INTEL,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KTAP),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ENABLE_DEFAULT_TRACERS,$(@D)/.config)
-- 
2.17.1
