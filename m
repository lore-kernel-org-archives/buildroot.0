From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue,  3 Apr 2012 10:55:32 +0200
Subject: [Buildroot] [PATCH 4/4] Fix installation of socketcand
In-Reply-To: <cover.1333443312.git.maxime.ripard@free-electrons.com>
References: <cover.1333443312.git.maxime.ripard@free-electrons.com>
Message-ID: <6ba987689f0509f25ac5fdffc3365c9287e97b92.1333443312.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 .../socketcand-replace-cp-by-install.patch         |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/socketcand/socketcand-replace-cp-by-install.patch

diff --git a/package/socketcand/socketcand-replace-cp-by-install.patch b/package/socketcand/socketcand-replace-cp-by-install.patch
new file mode 100644
index 0000000..d66ed71
--- /dev/null
+++ b/package/socketcand/socketcand-replace-cp-by-install.patch
@@ -0,0 +1,25 @@
+From 9d2797ce08034aba0087e6fe45873c3ccd8db489 Mon Sep 17 00:00:00 2001
+From: Maxime Ripard <maxime.ripard@free-electrons.com>
+Date: Tue, 3 Apr 2012 10:35:09 +0200
+Subject: [PATCH] Remove cp -n which might not exist on old system and rely on install instead
+
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+---
+ Makefile.in |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 40d8193..290a8dd 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -38,6 +38,6 @@ install: socketcand
+ 	mkdir -p $(DESTDIR)$(sysroot)$(mandir)
+ 	cp $(srcdir)/socketcand.1 $(DESTDIR)$(sysroot)$(mandir)/
+ 	mkdir -p $(DESTDIR)$(sysroot)/etc/
+-	cp -n $(srcdir)/etc/socketcand.conf $(DESTDIR)$(sysroot)/etc/
++	install -D $(srcdir)/etc/socketcand.conf $(DESTDIR)$(sysroot)/etc/
+ 	if [ $(init_script) = yes ]; then mkdir -p $(DESTDIR)$(sysroot)/etc/init.d; install --mode=755 $(srcdir)/init.d/socketcand $(DESTDIR)$(sysroot)/etc/init.d/socketcand; fi
+ 	if [ $(rc_script) = yes ]; then install --mode=755 $(srcdir)/rc.d/socketcand $(DESTDIR)$(sysroot)/etc/rc.d/socketcand; fi
+-- 
+1.7.4.1
+
-- 
1.7.5.4
