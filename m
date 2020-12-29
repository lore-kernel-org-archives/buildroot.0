From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 14:06:05 +0100
Subject: [Buildroot] [git commit] package/iptables: add SELinux module
Message-ID: <20201229134643.C4ACD82281@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df2e32cd0648801235a4e3fb157f1e8ab52797ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for iptables is adde by the system/iptables module in the
SELinux refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/iptables/iptables.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index f83165edb9..60b91efb3b 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -12,6 +12,8 @@ IPTABLES_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 IPTABLES_LICENSE = GPL-2.0
 IPTABLES_LICENSE_FILES = COPYING
+IPTABLES_SELINUX_MODULES = iptables
+
 # Building static causes ugly warnings on some plugins
 IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
 	$(if $(BR2_STATIC_LIBS),,--disable-static)
