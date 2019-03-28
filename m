From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 10:34:56 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/owfs: drop
 unneeded first patch
Message-ID: <20190328093303.9C1BE881B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6474c6a02f2be969d7a6fdc0412e27bec330a35c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Patch is not needed since version 3.1p2 and
https://github.com/owfs/owfs/commit/2982df8ca648bd9cec4d820151046b044ef504e0
because localtime_r is now correctly checked

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ff75269b9aadb34bb7ba4737471a61b4858d726d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-configure.ac-check-for-localtime_r.patch  | 35 ----------------------
 ...> 0001-include-sys-sysmacros.h-for-major.patch} |  0
 package/owfs/owfs.mk                               |  2 +-
 3 files changed, 1 insertion(+), 36 deletions(-)

diff --git a/package/owfs/0001-configure.ac-check-for-localtime_r.patch b/package/owfs/0001-configure.ac-check-for-localtime_r.patch
deleted file mode 100644
index b25aa59878..0000000000
--- a/package/owfs/0001-configure.ac-check-for-localtime_r.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 75e92438bcdb78a90912366b07bf503646806686 Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Sun, 21 Feb 2016 17:02:06 +0100
-Subject: [PATCH] configure.ac: check for localtime_r
-
-HAVE_LOCALTIME_R is used in owftp.c, so it should be checked for.
-
-Without this, static build fails because localtime_r is defined twice.
-
-Upstream-Status: Submitted
-https://sourceforge.net/p/owfs/mailman/message/34873667/
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
-[Bernd: rebased against version 3.2p1]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c22dde9..12fdd18 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1646,7 +1646,7 @@
- AC_FUNC_STRFTIME
- AC_FUNC_STRTOD
- AC_TYPE_SIGNAL
--AC_CHECK_FUNCS([accept daemon getaddrinfo freeaddrinfo gethostbyname2_r gethostbyaddr_r gethostbyname_r getservbyname_r getopt getopt_long gmtime_r gettimeofday localtime_r inet_ntop inet_pton memchr memset select socket strcasecmp strchr strdup strncasecmp strtol strtoul twalk tsearch tfind tdelete tdestroy vasprintf strsep vsprintf vsnprintf writev getline])
-+AC_CHECK_FUNCS([accept daemon getaddrinfo freeaddrinfo gethostbyname2_r gethostbyaddr_r gethostbyname_r getservbyname_r getopt getopt_long gmtime_r gettimeofday localtime_r inet_ntop inet_pton memchr memset select socket strcasecmp strchr strdup strncasecmp strtol strtoul twalk tsearch tfind tdelete tdestroy vasprintf strsep vsprintf vsnprintf writev getline localtime_r])
- 
- save_LIBS="$LIBS"
- LIBS=""
--- 
-2.7.0
-
diff --git a/package/owfs/0002-include-sys-sysmacros.h-for-major.patch b/package/owfs/0001-include-sys-sysmacros.h-for-major.patch
similarity index 100%
rename from package/owfs/0002-include-sys-sysmacros.h-for-major.patch
rename to package/owfs/0001-include-sys-sysmacros.h-for-major.patch
diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index e120147151..2d0f24fb7c 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -9,7 +9,7 @@ OWFS_SITE = http://downloads.sourceforge.net/project/owfs/owfs/$(OWFS_VERSION)
 OWFS_DEPENDENCIES = host-pkgconf
 OWFS_CONF_OPTS = --disable-owperl --without-perl5 --disable-owtcl --without-tcl
 
-# 0001-configure.ac-check-for-localtime_r.patch touches configure.ac
+# We're patching configure.ac
 OWFS_AUTORECONF = YES
 
 # owtcl license is declared in module/ownet/c/src/include/ow_functions.h
