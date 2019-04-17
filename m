From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 17 Apr 2019 20:15:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/xl2tp: bump to version 1.3.14
Message-ID: <20190417181557.26759-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xl2tp/0001-legacy.patch | 17 -----------------
 package/xl2tp/xl2tp.hash        |  2 +-
 package/xl2tp/xl2tp.mk          |  2 +-
 3 files changed, 2 insertions(+), 19 deletions(-)
 delete mode 100644 package/xl2tp/0001-legacy.patch

diff --git a/package/xl2tp/0001-legacy.patch b/package/xl2tp/0001-legacy.patch
deleted file mode 100644
index 5279fd7079..0000000000
--- a/package/xl2tp/0001-legacy.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Replace SUSV3-specific functions index, bcopy, bzero and bcmp by their
-POSIX variants.
-
---- l2tpd-0.70-pre20031121.oorig/osport.h	2004-07-08 22:47:52.000000000 +0200
-+++ l2tpd-0.70-pre20031121/osport.h	2006-12-28 15:32:50.000000000 +0100
-@@ -37,4 +37,11 @@
- 
- #endif /* defined(SOLARIS) */
- 
-+#if defined __UCLIBC__ && !defined UCLIBC_SUSV3_LEGACY_MACROS
-+# define index(x, y)        strchr(x, y)
-+# define bcopy(S1, S2, LEN) ((void)memmove(S2, S1, LEN))
-+# define bzero(S1, LEN)     ((void)memset(S1,  0, LEN))
-+# define bcmp(S1,S2,LEN)    ((memcmp(S2, S1, LEN)==0)?0:1)
-+#endif /* defined __UCLIBC__ && !defined UCLIBC_SUSV3_LEGACY_MACROS */
-+
- #endif /* _OSPORT_H_ */
diff --git a/package/xl2tp/xl2tp.hash b/package/xl2tp/xl2tp.hash
index 9cc76e9d25..22955b0f78 100644
--- a/package/xl2tp/xl2tp.hash
+++ b/package/xl2tp/xl2tp.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  6f0ac50a76500d5cc56a67451b61e5f561b3309357176b39deabb1705e8745fd  xl2tp-v1.3.12.tar.gz
+sha256  ff5a0806fecc58c7b9cbc625117a4521c0546522a5f5951ffb6eebdab998610f  xl2tp-v1.3.14.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index 63c798d886..a75b2abda8 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XL2TP_VERSION = v1.3.12
+XL2TP_VERSION = v1.3.14
 XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap
 XL2TP_LICENSE = GPL-2.0
-- 
2.20.1
