From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 22:48:31 +0200
Subject: [Buildroot] [git commit] package/keyutils: bump to version 1.6.3
Message-ID: <20200930203824.2497C8E3AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebce1630442fa1656dd315a6b5b431642fd58b3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- update home page URL
- change download to new location

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/keyutils/0001-fix-install-rule.patch | 2 +-
 package/keyutils/0002-cifs.patch             | 4 ++--
 package/keyutils/Config.in                   | 2 +-
 package/keyutils/keyutils.hash               | 6 +++---
 package/keyutils/keyutils.mk                 | 5 ++---
 5 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/keyutils/0001-fix-install-rule.patch b/package/keyutils/0001-fix-install-rule.patch
index 26545716cb..b8bad533b2 100644
--- a/package/keyutils/0001-fix-install-rule.patch
+++ b/package/keyutils/0001-fix-install-rule.patch
@@ -11,7 +11,7 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 
 --- keyutils-1.5.9/Makefile.orig	2014-09-22 16:13:41.593562765 +0100
 +++ keyutils-1.5.9/Makefile	2014-09-22 16:14:05.377963952 +0100
-@@ -184,7 +184,7 @@ ifeq ($(NO_SOLIB),0)
+@@ -200,7 +200,7 @@ ifeq ($(NO_SOLIB),0)
  	$(INSTALL) -D $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBNAME)
  	$(LNS) $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
  	mkdir -p $(DESTDIR)$(USRLIBDIR)
diff --git a/package/keyutils/0002-cifs.patch b/package/keyutils/0002-cifs.patch
index b2903f971f..23f8e33126 100644
--- a/package/keyutils/0002-cifs.patch
+++ b/package/keyutils/0002-cifs.patch
@@ -6,8 +6,8 @@ Description: Added 2 cifs helpers to request-key.conf (for CIFS DFS support)
 diff -Naurp keyutils.orig/request-key.conf keyutils/request-key.conf
 --- keyutils.orig/request-key.conf	2008-09-07 23:53:10.000000000 +0000
 +++ keyutils/request-key.conf	2009-02-05 00:53:00.000000000 +0000
-@@ -34,4 +34,6 @@
- create	user	debug:*		negate		/bin/keyctl negate %k 30 %S
+@@ -38,4 +38,6 @@
+ create  user    debug:*         revoked         /bin/keyctl reject %k 30 %c %S
  create	user	debug:loop:*	*		|/bin/cat
  create	user	debug:*		*		/usr/share/keyutils/request-key-debug.sh %k %d %c %S
 +create	cifs.spnego	*	*		/usr/sbin/cifs.upcall -c %k
diff --git a/package/keyutils/Config.in b/package/keyutils/Config.in
index 7813de3799..e4a2e846a1 100644
--- a/package/keyutils/Config.in
+++ b/package/keyutils/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_KEYUTILS
 	  These tools are used to control the key management system
 	  built into the Linux kernel.
 
-	  http://people.redhat.com/~dhowells/keyutils/
+	  https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/
 
 comment "keyutils needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/keyutils/keyutils.hash b/package/keyutils/keyutils.hash
index d6781628cd..35de0c7829 100644
--- a/package/keyutils/keyutils.hash
+++ b/package/keyutils/keyutils.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 d3aef20cec0005c0fa6b4be40079885567473185b1a57b629b030e67942c7115  keyutils-1.6.tar.bz2
-sha256 f46409d4822b2457b39bbd0e7881eecb396130eb8320b7748fa7e9488970aa6d  LICENCE.GPL
-sha256 0d15593e3a8ad90917f8509b5ac1e4b5e5d196434a68029aa9dc0858a4a4c521  LICENCE.LGPL
+sha256  a61d5706136ae4c05bd48f86186bcfdbd88dd8bd5107e3e195c924cfc1b39bb4  keyutils-1.6.3.tar.gz
+sha256  f46409d4822b2457b39bbd0e7881eecb396130eb8320b7748fa7e9488970aa6d  LICENCE.GPL
+sha256  0d15593e3a8ad90917f8509b5ac1e4b5e5d196434a68029aa9dc0858a4a4c521  LICENCE.LGPL
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index c8de3a0dfc..46f06531ce 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-KEYUTILS_VERSION = 1.6
-KEYUTILS_SOURCE = keyutils-$(KEYUTILS_VERSION).tar.bz2
-KEYUTILS_SITE = http://people.redhat.com/~dhowells/keyutils
+KEYUTILS_VERSION = 1.6.3
+KEYUTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/snapshot
 KEYUTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 KEYUTILS_LICENSE_FILES = LICENCE.GPL LICENCE.LGPL
 KEYUTILS_INSTALL_STAGING = YES
