From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 3 May 2013 14:38:55 +0200
Subject: [Buildroot] [git commit] diffutils: only needs gettext if locale is
	selected
Message-ID: <20130504112537.9FAC499AA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92358271b9eede8cb284fb42ea24cff48ec9c322
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add missing select in Config.in.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
