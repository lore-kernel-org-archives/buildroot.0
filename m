From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Jul 2015 19:52:36 -0300
Subject: [Buildroot] [PATCH] pure-ftpd: bump to version 1.0.42
Message-ID: <1438037556-19393-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bzero patch upstream so drop it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...x-building-in-case-of-HAVE_EXPLICIT_BZERO.patch | 40 ----------------------
 package/pure-ftpd/pure-ftpd.hash                   |  2 +-
 package/pure-ftpd/pure-ftpd.mk                     |  2 +-
 3 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 package/pure-ftpd/0002-Fix-building-in-case-of-HAVE_EXPLICIT_BZERO.patch

diff --git a/package/pure-ftpd/0002-Fix-building-in-case-of-HAVE_EXPLICIT_BZERO.patch b/package/pure-ftpd/0002-Fix-building-in-case-of-HAVE_EXPLICIT_BZERO.patch
deleted file mode 100644
index 8117f88..0000000
--- a/package/pure-ftpd/0002-Fix-building-in-case-of-HAVE_EXPLICIT_BZERO.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From f70c363b633229368ed352ce4f599da033cbbdf1 Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Thu, 9 Jul 2015 09:38:25 +0300
-Subject: [PATCH] Fix building in case of HAVE_EXPLICIT_BZERO
-
-Currently if toolchain has implementation of explicit_bzero() and so
-HAVE_EXPLICIT_BZERO gets defined during configuration compilation will
-fail that way:
------------------------------------->8------------------------------
-utils.c: In function 'pure_memzero':
-utils.c:49:1: error: expected declaration or statement at end of input
- }
- ^
------------------------------------->8------------------------------
-
-That happens because closing "#endif" is put 1 line below than really
-meant.
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- src/utils.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/utils.c b/src/utils.c
-index 228a8dc..f41492d 100644
---- a/src/utils.c
-+++ b/src/utils.c
-@@ -25,8 +25,8 @@ void pure_memzero(void * const pnt, const size_t len)
-     while (i < len) {
-         pnt_[i++] = 0U;
-     }
--}
- # endif
-+}
- 
- int pure_memcmp(const void * const b1_, const void * const b2_, size_t len)
- {
--- 
-2.4.3
-
diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index d1f812e..6996290 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	1d48f650f366b8151d86b86c79f4bb874e95143bdac0e767038eda832d28a010	pure-ftpd-1.0.41.tar.bz2
+sha256	efd11295998453e31dbeef9159624beabbac2643a338134ae8c2ef529aa2ec10	pure-ftpd-1.0.42.tar.bz2
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index b49f047..aa65e9e 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.41
+PURE_FTPD_VERSION = 1.0.42
 PURE_FTPD_SITE = http://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
-- 
2.3.6
