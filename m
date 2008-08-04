From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:08:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lua
Message-ID: <20080804190821.DDC3E3C8F9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:08:21 -0700 (Mon, 04 Aug 2008)
New Revision: 23036

Log:
lua: select readline / ncurses

Modified:
   trunk/buildroot/package/lua/Config.in


Changeset:
Modified: trunk/buildroot/package/lua/Config.in
===================================================================
--- trunk/buildroot/package/lua/Config.in	2008-08-04 19:08:15 UTC (rev 23035)
+++ trunk/buildroot/package/lua/Config.in	2008-08-04 19:08:21 UTC (rev 23036)
@@ -1,11 +1,8 @@
 config BR2_PACKAGE_LUA
 	bool "lua"
-	depends on BR2_READLINE
-	depends on BR2_PACKAGE_NCURSES
+	select BR2_READLINE
+	select BR2_PACKAGE_NCURSES
 	help
 	  Lua is a powerful, fast, light-weight, embeddable scripting language.
 
 	  http://www.lua.org/
-
-comment "lua		- disabled (requires readline and ncurses)"
-	depends on !BR2_READLINE && !BR2_PACKAGE_NCURSES
