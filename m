From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 19:28:59 +0200
Subject: [Buildroot] [git commit] tcl: enable postgresql support
Message-ID: <20160330173702.F25E9818A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd2b84e241e3f1ee135ad9b3ec43dbca25647d25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcl/tcl.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 8ac6644..a1153c7 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -36,7 +36,7 @@ define TCL_REMOVE_PACKAGES
 	rm -fr $(@D)/pkgs/sqlite3* \
 		$(if $(BR2_PACKAGE_MYSQL),,$(@D)/pkgs/tdbcmysql*) \
 		$(@D)/pkgs/tdbcodbc* \
-		$(@D)/pkgs/tdbcpostgres* \
+		$(if $(BR2_PACKAGE_POSTGRESQL),,$(@D)/pkgs/tdbcpostgres*) \
 		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3*)
 endef
 TCL_PRE_CONFIGURE_HOOKS += TCL_REMOVE_PACKAGES
@@ -73,7 +73,8 @@ endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
 
 TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite) \
-	$(if $(BR2_PACKAGE_MYSQL),mysql)
+	$(if $(BR2_PACKAGE_MYSQL),mysql) \
+	$(if $(BR2_PACKAGE_POSTGRESQL),postgresql)
 HOST_TCL_DEPENDENCIES =
 
 $(eval $(autotools-package))
