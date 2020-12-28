From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Mon, 28 Dec 2020 17:11:27 +0100
Subject: [Buildroot] [PATCH v2 07/14] package/nftables: add SELinux module
In-Reply-To: <20201228161134.303992-1-maxime.chevallier@bootlin.com>
References: <20201228161134.303992-1-maxime.chevallier@bootlin.com>
Message-ID: <20201228161134.303992-8-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for nft is added by the system/iptables module in the SELinux
refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/nftables/nftables.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 8a003a5e34..f9468c5250 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -11,6 +11,7 @@ NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NFTABLES_LICENSE = GPL-2.0
 NFTABLES_LICENSE_FILES = COPYING
 NFTABLES_CONF_OPTS = --disable-man-doc --disable-pdf-doc
+NFTABLES_SELINUX_MODULES = iptables
 
 ifeq ($(BR2_PACKAGE_GMP),y)
 NFTABLES_DEPENDENCIES += gmp
-- 
2.25.4
