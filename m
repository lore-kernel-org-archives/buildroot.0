From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 01 Nov 2012 15:35:39 +0100
Subject: [Buildroot] [PATCH 3 1/9] diffutils: only needs gettext if locale
	is selected
Message-ID: <20121101143539.8550.70150.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Also add missing select in Config.in.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/diffutils/Config.in    |    1 +
 package/diffutils/diffutils.mk |    3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/diffutils/Config.in b/package/diffutils/Config.in
index 86da5d3..4cc16e2 100644
--- a/package/diffutils/Config.in
+++ b/package/diffutils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DIFFUTILS
 	bool"diffutils"
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  GNU diff. Compare files per line.
 
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 168d040..2530763 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -6,8 +6,7 @@
 
 DIFFUTILS_VERSION = 3.2
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
-DIFFUTILS_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext)
+DIFFUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 DIFFUTILS_DEPENDENCIES += busybox
