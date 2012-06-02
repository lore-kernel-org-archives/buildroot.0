From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  2 Jun 2012 12:09:03 -0300
Subject: [Buildroot] [PATCH] php: fix build error for snmp extension
Message-ID: <1338649743-27044-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PHP requires that net-snmp be built with the ability to load MIB code,
so force it on when the extension is enabled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/Config.ext |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index fa73bb4..80bab70 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -219,6 +219,7 @@ config BR2_PACKAGE_PHP_EXT_FTP
 config BR2_PACKAGE_PHP_EXT_SNMP
 	bool "SNMP"
 	select BR2_PACKAGE_NETSNMP
+	select BR2_PACKAGE_NETSNMP_ENABLE_MIBS
 	help
 	  SNMP support
 
-- 
1.7.3.4
