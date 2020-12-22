From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Tue, 22 Dec 2020 16:07:26 +0100
Subject: [Buildroot] [PATCH 05/15] package/ebtables: add SELinux module
In-Reply-To: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
References: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
Message-ID: <20201222150736.319593-6-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for ebtables is added in the system/iptables module in the
SELinux refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/ebtables/ebtables.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index e8b982206c..93af5085ec 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -8,6 +8,7 @@ EBTABLES_VERSION = 2.0.11
 EBTABLES_SITE = http://ftp.netfilter.org/pub/ebtables
 EBTABLES_LICENSE = GPL-2.0+
 EBTABLES_LICENSE_FILES = COPYING
+EBTABLES_SELINUX_MODULES = iptables
 
 ifeq ($(BR2_PACKAGE_EBTABLES_UTILS_SAVE),y)
 define EBTABLES_INSTALL_TARGET_UTILS_SAVE
-- 
2.25.4
