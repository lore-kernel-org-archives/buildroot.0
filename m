From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Apr 2010 22:27:24 +0200
Subject: [Buildroot] [git commit master] uclibc: Enable libresolv and libnsl
	stubs by default for 0.9.31
Message-ID: <20100418202825.BF0492A8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4ab6883ac5aa07ea1c317d85c92495b155cf214a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1555.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                               |    1 +
 toolchain/uClibc/uClibc-0.9.31.config |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8f1b90a..0a275f8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -56,6 +56,7 @@
 	#1459: Misc QA fixes
 	#1489: radvd update to 1.6
 	#1513: Enable powerpc e300c2, e300c3 and e500mc optimization
+	#1555: Fix default uclibc-0.9.31 configuration
 	#1567: openssl0.9.8n fails to compile
 
 2010.02, Release February 26th, 2010:
diff --git a/toolchain/uClibc/uClibc-0.9.31.config b/toolchain/uClibc/uClibc-0.9.31.config
index 8af08d9..a69f5b1 100644
--- a/toolchain/uClibc/uClibc-0.9.31.config
+++ b/toolchain/uClibc/uClibc-0.9.31.config
@@ -138,8 +138,8 @@ UCLIBC_USE_NETLINK=y
 # UCLIBC_HAS_BSD_RES_CLOSE is not set
 UCLIBC_HAS_COMPAT_RES_STATE=y
 # UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
-# UCLIBC_HAS_LIBRESOLV_STUB is not set
-# UCLIBC_HAS_LIBNSL_STUB is not set
+UCLIBC_HAS_LIBRESOLV_STUB=y
+UCLIBC_HAS_LIBNSL_STUB=y
 
 #
 # String and Stdio Support
-- 
1.6.3.3
