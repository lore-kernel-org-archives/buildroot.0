From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:26 +0200
Subject: [Buildroot] [PATCH 57/69] tcl: remove empty host dependencies
	definition
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-58-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/tcl/tcl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index a1153c72314c..a2ac8e6c83ca 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -75,7 +75,6 @@ TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
 TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite) \
 	$(if $(BR2_PACKAGE_MYSQL),mysql) \
 	$(if $(BR2_PACKAGE_POSTGRESQL),postgresql)
-HOST_TCL_DEPENDENCIES =
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.0
