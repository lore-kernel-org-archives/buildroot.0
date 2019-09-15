From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 21:25:39 +0200
Subject: [Buildroot] [git commit] package/xtables-addons: bump to version 3.4
Message-ID: <20190915192528.1CDE18E54D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=133b7a1dd943de8764b7429eb81d2e79b7549ed7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for LICENSE.

This version works with linux kernel 5.0 and newer. It requires
CONFIG_NF_NAT enabled in the kernel configuration, otherwise it fails
to build:

ERROR: "nf_nat_setup_info" [/home/thomas/projets/buildroot/output/build/xtables-addons-3.4/extensions/xt_DNETMAP.ko] undefined!

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
[Thomas: enable CONFIG_NF_NAT in the kernel configuration.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk                             | 3 ++-
 package/xtables-addons/xtables-addons.hash | 7 +++----
 package/xtables-addons/xtables-addons.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 29d2f0ee69..95bde1aba5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -374,7 +374,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
 	$(if $(BR2_PACKAGE_XTABLES_ADDONS),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK,$(@D)/.config)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config))
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT,$(@D)/.config))
 	$(if $(BR2_PACKAGE_WIREGUARD),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INET,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET,$(@D)/.config)
diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index 9aa9c0e539..5ecc4197b7 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,4 +1,3 @@
-# From https://sourceforge.net/projects/xtables-addons/files/Xtables-addons/
-sha1	70ace437ec84d9ec1970505cecf270ed0cbd273e	xtables-addons-2.12.tar.xz
-# Calculated based on the hash above
-sha256	c4865aa1c64c5ff173ff7b5d69425466c71f0f9b5eb5299c52c68bdcd46fa63b	xtables-addons-2.12.tar.xz
+# Locally calculated
+sha256 1152205156ceb4ea02307a361d7c4888f07eabc6bb844bd82e7ffab8d1ebd627 xtables-addons-3.4.tar.xz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6 LICENSE
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 5c3be16052..6b7114f5f7 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 2.12
+XTABLES_ADDONS_VERSION = 3.4
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
