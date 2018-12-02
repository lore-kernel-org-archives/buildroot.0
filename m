From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:27 -0000
Subject: [Buildroot] [git commit] linux: enable MICROCODE_INTEL if
 intel-microcode is selected
Message-ID: <20181202071554.8D9E680FDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ca59a6351771d3ebfe45e81a586f4e230961861
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We already turn on kernel features for several packages, so let's do it
for intel-microcode too, otherwise it's impossible to load the microcode
(by means of iucode-tools).

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
