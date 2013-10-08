From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Oct 2013 20:16:58 +0200
Subject: [Buildroot] [PATCHv3 01/20] glibc: both eglibc and glibc need
	host-gawk
In-Reply-To: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1381256237-27948-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, only the eglibc build was pulling host-gawk as a
dependency, but after more testing, it turns out that the glibc build
also requires host-gawk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/glibc.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

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
-- 
1.8.1.2
