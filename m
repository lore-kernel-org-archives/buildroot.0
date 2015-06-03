From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:25 +0200
Subject: [Buildroot] [PATCH 08/32 v2] package/matchbox: make
	matchbox-keyboard a real package
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <2450d6a6c0dfc9cd61534e52ef652674cf5f4c39.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, matchbox-keyboard is treated as if it were an option of the
matchbox package.

But that's not true, since it is a real package all by itself, with its
own archive and its own buildsystem.

So, make it a real package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/matchbox/Config.in                   | 9 +--------
 package/matchbox/matchbox-keyboard/Config.in | 7 +++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 create mode 100644 package/matchbox/matchbox-keyboard/Config.in

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 8d4ebc7..9b27d4d 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -25,13 +25,6 @@ source "package/matchbox/matchbox-panel/Config.in"
 source "package/matchbox/matchbox-desktop/Config.in"
 source "package/matchbox/matchbox-common/Config.in"
 source "package/matchbox/matchbox-fakekey/Config.in"
-
-config BR2_PACKAGE_MATCHBOX_KEYBOARD
-	bool "Matchbox Virtual Keyboard"
-	select BR2_PACKAGE_XLIB_LIBXTST
-	select BR2_PACKAGE_XLIB_LIBXFT if !BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_MATCHBOX_FAKEKEY
-	help
-	  Virtual Keyboard
+source "package/matchbox/matchbox-keyboard/Config.in"
 
 endif
diff --git a/package/matchbox/matchbox-keyboard/Config.in b/package/matchbox/matchbox-keyboard/Config.in
new file mode 100644
index 0000000..e017358
--- /dev/null
+++ b/package/matchbox/matchbox-keyboard/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MATCHBOX_KEYBOARD
+	bool "Matchbox Virtual Keyboard"
+	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_XLIB_LIBXFT if !BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_MATCHBOX_FAKEKEY
+	help
+	  Virtual Keyboard
-- 
1.9.1
