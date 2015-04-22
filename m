From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 23:07:02 +0200
Subject: [Buildroot] [git commit] toolchain: drop BR2_INET_IPV6
Message-ID: <20150422210725.4EB1A81D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4bcacfd2c05f45171c011d4af7731c6f848819a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's no longer used so farewell.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in      |    5 -----
 toolchain/toolchain-common.in |    4 ----
 2 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 51a1668..b5525e5 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -86,11 +86,6 @@ config BR2_UCLIBC_CONFIG
 	  See also docs/README in this package.
 	  If unsure, use the default.
 
-config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
-	bool
-	select BR2_INET_IPV6
-	default y
-
 config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
 	bool "Enable RPC support"
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 28fb53a..d50c908 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -5,10 +5,6 @@
 # so put it here instead
 source "package/gdb/Config.in.host"
 
-config BR2_INET_IPV6
-	bool
-	default y
-
 config BR2_TOOLCHAIN_HAS_GCC_BUG_58595
 	bool
 
