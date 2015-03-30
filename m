From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Mar 2015 18:07:22 -0300
Subject: [Buildroot] [PATCH v3 03/15] package/uclibc: default to Y for
	LARGEFILE
In-Reply-To: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427749654-30153-4-git-send-email-gustavo@zacarias.com.ar>
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
index 3fb9b4d..e440559 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -87,11 +87,9 @@ config BR2_UCLIBC_CONFIG
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
