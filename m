From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 22 Jun 2014 09:27:45 -0300
Subject: [Buildroot] [PATCH] faifa: needs threads
Message-ID: <1403440065-19554-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/a93/a93395c656169e0f08f471f12bc05f29c9ea2976/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/faifa/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/faifa/Config.in b/package/faifa/Config.in
index 2acd505..23133b7 100644
--- a/package/faifa/Config.in
+++ b/package/faifa/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FAIFA
 	bool "faifa"
 	select BR2_PACKAGE_LIBPCAP
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Faifa can configure any Intellon-based Power Line
 	  Communication device using Intellon INT5000 and INT6000
@@ -11,5 +12,5 @@ config BR2_PACKAGE_FAIFA
 
 	  https://dev.open-plc.org
 
-comment "faifa needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+comment "faifa needs a toolchain w/ dynamic library, threads"
+	depends on BR2_PREFER_STATIC_LIB || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.5.5
