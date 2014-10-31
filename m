From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 31 Oct 2014 15:01:51 +0100
Subject: [Buildroot] [PATCH] package/mono: add threads dependency
Message-ID: <1414764111-21739-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a depends on BR2_TOOLCHAIN_HAS_THREADS.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index f8f4895..cc015e6 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_MONO
 	bool "mono"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_MONO_45 if !BR2_PACKAGE_MONO_20 && !BR2_PACKAGE_MONO_40
 	help
 	  An open source, cross-platform, implementation of C#
@@ -36,5 +37,5 @@ config BR2_PACKAGE_MONO_45
 
 endif
 
-comment "mono needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
+comment "mono needs a toolchain w/ IPv6, threads"
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.1.1
