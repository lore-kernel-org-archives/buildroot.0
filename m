From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 09:55:00 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot:
	package/database/mysql_client package/da etc...
Message-ID: <20090130095500.37AF3765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-30 09:54:59 +0000 (Fri, 30 Jan 2009)
New Revision: 25160

Log:
readline: s/BR2_READLINE/BR2_PACKAGE_READLINE/

Package configs should start with BR2_PACKAGE_.

Modified:
   trunk/buildroot/package/database/mysql_client/Config.in
   trunk/buildroot/package/database/sqlite/Config.in
   trunk/buildroot/package/ipsec-tools/Config.in
   trunk/buildroot/package/lua/Config.in
   trunk/buildroot/package/php/Config.ext
   trunk/buildroot/package/readline/Config.in
   trunk/buildroot/package/readline/readline.mk
   trunk/buildroot/scripts/test/Config.in.test.buildall
   trunk/buildroot/target/device/ARMLTD/integrator926/integrator926_defconfig
   trunk/buildroot/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
   trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig
   trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
   trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
   trunk/buildroot/target/device/KwikByte/kb9202/kb9202_defconfig
   trunk/buildroot/target/device/valka/v100sc2_defconfig
   trunk/buildroot/target/device/x86/i686/i386_defconfig
   trunk/buildroot/target/device/x86/i686/i686_defconfig


Changeset:
Modified: trunk/buildroot/package/database/mysql_client/Config.in
===================================================================
--- trunk/buildroot/package/database/mysql_client/Config.in	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/package/database/mysql_client/Config.in	2009-01-30 09:54:59 UTC (rev 25160)
@@ -2,7 +2,7 @@
 	bool "MySQL 5.1 client"
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_NCURSES
-	select BR2_READLINE
+	select BR2_PACKAGE_READLINE
 	help
 	  MySQL client
 

Modified: trunk/buildroot/package/database/sqlite/Config.in
===================================================================
--- trunk/buildroot/package/database/sqlite/Config.in	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/package/database/sqlite/Config.in	2009-01-30 09:54:59 UTC (rev 25160)
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SQLITE
 	bool "sqlite"
 	select BR2_PACKAGE_NCURSES
-	select BR2_READLINE
+	select BR2_PACKAGE_READLINE
 	help
 	  SQLite is a small C library that implements a self-contained,
 	  embeddable, zero-configuration SQL database engine.

Modified: trunk/buildroot/package/ipsec-tools/Config.in
===================================================================
--- trunk/buildroot/package/ipsec-tools/Config.in	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/package/ipsec-tools/Config.in	2009-01-30 09:54:59 UTC (rev 25160)
@@ -51,7 +51,7 @@
 
 config BR2_PACKAGE_IPSEC_TOOLS_READLINE
 	depends on BR2_PACKAGE_IPSEC_TOOLS
-	select BR2_READLINE
+	select BR2_PACKAGE_READLINE
 	bool "Enable readline input support if available."
 
 config BR2_PACKAGE_IPSEC_TOOLS_LIBS

Modified: trunk/buildroot/package/lua/Config.in
===================================================================
--- trunk/buildroot/package/lua/Config.in	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/package/lua/Config.in	2009-01-30 09:54:59 UTC (rev 25160)
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUA
 	bool "lua"
-	select BR2_READLINE
+	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_NCURSES
 	help
 	  Lua is a powerful, fast, light-weight, embeddable scripting language.

Modified: trunk/buildroot/package/php/Config.ext
===================================================================
--- trunk/buildroot/package/php/Config.ext	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/package/php/Config.ext	2009-01-30 09:54:59 UTC (rev 25160)
@@ -86,7 +86,7 @@
 
 config BR2_PACKAGE_PHP_EXT_READLINE
 	bool "readline"
