From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 14:05:59 +0100
Subject: [Buildroot] [git commit] package/iwd: add SELinux module
Message-ID: <20201229134643.7B3CF8383C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eaa91e96edfe7a8fa692d84a7db8de34cf326388
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for iwd and its configuration files is added by the
services/networkmanager module in the SELinux refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/iwd/iwd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index b1841b5476..b164970196 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -11,6 +11,7 @@ IWD_LICENSE = LGPL-2.1+
 IWD_LICENSE_FILES = COPYING
 # sources from git, no configure script provided
 IWD_AUTORECONF = YES
+IWD_SELINUX_MODULES = networkmanager
 
 IWD_CONF_OPTS = \
 	--disable-manual-pages \
