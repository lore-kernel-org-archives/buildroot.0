From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Mar 2018 20:07:14 -0000
Subject: [Buildroot] [git commit] package/glibc: remove GLIBC_SRC_SUBDIR
Message-ID: <20180305200711.4D924810D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30daaed1935004661cf54d90dc361a3f1d9d509c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GLIBC_SRC_SUBDIR was needed when Buildroot supported
eglibc which stored all sources in a sub-directory.
It was not removed by the commit removing eglibc support [1].

[1] 500de2598a4902a0e9ec53f7b475046ff17c6681

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index fd79d84f15..cf4bdec065 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -20,10 +20,8 @@ GLIBC_VERSION = glibc-2.26-107-g73a92363619e52c458146e903dfb9b1ba823aa40
 GLIBC_SITE = $(call github,bminor,glibc,$(GLIBC_VERSION))
 endif
 
-GLIBC_SRC_SUBDIR = .
-
 GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
-GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICENSES)
+GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
 
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
@@ -86,7 +84,7 @@ define GLIBC_CONFIGURE_CMDS
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \
 		CXXFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" \
-		$(SHELL) $(@D)/$(GLIBC_SRC_SUBDIR)/configure \
+		$(SHELL) $(@D)/configure \
 		ac_cv_path_BASH_SHELL=/bin/bash \
 		libc_cv_forced_unwind=yes \
 		libc_cv_ssp=no \
