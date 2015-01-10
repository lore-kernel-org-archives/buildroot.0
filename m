From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 18:45:15 +0100
Subject: [Buildroot] [git commit] iptables: enable basic kernel options
Message-ID: <20150110175417.42C217F95F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2cbda5b6746772be7842fed40d01d61f9f2116b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable the basic kernel options for iptables to be useful at least to
filter incoming connections.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 8256641..a3efbb2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -212,6 +212,11 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SMACK,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK,$(@D)/.config))
+	$(if $(BR2_PACKAGE_IPTABLES),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES,$(@D)/.config))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
