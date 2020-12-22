From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Tue, 22 Dec 2020 16:07:28 +0100
Subject: [Buildroot] [PATCH 07/15] package/iptables: add SELinux module
In-Reply-To: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
References: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
Message-ID: <20201222150736.319593-8-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for iptables is adde by the system/iptables module in the
SELinux refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/iptables/iptables.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 442639f159..eb0f0f60a4 100644
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
-- 
2.25.4
