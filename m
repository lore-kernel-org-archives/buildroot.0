From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 22:57:23 +0200
Subject: [Buildroot] [git commit] glibc: both eglibc and glibc need host-gawk
Message-ID: <20131008213236.C01B29B98A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8664dd43853ee744eb5eefdc48f72750000c1aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, only the eglibc build was pulling host-gawk as a
dependency, but after more testing, it turns out that the glibc build
also requires host-gawk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 48ff0f7..a9e89f1 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -21,12 +21,7 @@ GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICEN
 
 # Before (e)glibc is configured, we must have the first stage
 # cross-compiler and the kernel headers
-GLIBC_DEPENDENCIES = host-gcc-initial linux-headers
-
-# eglibc also needs host-gawk
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
-GLIBC_DEPENDENCIES += host-gawk
-endif
+GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-gawk
 
 # Before (e)glibc is built, we must have the second stage cross-compiler
 glibc-build: host-gcc-intermediate
