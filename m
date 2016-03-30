From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Mar 2016 17:14:10 +0100
Subject: [Buildroot] [PATCH 4/4] tcl: enable postgresql support
In-Reply-To: <1459354450-37009-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1459354450-37009-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1459354450-37009-4-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tcl/tcl.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 0ce6b9f..51dfbf3 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -37,7 +37,7 @@ define TCL_REMOVE_PACKAGES
 	rm -fr $(@D)/pkgs/sqlite3* \
 		$(if $(BR2_PACKAGE_MYSQL),,$(@D)/pkgs/tdbcmysql*) \
 		$(@D)/pkgs/tdbcodbc* \
-		$(@D)/pkgs/tdbcpostgres* \
+		$(if $(BR2_PACKAGE_POSTGRESQL),,$(@D)/pkgs/tdbcpostgres*) \
 		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3*)
 endef
 TCL_PRE_CONFIGURE_HOOKS += TCL_REMOVE_PACKAGES
@@ -74,7 +74,8 @@ endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
 
 TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite) \
-	$(if $(BR2_PACKAGE_MYSQL),mysql)
+	$(if $(BR2_PACKAGE_MYSQL),mysql) \
+	$(if $(BR2_PACKAGE_POSTGRESQL),postgresql)
 HOST_TCL_DEPENDENCIES =
 
 $(eval $(autotools-package))
-- 
2.7.3
