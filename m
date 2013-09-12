From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 00:19:01 +0200
Subject: [Buildroot] [git commit] ipset: add patch for uclinux tuple
Message-ID: <20130912223325.740309B295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c04f21b8238ea79db580b042a849132234f0d8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ipset/ipset-01-uclinux.patch |   26 ++++++++++++++++++++++++++
 package/ipset/ipset.mk               |    1 +
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/ipset/ipset-01-uclinux.patch b/package/ipset/ipset-01-uclinux.patch
new file mode 100644
index 0000000..db8e3fe
--- /dev/null
+++ b/package/ipset/ipset-01-uclinux.patch
@@ -0,0 +1,26 @@
+From 8ec2a85a29817f5aa3f6fb680753d331e2af3591 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 10 Sep 2013 15:28:49 -0300
+Subject: [PATCH] configure: uclinux is also linux
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6b64576..6d06ef5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -14,7 +14,7 @@ LTDL_INIT([nonrecursive])
+ 
+ dnl Shortcut: Linux supported alone
+ case "$host" in
+-*-*-linux*) ;;
++*-*-linux* | *-*-uclinux*) ;;
+ *) AC_MSG_ERROR([Linux systems supported exclusively!]);;
+ esac
+ 
+-- 
+1.8.1.5
+
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index c411a6e..d55d81d 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -9,6 +9,7 @@ IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
 IPSET_CONF_OPT = --with-kmod=no
+IPSET_AUTORECONF = YES
 IPSET_LICENSE = GPLv2
 IPSET_LICENSE_FILES = COPYING
 
