From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Jul 2014 12:52:39 -0300
Subject: [Buildroot] [PATCH] polarssl: programs need MMU
Message-ID: <1405439559-26870-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/b53/b535dfda85c8a25c5192c4be7540c4e852fce717/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/polarssl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/polarssl/Config.in b/package/polarssl/Config.in
index 70cde57..90788d8 100644
--- a/package/polarssl/Config.in
+++ b/package/polarssl/Config.in
@@ -17,6 +17,7 @@ if BR2_PACKAGE_POLARSSL
 
 config BR2_PACKAGE_POLARSSL_PROGRAMS
 	bool "polarssl programs"
+	depends on BR2_USE_MMU # fork()
 	help
 	  This option enables the installation and the build of
 	  PolarSSL companion programs: aescrypt2, benchmark, cert_app,
-- 
1.8.5.5
