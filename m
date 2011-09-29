From: Rico Bachmann <bachmann@tofwerk.com>
Date: Thu, 29 Sep 2011 11:30:52 +0200
Subject: [Buildroot] [PATCH 2/2] add libfcgi to buildroot
In-Reply-To: <add libfcgi to buildroot>
References: <add libfcgi to buildroot>
Message-ID: <1317288652-1872-1-git-send-email-bachmann@tofwerk.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

added the patches, still not working
could be a problem with the filepath in the patch?

Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
---
 package/libfcgi/Config.in               |    3 ++-
 package/libfcgi/libfcgi.mk              |    2 --
 package/libfcgi/link_math_cgifcgi.patch |   11 +++++++++++
 package/libfcgi/link_math_example.patch |   11 +++++++++++
 4 files changed, 24 insertions(+), 3 deletions(-)
 create mode 100755 package/libfcgi/link_math_cgifcgi.patch
 create mode 100755 package/libfcgi/link_math_example.patch

diff --git a/package/libfcgi/Config.in b/package/libfcgi/Config.in
index 169c6f2..a2f448b 100755
--- a/package/libfcgi/Config.in
+++ b/package/libfcgi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBFCGI
     bool "libfcgi"
     help
-        fastcgi developerslibrary
+        This is a fastcgi developer library for C/C++
         http://www.fastcgi.com/
+
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index e338f29..04c9996 100755
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -7,7 +7,5 @@ LIBFCGI_VERSION = 2.4.0
 LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
 LIBFCGI_SITE = http://www.fastcgi.com/dist
 LIBFCGI_INSTALL_STAGING = YES
-LIBFCGI_INSTALL_TARGET = YES
-LIBFCGI_CONF_OPT = --enable-shared
 
 $(eval $(call AUTOTARGETS,package,libfcgi))
diff --git a/package/libfcgi/link_math_cgifcgi.patch b/package/libfcgi/link_math_cgifcgi.patch
new file mode 100755
index 0000000..add425a
--- /dev/null
+++ b/package/libfcgi/link_math_cgifcgi.patch
@@ -0,0 +1,11 @@
+--- ../../output/build/fcgi-2.4.0/Makefile	2011-09-29 09:03:22.000000000 +0200
++++ ../../output/build/fcgi-2.4.0/Makefile	2011-09-29 09:05:06.000000000 +0200
+@@ -119,7 +119,7 @@
+ 
+ DEFS = -DHAVE_CONFIG_H
+ DEFAULT_INCLUDES =  -I. -I$(srcdir) -I$(top_builddir)
+-LDFLAGS = 
++LDFLAGS = -lm
+ LIBS = -lnsl 
+ depcomp = $(SHELL) $(top_srcdir)/depcomp
+ DEP_FILES = $(DEPDIR)/cgi-fcgi.Po
diff --git a/package/libfcgi/link_math_example.patch b/package/libfcgi/link_math_example.patch
new file mode 100755
index 0000000..fff2595
--- /dev/null
+++ b/package/libfcgi/link_math_example.patch
@@ -0,0 +1,11 @@
+--- ../../output/build/fcgi-2.4.0/Makefile	2011-09-29 09:03:22.000000000 +0200
++++ ../../output/build/fcgi-2.4.0/Makefile	2011-09-29 09:04:37.000000000 +0200
+@@ -171,7 +171,7 @@
+ 
+ DEFS = -DHAVE_CONFIG_H
+ DEFAULT_INCLUDES =  -I. -I$(srcdir) -I$(top_builddir)
+-LDFLAGS = 
++LDFLAGS = -lm
+ LIBS = -lnsl 
+ depcomp = $(SHELL) $(top_srcdir)/depcomp
+ DEP_FILES = $(DEPDIR)/authorizer.Po $(DEPDIR)/echo-cpp.Po \
-- 
1.7.2.5
