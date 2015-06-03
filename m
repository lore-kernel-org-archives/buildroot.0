From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:20 +0200
Subject: [Buildroot] [PATCH 03/32 v2] package/matchbox: make matchbox-wm a
	real package
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <dbde4c47b90d5855e702e00664bb1a7fafc7bb64.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similarly to what we just did for matchbox-lib, we make matchbox-wm a
real package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/matchbox/Config.in             | 2 ++
 package/matchbox/matchbox-wm/Config.in | 3 +++
 package/matchbox/matchbox.mk           | 1 -
 3 files changed, 5 insertions(+), 1 deletion(-)
 create mode 100644 package/matchbox/matchbox-wm/Config.in

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 70cc168..15b1017 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_MATCHBOX
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_MATCHBOX_LIB
+	select BR2_PACKAGE_MATCHBOX_WM
 	help
 	  Matchbox is an Open Source base environment for the X Window
 	  System running on non-desktop embedded platforms such as
@@ -19,6 +20,7 @@ config BR2_PACKAGE_MATCHBOX
 if BR2_PACKAGE_MATCHBOX
 
 source "package/matchbox/matchbox-lib/Config.in"
+source "package/matchbox/matchbox-wm/Config.in"
 
 config BR2_PACKAGE_MATCHBOX_PANEL
 	bool "Matchbox Panel"
diff --git a/package/matchbox/matchbox-wm/Config.in b/package/matchbox/matchbox-wm/Config.in
new file mode 100644
index 0000000..6ad5dfc
--- /dev/null
+++ b/package/matchbox/matchbox-wm/Config.in
@@ -0,0 +1,3 @@
+config BR2_PACKAGE_MATCHBOX_WM
+	bool
+	select BR2_PACKAGE_MATCHBOX_LIB
diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index e367df2..17d89d8 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -1,4 +1,3 @@
 ifeq ($(BR2_PACKAGE_MATCHBOX),y)
 include $(sort $(wildcard package/matchbox/*/*.mk))
-PACKAGES += matchbox-wm
 endif
-- 
1.9.1
