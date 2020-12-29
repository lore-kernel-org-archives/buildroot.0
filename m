From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 14:06:07 +0100
Subject: [Buildroot] [git commit] package/nftables: add SELinux module
Message-ID: <20201229134643.D4CAB82281@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e519794a60aa5b8d50050bf11309fb2d2f14700
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for nft is added by the system/iptables module in the SELinux
refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
