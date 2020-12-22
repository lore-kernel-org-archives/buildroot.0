From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Tue, 22 Dec 2020 16:07:27 +0100
Subject: [Buildroot] [PATCH 06/15] package/ipset: add SELinux module
In-Reply-To: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
References: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
Message-ID: <20201222150736.319593-7-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for ipset is added by the system/iptables module in the SELinux
refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
-- 
2.25.4