-	depends on BR2_PACKAGE_PHP && (BR2_PACKAGE_PHP_CLI || BR2_PACKAGE_PHP_CGI) && BR2_READLINE
+	depends on BR2_PACKAGE_PHP && (BR2_PACKAGE_PHP_CLI || BR2_PACKAGE_PHP_CGI) && BR2_PACKAGE_READLINE
 	help
 	  readline support
 

Modified: trunk/buildroot/package/readline/Config.in
===================================================================
--- trunk/buildroot/package/readline/Config.in	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/package/readline/Config.in	2009-01-30 09:54:59 UTC (rev 25160)
@@ -1,5 +1,5 @@
 #
-config BR2_READLINE
+config BR2_PACKAGE_READLINE
 	bool "readline"
 	help
 	    Enable GNU readline support?

Modified: trunk/buildroot/package/readline/readline.mk
===================================================================
--- trunk/buildroot/package/readline/readline.mk	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/package/readline/readline.mk	2009-01-30 09:54:59 UTC (rev 25160)
@@ -86,6 +86,6 @@
 readline-dirclean:
 	rm -rf $(READLINE_DIR)
 
-ifeq ($(BR2_READLINE),y)
+ifeq ($(BR2_PACKAGE_READLINE),y)
 TARGETS+=readline
 endif

Modified: trunk/buildroot/scripts/test/Config.in.test.buildall
===================================================================
--- trunk/buildroot/scripts/test/Config.in.test.buildall	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/scripts/test/Config.in.test.buildall	2009-01-30 09:54:59 UTC (rev 25160)
@@ -45,7 +45,7 @@
 	select BR2_PACKAGE_MPATROL
 	select BR2_PACKAGE_OPROFILE
 	select BR2_PACKAGE_PKGCONFIG
-	select BR2_READLINE
+	select BR2_PACKAGE_READLINE
 		select BR2_PACKAGE_READLINE_TARGET
 		select BR2_PACKAGE_READLINE_HEADERS
 

Modified: trunk/buildroot/target/device/ARMLTD/integrator926/integrator926_defconfig
===================================================================
--- trunk/buildroot/target/device/ARMLTD/integrator926/integrator926_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/ARMLTD/integrator926/integrator926_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -306,7 +306,7 @@
 # oprofile requires a toolchain with C++ support enabled
 #
 # BR2_PACKAGE_PKGCONFIG is not set
-# BR2_READLINE is not set
+# BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_PCRE is not set
 
 #

Modified: trunk/buildroot/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
===================================================================
--- trunk/buildroot/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -311,7 +311,7 @@
 # BR2_PACKAGE_MPATROL is not set
 # BR2_PACKAGE_OPROFILE is not set
 BR2_PACKAGE_PKGCONFIG=y
-BR2_READLINE=y
+BR2_PACKAGE_READLINE=y
 BR2_PACKAGE_READLINE_TARGET=y
 # BR2_PACKAGE_READLINE_HEADERS is not set
 # BR2_PACKAGE_PCRE is not set

Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -373,7 +373,7 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
 BR2_PACKAGE_PKGCONFIG=y
-BR2_READLINE=y
+BR2_PACKAGE_READLINE=y
 BR2_PACKAGE_READLINE_TARGET=y
 # BR2_PACKAGE_READLINE_HEADERS is not set
 # BR2_PACKAGE_PCRE is not set

Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -387,7 +387,7 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
 BR2_PACKAGE_PKGCONFIG=y
-BR2_READLINE=y
+BR2_PACKAGE_READLINE=y
 BR2_PACKAGE_READLINE_TARGET=y
 # BR2_PACKAGE_READLINE_HEADERS is not set
 # BR2_PACKAGE_PCRE is not set

Modified: trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -284,7 +284,7 @@
 BR2_PACKAGE_LIBTOOL=y
 BR2_PACKAGE_M4=y
 BR2_PACKAGE_PKGCONFIG=y
-BR2_READLINE=y
+BR2_PACKAGE_READLINE=y
 BR2_PACKAGE_READLINE_TARGET=y
 # BR2_PACKAGE_XERCES is not set
 

Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -381,7 +381,7 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
 BR2_PACKAGE_PKGCONFIG=y
