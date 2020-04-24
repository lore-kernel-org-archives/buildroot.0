From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2020 11:53:33 +0200
Subject: [Buildroot] [git commit] package/libtasn1: needs autoreconf
Message-ID: <20200424094043.F104D8FE98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c30c3043fa2c31727943559139f2a87beb130a35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 6e1fde98e4deda8506e694c6d3ffba3fbd4d1d0e forgot to set
LIBTASN1_AUTORECONF

Fixes:
 - http://autobuild.buildroot.org/results/383e3cba56894df0e3dd53bfe9cee3f4bb80d412

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: add dependency to host-pkgconf]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libtasn1/libtasn1.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index d721e79a6a..9b8260ab48 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -6,10 +6,14 @@
 
 LIBTASN1_VERSION = 4.16.0
 LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
-LIBTASN1_DEPENDENCIES = host-bison
+LIBTASN1_DEPENDENCIES = host-bison host-pkgconf
 LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPL-2.1+ (library)
 LIBTASN1_LICENSE_FILES = LICENSE doc/COPYING doc/COPYING.LESSER
 LIBTASN1_INSTALL_STAGING = YES
+
+# We're patching fuzz/Makefile.am
+LIBTASN1_AUTORECONF = YES
+
 # 'missing' fallback logic botched so disable it completely
 LIBTASN1_CONF_ENV = MAKEINFO="true"
 
