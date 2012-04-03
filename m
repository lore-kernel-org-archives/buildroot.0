From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 Apr 2012 23:05:42 +0200
Subject: [Buildroot] [git commit] socketcand: fix installation on old systems
Message-ID: <20120403210721.B91A4969F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5fd8f38fbc9742530efeec5f751c28fe7afbf4e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: adjust patch to do install -m 0644 and not -D]
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../socketcand-replace-cp-by-install.patch         |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/socketcand/socketcand-replace-cp-by-install.patch b/package/socketcand/socketcand-replace-cp-by-install.patch
new file mode 100644
index 0000000..4462ddf
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
++	install -m 0644 $(srcdir)/etc/socketcand.conf $(DESTDIR)$(sysroot)/etc/
+ 	if [ $(init_script) = yes ]; then mkdir -p $(DESTDIR)$(sysroot)/etc/init.d; install --mode=755 $(srcdir)/init.d/socketcand $(DESTDIR)$(sysroot)/etc/init.d/socketcand; fi
+ 	if [ $(rc_script) = yes ]; then install --mode=755 $(srcdir)/rc.d/socketcand $(DESTDIR)$(sysroot)/etc/rc.d/socketcand; fi
+-- 
+1.7.4.1
+
