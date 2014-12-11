From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 09:59:16 +0100
Subject: [Buildroot] [git commit] ipset: bump to version 6.24
Message-ID: <20141211085920.7BFE5801F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5afa3b55e8f7cf27fc4335183fd477871836ca68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...Make_global.am-Don-t-include-host-headers.patch |   29 --------------------
 package/ipset/ipset.hash                           |    4 +-
 package/ipset/ipset.mk                             |    3 +-
 3 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/package/ipset/0002-Make_global.am-Don-t-include-host-headers.patch b/package/ipset/0002-Make_global.am-Don-t-include-host-headers.patch
deleted file mode 100644
index f880979..0000000
--- a/package/ipset/0002-Make_global.am-Don-t-include-host-headers.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1f1b5ed5e8402214a6516a380247123e6dd75d2a Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 28 Oct 2014 00:19:25 +0200
-Subject: [PATCH] Make_global.am: Don't include host headers
-
-This is bad for cross compilation.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- Make_global.am | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/Make_global.am b/Make_global.am
-index 25c4d64715c7..11ea1c333186 100644
---- a/Make_global.am
-+++ b/Make_global.am
-@@ -71,8 +71,7 @@
- #            curr:rev:age
- LIBVERSION = 8:0:5
- 
--AM_CPPFLAGS = $(kinclude_CFLAGS) $(all_includes) -I$(top_srcdir)/include \
--	-I/usr/local/include
-+AM_CPPFLAGS = $(kinclude_CFLAGS) $(all_includes) -I$(top_srcdir)/include
- 
- AM_CFLAGS = -std=gnu99
- 
--- 
-2.1.1
-
diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index 12d61b9..9a79180 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,2 +1,2 @@
-# From ftp://ftp.netfilter.org/pub/ipset/ipset-6.23.tar.bz2.md5sum.txt
-md5	38581e52b47c94a67940351af6ea8d8c	ipset-6.23.tar.bz2
+# From ftp://ftp.netfilter.org/pub/ipset/ipset-6.24.tar.bz2.md5sum.txt
+md5	8831b8f01458bf2abacc222884195a62	ipset-6.24.tar.bz2
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index d3dbc67..be327ec 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-IPSET_VERSION = 6.23
+IPSET_VERSION = 6.24
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
 IPSET_CONF_OPTS = --with-kmod=no
+# For 0001-Do-not-pass-Werror-when-enable-debug-is-used.patch
 IPSET_AUTORECONF = YES
 IPSET_LICENSE = GPLv2
 IPSET_LICENSE_FILES = COPYING
