From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 28 May 2013 12:41:26 +0100
Subject: [Buildroot] [PATCH] jamvm: Not available for all architectures
Message-ID: <1369741286-11470-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

jamvm supports arm, armeb, powerpc, i386, x86_64 and mipsel.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/jamvm/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
index 0287f80..3a2bd20 100644
--- a/package/jamvm/Config.in
+++ b/package/jamvm/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_JAMVM
 	bool "jamvm"
 	depends on BR2_INET_IPV6
+	depends on BR2_arm || BR2_armeb || BR2_i386 \
+		|| BR2_mipsel || BR2_powerpc || BR2_x86_64
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_CLASSPATH
 	help
-- 
1.8.2.1
