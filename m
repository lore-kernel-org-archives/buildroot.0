From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 22:25:45 +0200
Subject: [Buildroot] [git commit] pkg-utils: update comments after renaming
	of package infra macros
Message-ID: <20150413203652.075A9807EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2366661e4ff53a864e5e2386039165c26128ddfd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package infrastructure macros have a long time ago been renamed
from GENTARGETS, AUTOTARGETS to generic-package and
autotools-package. However, one comment in pkg-utils.mk keeps a
reference to these *TARGETS macros. This commit updates this comment
to match the new name of these macros.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
