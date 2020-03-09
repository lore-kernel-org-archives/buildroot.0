From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Mar 2020 23:17:11 +0100
Subject: [Buildroot] [git commit] package/pkg-qmake.mk: only add qt5base
 dependency when we're not qt5base
Message-ID: <20200309221528.24338825E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52dedbea62c6454fe60a17cc13d3f72edab1edfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we are about to convert qt5base to the qmake-package
infrastructure, we need to avoid a circular dependency: the qt5base
package itself should not depend on qt5base.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-qmake.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
index ed48819d1b..46d2b22d04 100644
--- a/package/pkg-qmake.mk
+++ b/package/pkg-qmake.mk
@@ -40,7 +40,9 @@ $(2)_MAKE_OPTS			?=
 $(2)_INSTALL_STAGING_OPTS	?= install
 $(2)_INSTALL_TARGET_OPTS	?= $$($(2)_INSTALL_STAGING_OPTS)
 
+ifneq ($(1),qt5base)
 $(2)_DEPENDENCIES 		+= qt5base
+endif
 
 #
 # Configure step. Only define it if not already defined by the package
