From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:18 +0200
Subject: [Buildroot] [PATCH 07/30] package/matchbox: make matchbox-fakekey a
	real package
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <50fde3fb58a4b07ca643b0a24b5635db02318ad8.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, matchbox-fakekey is missing a Kconfig entry, but is so far
solely a build-time dependency of matchbox-keyboard.

So, make it a real package, and select it from matchbox-keyboard.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/Config.in                  | 2 ++
 package/matchbox/matchbox-fakekey/Config.in | 2 ++
 2 files changed, 4 insertions(+)
 create mode 100644 package/matchbox/matchbox-fakekey/Config.in

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index ead2649..8d4ebc7 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -24,11 +24,13 @@ source "package/matchbox/matchbox-wm/Config.in"
 source "package/matchbox/matchbox-panel/Config.in"
 source "package/matchbox/matchbox-desktop/Config.in"
 source "package/matchbox/matchbox-common/Config.in"
+source "package/matchbox/matchbox-fakekey/Config.in"
 
 config BR2_PACKAGE_MATCHBOX_KEYBOARD
 	bool "Matchbox Virtual Keyboard"
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBXFT if !BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_MATCHBOX_FAKEKEY
 	help
 	  Virtual Keyboard
 
diff --git a/package/matchbox/matchbox-fakekey/Config.in b/package/matchbox/matchbox-fakekey/Config.in
new file mode 100644
index 0000000..334f3a2
--- /dev/null
+++ b/package/matchbox/matchbox-fakekey/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_MATCHBOX_FAKEKEY
+	bool
-- 
1.9.1
