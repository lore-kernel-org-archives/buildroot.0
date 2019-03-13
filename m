From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 13 Mar 2019 19:11:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/ngircd: bump to version 25
Message-ID: <20190313181134.2530-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ngircd/0001-Fix-Get_error-usage.patch | 44 ---------------------------
 package/ngircd/ngircd.hash                    |  3 +-
 package/ngircd/ngircd.mk                      |  2 +-
 3 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 package/ngircd/0001-Fix-Get_error-usage.patch

diff --git a/package/ngircd/0001-Fix-Get_error-usage.patch b/package/ngircd/0001-Fix-Get_error-usage.patch
deleted file mode 100644
index 3724e46d89..0000000000
--- a/package/ngircd/0001-Fix-Get_error-usage.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 543f44bff8d56785dc13a74a14d4eaa96465bf05 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Wed, 13 Sep 2017 14:07:11 +0200
-Subject: [PATCH] Fix Get_error usage
-
-The usage of Get_Error is guarded by "ifdef h_errno" in this file, the
-definition of this function should follow the same rules.
-
-Fixes a build error when cross-compiling:
-https://github.com/ngircd/ngircd/issues/223
-
-Patch sent upstream: https://github.com/ngircd/ngircd/pull/240
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/ngircd/resolve.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/src/ngircd/resolve.c b/src/ngircd/resolve.c
-index 32791901..e1903254 100644
---- a/src/ngircd/resolve.c
-+++ b/src/ngircd/resolve.c
-@@ -108,9 +108,7 @@ Resolve_Name( PROC_STAT *s, const char *Host, void (*cbfunc)(int, short))
- 	return false;
- } /* Resolve_Name */
- 
--
--#if !defined(HAVE_GETADDRINFO) || !defined(HAVE_GETNAMEINFO)
--#if !defined(WANT_IPV6) && defined(h_errno)
-+#ifdef h_errno
- static char *
- Get_Error( int H_Error )
- {
-@@ -128,7 +126,6 @@ Get_Error( int H_Error )
- 	return "unknown error";
- }
- #endif
--#endif
- 
- 
- /* Do "IDENT" (aka "AUTH") lookup and append result to resolved_addr array */
--- 
-2.11.0
-
diff --git a/package/ngircd/ngircd.hash b/package/ngircd/ngircd.hash
index 128867bfd8..3772bd6c16 100644
--- a/package/ngircd/ngircd.hash
+++ b/package/ngircd/ngircd.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 173fa0ea10788a8ba08ef2f7e64ea8951d7c88862e744128c8b87bae424b1008  ngircd-24.tar.xz
+sha256 c4997cae3e3dd6ff6a605ca274268f2b8c9ba0b1a96792c7402e5594222eee4e  ngircd-25.tar.xz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 9b330fab53..5fa86afdd5 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGIRCD_VERSION = 24
+NGIRCD_VERSION = 25
 NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
 NGIRCD_SITE = https://arthur.barton.de/pub/ngircd
 NGIRCD_LICENSE = GPL-2.0+
-- 
2.14.1
