From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 18 Dec 2016 22:06:53 +0200
Subject: [Buildroot] [PATCH] xl2tp: bump to version 1.3.8
Message-ID: <6dfc29f99cf164c784789c53359b7256924b79f8.1482091613.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop obsolete patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/xl2tp/0002-musl.patch | 19 -------------------
 package/xl2tp/xl2tp.hash      |  2 +-
 package/xl2tp/xl2tp.mk        |  2 +-
 3 files changed, 2 insertions(+), 21 deletions(-)
 delete mode 100644 package/xl2tp/0002-musl.patch

diff --git a/package/xl2tp/0002-musl.patch b/package/xl2tp/0002-musl.patch
deleted file mode 100644
index 44238e87d0e5..000000000000
--- a/package/xl2tp/0002-musl.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Fix musl build
-
-Downloaded from
-http://git.alpinelinux.org/cgit/aports/tree/main/xl2tpd/xl2tpd-compile.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -u --recursive src.orig/xl2tpd-1.3.6/xl2tpd.c src/xl2tpd-1.3.6/xl2tpd.c
---- xl2tpd-1.3.6.orig/xl2tpd.c	2014-01-15 21:58:37.000000000 -0100
-+++ xl2tpd-1.3.6/xl2tpd.c	2014-06-21 07:22:21.195278618 -0200
-@@ -33,8 +33,6 @@
- #if (__GLIBC__ < 2)
- # if defined(FREEBSD) || defined(OPENBSD)
- #  include <sys/signal.h>
--# elif defined(LINUX)
--#  include <bsd/signal.h>
- # elif defined(SOLARIS)
- #  include <signal.h>
- # endif
diff --git a/package/xl2tp/xl2tp.hash b/package/xl2tp/xl2tp.hash
index 4b524247dec1..152d615a2ec9 100644
--- a/package/xl2tp/xl2tp.hash
+++ b/package/xl2tp/xl2tp.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  49b069aa8d873e1d8f615ccc4212351e427bf681ba453fdd211256a8345bb7fb  xl2tp-v1.3.6.tar.gz
+sha256  1164b574e93a44c2a2e76c0c68d8d60437bd884a6c964d9c68be1556278e3d2d  xl2tp-v1.3.8.tar.gz
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index 29e2f281e0b7..ff802a4e971b 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XL2TP_VERSION = v1.3.6
+XL2TP_VERSION = v1.3.8
 XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap openssl
 XL2TP_LICENSE = GPLv2
-- 
2.11.0
