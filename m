From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat,  5 Jul 2014 18:08:02 -0300
Subject: [Buildroot] [PATCH] libnl: Move the pthread dependency menu comment
Message-ID: <1404594482-17618-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order for this comment to be properly displayer, it must be moved to be
at the end of the file.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 package/libnl/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libnl/Config.in b/package/libnl/Config.in
index 1173278..74a2e79 100644
--- a/package/libnl/Config.in
+++ b/package/libnl/Config.in
@@ -6,9 +6,6 @@ config BR2_PACKAGE_LIBNL
 
 	  http://people.suug.ch/~tgr/libnl/
 
-comment "libnl needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
 if BR2_PACKAGE_LIBNL
 
 config BR2_PACKAGE_LIBNL_TOOLS
@@ -20,5 +17,7 @@ config BR2_PACKAGE_LIBNL_TOOLS
 
 comment "libnl tools need a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
-
 endif
+
+comment "libnl needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.1