-BR2_READLINE=y
+BR2_PACKAGE_READLINE=y
 BR2_PACKAGE_READLINE_TARGET=y
 # BR2_PACKAGE_READLINE_HEADERS is not set
 # BR2_PACKAGE_PCRE is not set

Modified: trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -378,7 +378,7 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
 BR2_PACKAGE_PKGCONFIG=y
-BR2_READLINE=y
+BR2_PACKAGE_READLINE=y
 BR2_PACKAGE_READLINE_TARGET=y
 # BR2_PACKAGE_READLINE_HEADERS is not set
 # BR2_PACKAGE_PCRE is not set

Modified: trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -378,7 +378,7 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
 BR2_PACKAGE_PKGCONFIG=y
-BR2_READLINE=y
+BR2_PACKAGE_READLINE=y
 BR2_PACKAGE_READLINE_TARGET=y
 # BR2_PACKAGE_READLINE_HEADERS is not set
 # BR2_PACKAGE_PCRE is not set

Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -326,7 +326,7 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
 BR2_PACKAGE_PKGCONFIG=y
-# BR2_READLINE is not set
+# BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_PCRE is not set
 
 #

Modified: trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -326,7 +326,7 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
 BR2_PACKAGE_PKGCONFIG=y
-# BR2_READLINE is not set
+# BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_PCRE is not set
 
 #

Modified: trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -336,7 +336,7 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
 BR2_PACKAGE_PKGCONFIG=y
-BR2_READLINE=y
+BR2_PACKAGE_READLINE=y
 # BR2_PACKAGE_READLINE_TARGET is not set
 # BR2_PACKAGE_PCRE is not set
 

Modified: trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -326,7 +326,7 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
 BR2_PACKAGE_PKGCONFIG=y
-# BR2_READLINE is not set
+# BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_PCRE is not set
 
 #

Modified: trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -336,7 +336,7 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
 BR2_PACKAGE_PKGCONFIG=y
-# BR2_READLINE is not set
+# BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_PCRE is not set
 
 #

Modified: trunk/buildroot/target/device/KwikByte/kb9202/kb9202_defconfig
===================================================================
--- trunk/buildroot/target/device/KwikByte/kb9202/kb9202_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/KwikByte/kb9202/kb9202_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -302,7 +302,7 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
 # BR2_PACKAGE_PKGCONFIG is not set
-# BR2_READLINE is not set
+# BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_PCRE is not set
 
 #

Modified: trunk/buildroot/target/device/valka/v100sc2_defconfig
===================================================================
--- trunk/buildroot/target/device/valka/v100sc2_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/valka/v100sc2_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -299,7 +299,7 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
 BR2_PACKAGE_PKGCONFIG=y
-# BR2_READLINE is not set
+# BR2_PACKAGE_READLINE is not set
 BR2_PACKAGE_PCRE=y
 # BR2_PACKAGE_TMC is not set
 

Modified: trunk/buildroot/target/device/x86/i686/i386_defconfig
===================================================================
--- trunk/buildroot/target/device/x86/i686/i386_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/x86/i686/i386_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -312,7 +312,7 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
 # BR2_PACKAGE_PKGCONFIG is not set
-# BR2_READLINE is not set
+# BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_VALGRIND is not set
 # BR2_PACKAGE_PCRE is not set
 

Modified: trunk/buildroot/target/device/x86/i686/i686_defconfig
===================================================================
--- trunk/buildroot/target/device/x86/i686/i686_defconfig	2009-01-30 09:50:13 UTC (rev 25159)
+++ trunk/buildroot/target/device/x86/i686/i686_defconfig	2009-01-30 09:54:59 UTC (rev 25160)
@@ -312,7 +312,7 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
 # BR2_PACKAGE_PKGCONFIG is not set
-# BR2_READLINE is not set
+# BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_VALGRIND is not set
 # BR2_PACKAGE_PCRE is not set
 
