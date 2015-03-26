From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 26 Mar 2015 10:54:40 -0500
Subject: [Buildroot] [PATCH 1/1] jamvm: add depends on toolchain w/threads
Message-ID: <1427385280-63133-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/jamvm/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
index f480995..1e33f42 100644
--- a/package/jamvm/Config.in
+++ b/package/jamvm/Config.in
@@ -5,13 +5,15 @@ config BR2_PACKAGE_JAMVM
 		|| BR2_mips || BR2_mipsel || BR2_powerpc
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_CLASSPATH
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  JamVM is a new Java Virtual Machine which conforms to the
 	  JVM specification version 2 (blue book).
 
 	  http://jamvm.sf.net
 
-comment "jamvm needs a toolchain w/ IPv6"
+comment "jamvm needs a toolchain w/ IPv6 and threads"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64 \
 		|| BR2_mips || BR2_mipsel || BR2_powerpc
 	depends on !BR2_INET_IPV6
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.1
