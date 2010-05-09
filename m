From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 09 May 2010 15:19:10 +0200
Subject: [Buildroot] [PATCH] package/config: really clean
Message-ID: <20100509131909.25762.77096.stgit@roazhon.bzh.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
---
 package/config/Makefile.kconfig |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/config/Makefile.kconfig b/package/config/Makefile.kconfig
index 6974cc3..6d89e59 100644
--- a/package/config/Makefile.kconfig
+++ b/package/config/Makefile.kconfig
@@ -149,10 +149,15 @@ ifeq ($(gconf-target),1)
 gconf-objs	:= gconf.o kconfig_load.o zconf.tab.o
 endif
 
-clean-files	:= lkc_defs.h qconf.moc .tmp_qtcheck \
-		   .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
-clean-files     += mconf qconf gconf
-clean-files     += config.pot linux.pot
+clean-files := lkc_defs.h qconf.moc .tmp_qtcheck \
+               .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
+clean-files += config.pot linux.pot
+clean-files += conf $(conf-objs)
+clean-files += mconf $(mconf-objs)
+clean-files += qconf qconf.o
+clean-files += gconf gconf.o
+clean-files += kconfig_load.o zconf.tab.o
+clean-files += $(kxgettext-objs)
 
 # Check that we have the required ncurses stuff installed for lxdialog (menuconfig)
 PHONY += $(obj)/dochecklxdialog
