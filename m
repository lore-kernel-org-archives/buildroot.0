From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  5 Feb 2018 21:57:15 +0100
Subject: [Buildroot] [PATCH 4/5] package/glibc: remove GLIBC_SRC_SUBDIR
In-Reply-To: <20180205205716.4279-1-romain.naour@gmail.com>
References: <20180205205716.4279-1-romain.naour@gmail.com>
Message-ID: <20180205205716.4279-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GLIBC_SRC_SUBDIR was needed when Buildroot supported
eglibc which stored all sources in a sub-directory.
It was not removed by the commit removing eglibc support [1].

[1] 500de2598a4902a0e9ec53f7b475046ff17c6681

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.14.3
