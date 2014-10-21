From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 21 Oct 2014 18:10:51 -0300
Subject: [Buildroot] [PATCH 2/3] iptables: enable basic kernel options
In-Reply-To: <1413925852-12765-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413925852-12765-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413925852-12765-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable the basic kernel options for iptables to be useful at least to
filter incoming connections.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/linux.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 2b862ec..b9d3c8e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -210,6 +210,11 @@ define LINUX_CONFIGURE_CMDS
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
-- 
2.0.4
