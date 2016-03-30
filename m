From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Mar 2016 17:14:07 +0100
Subject: [Buildroot] [PATCH 1/4] tcl: switch to * instead of [0-9]
Message-ID: <1459354450-37009-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tcl/tcl.mk | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 9fd1195..edf939b 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -32,21 +32,17 @@ HOST_TCL_CONF_OPTS = \
 # I haven't found a good way to force pkgs to not build
 # or configure without just removing the entire pkg directory.
 define HOST_TCL_REMOVE_PACKAGES
-	rm -fr $(@D)/pkgs/sqlite[0-9].[0-9].[0-9] \
-		$(@D)/pkgs/tdbc[0-9].[0-9].[0-9] \
-		$(@D)/pkgs/tdbcmysql[0-9].[0-9].[0-9] \
-		$(@D)/pkgs/tdbcodbc[0-9].[0-9].[0-9] \
-		$(@D)/pkgs/tdbcpostgres[0-9].[0-9].[0-9] \
-		$(@D)/pkgs/tdbcsqlite3-[0-9].[0-9].[0-9]
+	rm -fr $(@D)/pkgs/sqlite3* \
+		$(@D)/pkgs/tdbc*
 endef
 HOST_TCL_PRE_CONFIGURE_HOOKS += HOST_TCL_REMOVE_PACKAGES
 define TCL_REMOVE_PACKAGES
-	rm -fr $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/sqlite[0-9].[0-9].[0-9]) \
-		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbc[0-9].[0-9].[0-9]) \
-		$(@D)/pkgs/tdbcmysql[0-9].[0-9].[0-9] \
-		$(@D)/pkgs/tdbcodbc[0-9].[0-9].[0-9] \
-		$(@D)/pkgs/tdbcpostgres[0-9].[0-9].[0-9] \
-		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3-[0-9].[0-9].[0-9])
+	rm -fr $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/sqlite3*) \
+		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbc1*) \
+		$(@D)/pkgs/tdbcmysql* \
+		$(@D)/pkgs/tdbcodbc* \
+		$(@D)/pkgs/tdbcpostgres* \
+		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3*)
 endef
 TCL_PRE_CONFIGURE_HOOKS += TCL_REMOVE_PACKAGES
 
-- 
2.7.3
