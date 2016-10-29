From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 14:31:58 +0200
Subject: [Buildroot] [git commit] bellagio: add patch to fix installation
	path of documentation
Message-ID: <20161029123302.F0E91802A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba781d347ca56f723786275f5c2b5172f7cf6ccb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/c026551c6b3483d98dd2507c7529a0be8ff79007/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../bellagio/0005-fix-doc-installation-path.patch  | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/bellagio/0005-fix-doc-installation-path.patch b/package/bellagio/0005-fix-doc-installation-path.patch
new file mode 100644
index 0000000..06b0743
--- /dev/null
+++ b/package/bellagio/0005-fix-doc-installation-path.patch
@@ -0,0 +1,24 @@
+Makefile.am: fix bogus docdir definition
+
+The definition of the docdir variable uses $(DESTDIR). However,
+automake already prefixes all *dir variables automatically with
+DESTDIR, which causes the documentation to be installed in
+$(DESTDIR)/$(DESTDIR)/usr/share/doc/...
+
+Fix this by removing the $(DESTDIR) part of the docdir definition.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile.am
+===================================================================
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -7,7 +7,7 @@
+ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = libomxil-bellagio.pc
+ 
+-docdir = $(DESTDIR)$(prefix)/share/doc/@PACKAGE@
++docdir = $(prefix)/share/doc/@PACKAGE@
+ doc_DATA = README \
+ 	   ChangeLog \
+ 	   TODO
