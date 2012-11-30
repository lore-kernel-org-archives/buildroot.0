From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 12:06:56 -0800
Subject: [Buildroot] [git commit] legacy: move old GENTARGETS macros to
	Makefile.legacy
Message-ID: <20121130201153.1B6E39940D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc1cd3b267212c0e932db4855ff7c1afe0b45e67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile.legacy     |    7 +++++++
 package/Makefile.in |    6 ------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Makefile.legacy b/Makefile.legacy
index 2e015a1..c8b568d 100644
--- a/Makefile.legacy
+++ b/Makefile.legacy
@@ -11,3 +11,10 @@
 ifeq ($(BR2_LEGACY),y)
 $(error "You have legacy configuration in your .config! Please check your configuration.")
 endif
+
+#
+# Legacy options from 2012.05
+#
+GENTARGETS = $$(error The GENTARGETS macro no longer exists; use $$$$(eval $$$$(generic-package)) or $$$$(eval $$$$(host-generic-package)))
+AUTOTARGETS = $$(error The AUTOTARGETS macro no longer exists; use $$$$(eval $$$$(autotools-package)) or $$$$(eval $$$$(host-autotools-package)))
+CMAKETARGETS = $$(error The CMAKETARGETS macro no longer exists; use $$$$(eval $$$$(cmake-package)) or $$$$(eval $$$$(host-cmake-package)))
diff --git a/package/Makefile.in b/package/Makefile.in
index 9fdc745..2dd81c7 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -305,12 +305,6 @@ else
 SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
 endif
 
-# Warn if a package uses the deprecated GENTARGETS macros.  This can be
-# removed again for BR-2012.11.
-GENTARGETS = $$(error The GENTARGETS macro no longer exists; use $$$$(eval $$$$(generic-package)) or $$$$(eval $$$$(host-generic-package)))
-AUTOTARGETS = $$(error The AUTOTARGETS macro no longer exists; use $$$$(eval $$$$(autotools-package)) or $$$$(eval $$$$(host-autotools-package)))
-CMAKETARGETS = $$(error The CMAKETARGETS macro no longer exists; use $$$$(eval $$$$(cmake-package)) or $$$$(eval $$$$(host-cmake-package)))
-
 include package/pkg-utils.mk
 include package/pkg-download.mk
 include package/pkg-autotools.mk
