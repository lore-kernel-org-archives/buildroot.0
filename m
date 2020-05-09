From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 May 2020 23:11:23 +0200
Subject: [Buildroot] [git commit] package/cvs: add license
Message-ID: <20200509205601.E6E47912B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=449ac1b6cb4c29fa2022c7b794db37732228b8d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cvs is an old package, and it shows:

  - CVS is licensed under GPL-1.0+ as stated in README (referenced in source
    code) and COPYING files;

  - COPYING.LIB also give the terms of LGPL-2.0+, and is referenced by a
    few files, like lib/strnlen1.c, mostly vampirised rom older versions
    of the GNU C library (glibc);

  - additionally, the glob implementation was also grabbed from a more
    recent (but still old) glibc version, and is LGPL-2.1+, but there is
    no license file associated with it, so we use the header instead.

Also update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - LGPL-2.0+ is used, reference at least one file
  - LGPL-2.1+ is also used
  - reword commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cvs/cvs.hash | 9 +++++++--
 package/cvs/cvs.mk   | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/cvs/cvs.hash b/package/cvs/cvs.hash
index b386d887b7..7b03a552d0 100644
--- a/package/cvs/cvs.hash
+++ b/package/cvs/cvs.hash
@@ -1,3 +1,8 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cvs/cvs_1.12.13-12%2Bsqueeze1.dsc
-sha256	b5961c2476b996e5758fa5e22b60af085adca41164cac0d8f68a1d3b49d4e4f1	cvs_1.12.13.orig.tar.gz
-sha256	d52a9232d9cf36302a150d782fc7e5b6f92f8115505ae8a7dc6acfc83e809d2f	cvs_1.12.13-12+squeeze1.diff.gz
+sha256  b5961c2476b996e5758fa5e22b60af085adca41164cac0d8f68a1d3b49d4e4f1  cvs_1.12.13.orig.tar.gz
+sha256  d52a9232d9cf36302a150d782fc7e5b6f92f8115505ae8a7dc6acfc83e809d2f  cvs_1.12.13-12+squeeze1.diff.gz
+
+# Hash for license files, locally computed
+sha256  569c5b876327d899cf444b2277fe910128a38ca71d90755fe4125dd44f8ece02  COPYING
+sha256  da0e282103fb508894e78db519aab255e36971ce0bc87de585e3b05014b83b1e  COPYING.LIB
+sha256  ee9a2fbdb626c0ac57fd8e569f357eb2e6d6c80cc6f41efa8bd126d5ea589d72  lib/glob-libc.h
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 6f28b4dbec..563802cc9d 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -8,6 +8,8 @@ CVS_VERSION = 1.12.13
 CVS_SOURCE = cvs_$(CVS_VERSION).orig.tar.gz
 CVS_PATCH = cvs_$(CVS_VERSION)-12+squeeze1.diff.gz
 CVS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cvs
+CVS_LICENSE = GPL-1.0+, LGPL-2.0+, LGPL-2.1+ (glob)
+CVS_LICENSE_FILES = COPYING COPYING.LIB lib/glob-libc.h
 CVS_DEPENDENCIES = ncurses
 
 CVS_CONF_ENV = cvs_cv_func_printf_ptr=yes
