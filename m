From: Daniel Mack <zonque@gmail.com>
Date: Mon, 30 May 2011 20:24:38 +0200
Subject: [Buildroot] [PATCH] packages: dbus: use version 1.4.8
Message-ID: <1306779878-20243-1-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The exisiting br2 patch can be dropped.

Signed-off-by: Daniel Mack <zonque@gmail.com>
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
index 153e72b..7d75ca8 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,7 +3,7 @@
 # dbus
 #
 #############################################################
-DBUS_VERSION = 1.2.24
+DBUS_VERSION = 1.4.8
 DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_INSTALL_STAGING = YES
-- 
1.7.5.1
