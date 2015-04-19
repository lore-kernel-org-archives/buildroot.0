From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 09:40:02 -0300
Subject: [Buildroot] [PATCH v2 11/11] toolchain: drop BR2_INET_IPV6
In-Reply-To: <1429447202-13722-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429447202-13722-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429447202-13722-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's no longer used so farewell.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/Config.in      | 5 -----
 toolchain/toolchain-common.in | 4 ----
 2 files changed, 9 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index c4b4a5c..4d464a6 100644
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
 
-- 
2.0.5
