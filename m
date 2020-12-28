From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Mon, 28 Dec 2020 17:11:30 +0100
Subject: [Buildroot] [PATCH v2 10/14] package/mtr: add SELinux module
In-Reply-To: <20201228161134.303992-1-maxime.chevallier@bootlin.com>
References: <20201228161134.303992-1-maxime.chevallier@bootlin.com>
Message-ID: <20201228161134.303992-11-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for mtr is added by the admin/netutils module in the SELinux
refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
-- 
2.25.4
