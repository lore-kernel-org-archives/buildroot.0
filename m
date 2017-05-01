From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  1 May 2017 15:59:42 +0300
Subject: [Buildroot] [PATCH 2/4] bluez5_utils: correct the experimental
	option text
In-Reply-To: <cover.1493643541.git.baruch@tkos.co.il>
References: <cover.1493643541.git.baruch@tkos.co.il>
Message-ID: <f1815a98614986509ae602f348e2218ecaef1d25.1493643541.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In BlueZ 5.44 the --enable-experimental configure option only controls the
build of the Nokia OBEX PC Suite plugin. Correct the option prompt and help
text.

Cc: Marcin Bis <marcin@bis.org.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/bluez5_utils/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 285560aee9be..f8e3540ec5e9 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -57,9 +57,9 @@ config BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED
 	  ciptool, gatttool.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
-	bool "build experimental plugins"
+	bool "build experimental obexd plugin"
 	help
-	  Build BlueZ 5.x experimental plugins (SAP, NFC, ...).
+	  Build BlueZ 5.x experimental Nokia OBEX PC Suite plugin
 
 config BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS
 	bool "build sixaxis plugin"
-- 
2.11.0
