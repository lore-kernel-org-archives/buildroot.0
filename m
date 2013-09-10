From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Sep 2013 16:26:11 -0300
Subject: [Buildroot] [PATCH 02/11] ipset: add patch for uclinux tuple
In-Reply-To: <1378841180-23467-1-git-send-email-gustavo@zacarias.com.ar>
References: <1378841180-23467-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1378841180-23467-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ipset/ipset-01-uclinux.patch | 26 ++++++++++++++++++++++++++
 package/ipset/ipset.mk               |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 package/ipset/ipset-01-uclinux.patch

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
 
-- 
1.8.1.5
