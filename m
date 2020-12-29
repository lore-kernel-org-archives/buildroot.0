From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 14:06:02 +0100
Subject: [Buildroot] [git commit] package/ebtables: add SELinux module
Message-ID: <20201229134643.A827682281@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6db572feac6541758188d7edad3eefe88b1e111
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for ebtables is added in the system/iptables module in the
SELinux refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
