From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Apr 2017 11:04:02 +0200
Subject: [Buildroot] [PATCH] package/dc3dd: fix build with NLS enabled
Message-ID: <20170402090402.32233-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/56e/56eda8289118782de7b8b33f956bfb33b159b86a/
    http://autobuild.buildroot.org/results/b8b/b8b59ab00790ff1b29fb72852e05ef8b402f41ec/
    http://autobuild.buildroot.org/results/ef5/ef581cc3cae46a6ed08c321b575b71e6a384cced/
    [...and a lot more...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Beno?t Allard <benoit.allard@greenbone.net>

---
This one was hard to reproduce, because it would not happen when simply
calling "make dc3dd" alone. A plain "make" was required, to trigger a
hidden dependency, which I am now hunting down...
---
 .../dc3dd/0003-po-fix-build-with-NLS-enabled.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/dc3dd/0003-po-fix-build-with-NLS-enabled.patch

diff --git a/package/dc3dd/0003-po-fix-build-with-NLS-enabled.patch b/package/dc3dd/0003-po-fix-build-with-NLS-enabled.patch
new file mode 100644
index 0000000..3026044
--- /dev/null
+++ b/package/dc3dd/0003-po-fix-build-with-NLS-enabled.patch
@@ -0,0 +1,25 @@
+From 67d8ff286ebd0ea4c8ef5a02a819bbb6b6273ccd Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 2 Apr 2017 10:58:42 +0200
+Subject: [PATCH] po: fix build with NLS enabled
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ po/Makefile.in.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/po/Makefile.in.in b/po/Makefile.in.in
+index 6a39807..2793c7e 100755
+--- a/po/Makefile.in.in
++++ b/po/Makefile.in.in
+@@ -34,6 +34,7 @@ gettextsrcdir = $(datadir)/gettext/po
+ INSTALL = @INSTALL@
+ INSTALL_DATA = @INSTALL_DATA@
+ mkinstalldirs = $(SHELL) @install_sh@ -d
++MKDIR_P = @MKDIR_P@
+ mkdir_p = @mkdir_p@
+ 
+ GMSGFMT_ = @GMSGFMT@
+-- 
+2.9.3
+
-- 
2.9.3
