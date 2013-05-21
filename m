From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 21 May 2013 14:29:05 +0100
Subject: [Buildroot] [PATCH] jamvm: Restrict MIPS BE and MIPS64 cores
Message-ID: <1369142945-15964-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

The configure.ac script is only looking for mipsel-*-linux so restrict
unsupported MIPS cores.

Fixes the following problem:

configure: error: mips-buildroot-linux-uclibc not supported

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/jamvm/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 mode change 100644 => 100755 package/jamvm/Config.in

diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
old mode 100644
new mode 100755
index 0287f80..955dcf6
--- a/package/jamvm/Config.in
+++ b/package/jamvm/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_JAMVM
 	bool "jamvm"
-	depends on BR2_INET_IPV6
+	depends on BR2_INET_IPV6 && !BR2_mips && !BR2_mips64 && !BR2_mips64el
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_CLASSPATH
 	help
-- 
1.8.2.1
