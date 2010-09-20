From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 20 Sep 2010 15:03:15 -0700
Subject: [Buildroot] [PATCH 1/3] dbus: bump to 1.4.0
In-Reply-To: <1285020197-30269-1-git-send-email-Martin.Banky@gmail.com>
References: <1285020197-30269-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285020197-30269-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 .../dbus/dbus-1.2.12-launch-helper-xml-fix.patch   |   33 --------------------
 package/dbus/dbus.mk                               |    2 +-
 2 files changed, 1 insertions(+), 34 deletions(-)
 delete mode 100644 package/dbus/dbus-1.2.12-launch-helper-xml-fix.patch

diff --git a/package/dbus/dbus-1.2.12-launch-helper-xml-fix.patch b/package/dbus/dbus-1.2.12-launch-helper-xml-fix.patch
deleted file mode 100644
index bf6b4ae..0000000
--- a/package/dbus/dbus-1.2.12-launch-helper-xml-fix.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-dbus-daemon-launch-helper: fix build with libxml
-
-dbus-daemon-launch-helper links with the trival config parser, which
-doesn't provide bus_config_parser_check_doctype(), like the big parser does.
-The libxml loader unfortunately wants to call it, so this breaks the build.
-
-Fix it by including a dummy bus_config_parser_check_doctype() in the trivial
-config parser.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- bus/config-parser-trivial.c |    8 ++++++++
- 1 file changed, 8 insertions(+)
-
-Index: dbus-1.2.12/bus/config-parser-trivial.c
-===================================================================
---- dbus-1.2.12.orig/bus/config-parser-trivial.c
-+++ dbus-1.2.12/bus/config-parser-trivial.c
-@@ -310,6 +310,14 @@
-   return &parser->service_dirs;
- }
- 
-+dbus_bool_t
-+bus_config_parser_check_doctype (BusConfigParser   *parser,
-+                                 const char        *doctype,
-+                                 DBusError         *error)
-+{
-+    return TRUE;
-+}
-+
- #ifdef DBUS_BUILD_TESTS
- #include <stdio.h>
- #include "test.h"
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 141cf69..925977a 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,7 +3,7 @@
 # dbus
 #
 #############################################################
-DBUS_VERSION = 1.2.16
+DBUS_VERSION = 1.4.0
 DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_LIBTOOL_PATCH = NO
-- 
1.7.2.3
