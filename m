From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 14:09:16 +0100
Subject: [Buildroot] [git commit] package/mtr: add SELinux module
Message-ID: <20201229134644.0E1358383C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e13ead2d7f529bdb621e4e00c8b1df28329c548
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for mtr is added by the admin/netutils module in the SELinux
refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mtr/mtr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index 7a4b140267..263482534e 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -11,5 +11,6 @@ MTR_CONF_OPTS = --without-gtk
 MTR_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_NCURSES),ncurses)
 MTR_LICENSE = GPL-2.0
 MTR_LICENSE_FILES = COPYING
+MTR_SELINUX_MODULES = netutils
 
 $(eval $(autotools-package))
