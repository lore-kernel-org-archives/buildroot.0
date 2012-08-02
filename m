From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:53 -0000
Subject: [Buildroot] [git commit branch/next] php: fix build error for snmp
	extension
Message-ID: <20120802195236.098F096AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48189d95001c41969ffddad427aaf73a9b57bc15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

PHP requires that net-snmp be built with the ability to load MIB code,
so force it on when the extension is enabled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
