From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Apr 2015 09:17:30 -0300
Subject: [Buildroot] [PATCH 02/14] package/uclibc: default to Y for IPv6
In-Reply-To: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428754662-27829-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will allow us to remove IPv6 handling in the tree without breaking
things while doing so.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/Config.in | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index fdf8351..5bd9098 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -87,11 +87,8 @@ config BR2_UCLIBC_CONFIG
 	  If unsure, use the default.
 
 config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
-	bool "Enable IPv6 support"
-	select BR2_INET_IPV6
-	help
-	  Enable this option if you want your toolchain to support
-	  IPv6.
+	bool
+	default y
 
 config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
 	bool "Enable RPC support"
-- 
2.0.5
