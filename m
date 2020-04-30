From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2020 14:57:46 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/vlc: security
 bump version to 3.0.9.2
Message-ID: <20200430124925.DABF48F06E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b5292d99cc2140fb4e771a99690a47f603999b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes a number of security issues.  For details, see the upstream security
bulletin: https://www.videolan.org/security/sb-vlc309.html

Changelog:
http://git.videolan.org/?p=vlc/vlc-3.0.git;a=blob_plain;f=NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 136f516b41d3d52cfe486e3abad45faff67dfd65)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/0006-Don-t-assume-strerror_l-is-available.patch |  6 +++---
 package/vlc/vlc.hash                                        | 12 ++++++------
 package/vlc/vlc.mk                                          |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/vlc/0006-Don-t-assume-strerror_l-is-available.patch b/package/vlc/0006-Don-t-assume-strerror_l-is-available.patch
index 6775086553..cd839b7379 100644
--- a/package/vlc/0006-Don-t-assume-strerror_l-is-available.patch
+++ b/package/vlc/0006-Don-t-assume-strerror_l-is-available.patch
@@ -11,7 +11,7 @@ Fix compile error
 Code for #else condition was taken from
 http://patches.osdyson.org/patch/series/view/vlc/2.2.0~rc2-1+dyson2/dyson.patch
 
-[Bernd: rebased for vlc-3.0.6]
+[Bernd: rebased for vlc-3.0.6 & 3.0.9.2]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  configure.ac      | 2 +-
@@ -26,8 +26,8 @@ index dfb4c1c329..bfe43512a2 100644
  need_libc=false
  
  dnl Check for usual libc functions
--AC_CHECK_FUNCS([accept4 daemon fcntl flock fstatvfs fork getenv getpwuid_r isatty lstat memalign mkostemp mmap newlocale open_memstream openat pipe2 pread posix_fadvise posix_madvise posix_memalign setlocale stricmp strnicmp strptime uselocale])
-+AC_CHECK_FUNCS([accept4 daemon fcntl flock fstatvfs fork getenv getpwuid_r isatty lstat memalign mkostemp mmap newlocale open_memstream openat pipe2 pread posix_fadvise posix_madvise posix_memalign setlocale strerror_l stricmp strnicmp strptime uselocale])
+-AC_CHECK_FUNCS([accept4 daemon fcntl flock fstatvfs fork getenv getmntent_r getpwuid_r isatty lstat memalign mkostemp mmap newlocale open_memstream openat pipe2 pread posix_fadvise posix_madvise posix_memalign setlocale stricmp strnicmp strptime uselocale])
++AC_CHECK_FUNCS([accept4 daemon fcntl flock fstatvfs fork getenv getmntent_r getpwuid_r isatty lstat memalign mkostemp mmap newlocale open_memstream openat pipe2 pread posix_fadvise posix_madvise posix_memalign setlocale strerror_l stricmp strnicmp strptime uselocale])
  AC_REPLACE_FUNCS([aligned_alloc atof atoll dirfd fdopendir ffsll flockfile fsync getdelim getpid lfind lldiv memrchr nrand48 poll recvmsg rewind sendmsg setenv strcasecmp strcasestr strdup strlcpy strndup strnlen strnstr strsep strtof strtok_r strtoll swab tdestroy tfind timegm timespec_get strverscmp pathconf])
  AC_REPLACE_FUNCS([gettimeofday])
  AC_CHECK_FUNC(fdatasync,,
diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index d1d3e45b0c..9eb8ec9dcb 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,9 +1,9 @@
-# From http://download.videolan.org/pub/videolan/vlc/3.0.8/vlc-3.0.8.tar.xz.sha256
-sha256 e0149ef4a20a19b9ecd87309c2d27787ee3f47dfd47c6639644bc1f6fd95bdf6 vlc-3.0.8.tar.xz
-# From http://download.videolan.org/pub/videolan/vlc/3.0.8/vlc-3.0.8.tar.xz.sha1
-sha1 424a9795e051c198e7fa28107b15809ee6820d43 vlc-3.0.8.tar.xz
-# From http://download.videolan.org/pub/videolan/vlc/3.0.8/vlc-3.0.8.tar.xz.md5
-md5 744442ec0c145453ea1d257914c8072e vlc-3.0.8.tar.xz
+# From https://get.videolan.org/vlc/3.0.9.2/vlc-3.0.9.2.tar.xz.sha256
+sha256 a9bdad293d81cd48516abad8d490d8ab4012964ae541ff19e00021e071e47601 vlc-3.0.9.2.tar.xz
+# From https://get.videolan.org/vlc/3.0.9.2/vlc-3.0.9.2.tar.xz.sha1
+sha1 f68eb80c6cb2baa96279b85f04f08fffc7dbf308 vlc-3.0.9.2.tar.xz
+# From https://get.videolan.org/vlc/3.0.9.2/vlc-3.0.9.2.tar.xz.md5
+md5 bdedd425a7d41dc0664b1e65286c523c vlc-3.0.9.2.tar.xz
 # Locally computed
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 4b1cd68d8b..801b99f884 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.8
+VLC_VERSION = 3.0.9.2
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
