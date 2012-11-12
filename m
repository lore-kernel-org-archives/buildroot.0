From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 12 Nov 2012 21:08:29 +0100
Subject: [Buildroot] [PATCH for-2012.11 2/5] legacy: move old GENTARGETS
	macros to Makefile.legacy
In-Reply-To: <1352750912-16012-1-git-send-email-arnout@mind.be>
References: <1352750912-16012-1-git-send-email-arnout@mind.be>
Message-ID: <1352750912-16012-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
-- 
1.7.10.4
