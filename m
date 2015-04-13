From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 11:53:21 +0200
Subject: [Buildroot] [PATCH] pkg-utils: update comments after renaming of
	package infra macros
Message-ID: <1428918801-19631-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package infrastructure macros have a long time ago been renamed
from GENTARGETS, AUTOTARGETS to generic-package and
autotools-package. However, one comment in pkg-utils.mk keeps a
reference to these *TARGETS macros. This commit updates this comment
to match the new name of these macros.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 7eddc47..5a385f8 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -60,7 +60,7 @@ endef
 
 # Helper functions to determine the name of a package and its
 # directory from its makefile directory, using the $(MAKEFILE_LIST)
-# variable provided by make. This is used by the *TARGETS macros to
+# variable provided by make. This is used by the *-package macros to
 # automagically find where the package is located.
 pkgdir = $(dir $(lastword $(MAKEFILE_LIST)))
 pkgname = $(lastword $(subst /, ,$(pkgdir)))
-- 
2.1.0
