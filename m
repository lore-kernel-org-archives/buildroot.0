From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 14:06:04 +0100
Subject: [Buildroot] [git commit] package/ipset: add SELinux module
Message-ID: <20201229134643.B85BF82281@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e935601d70a1dd118fc130e1af4280c467ecea70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for ipset is added by the system/iptables module in the SELinux
refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ipset/ipset.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 869763d322..03ef1667f4 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -12,5 +12,6 @@ IPSET_CONF_OPTS = --with-kmod=no
 IPSET_LICENSE = GPL-2.0
 IPSET_LICENSE_FILES = COPYING
 IPSET_INSTALL_STAGING = YES
+IPSET_SELINUX_MODULES = iptables
 
 $(eval $(autotools-package))
