From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 13:48:27 -0300
Subject: [Buildroot] [PATCH v2 03/15] package/uclibc: default to Y for
	LARGEFILE
In-Reply-To: <1426610919-11901-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426610919-11901-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426610919-11901-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will allow us to remove largefile handling in the tree without
breaking things while doing so.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/uclibc/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 56fea8a..a180227 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -90,11 +90,9 @@ config BR2_UCLIBC_CONFIG
 	  If unsure, use the default.
 
 config BR2_TOOLCHAIN_BUILDROOT_LARGEFILE
-	bool "Enable large file (files > 2 GB) support"
+	bool
 	select BR2_LARGEFILE
-	help
-	  Enable this option if you want your toolchain to support
-	  files bigger than 2 GB.
+	default y
 
 config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
 	bool "Enable IPv6 support"
-- 
2.0.5
