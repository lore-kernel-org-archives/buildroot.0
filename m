From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Aug 2020 23:04:04 +0200
Subject: [Buildroot] [git commit] package/wayland: fix build with toolchains
 without c++
Message-ID: <20200803210520.EA07A82DF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=654b5d934a7cdab7deca16b374322236de08d472
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/fb2/fb205601cac2bbf8e70ec2bf4eaf22264d8edc96/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../wayland/0002-meson-do-not-check-for-c.patch    | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/wayland/0002-meson-do-not-check-for-c.patch b/package/wayland/0002-meson-do-not-check-for-c.patch
new file mode 100644
index 0000000000..c5819bf477
--- /dev/null
+++ b/package/wayland/0002-meson-do-not-check-for-c.patch
@@ -0,0 +1,29 @@
+From 1df9b73db6541cbc483c6ee1b21dbe0cb6e5cbfa Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Wed, 29 Jul 2020 08:20:41 +0200
+Subject: [PATCH] meson: do not check for c++
+
+Wayland does not need c++, fixes building with toolchains lacking c++.
+
+Backported from upstream PR:
+https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/88
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index b67b101..e47a52d 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,5 +1,5 @@
+ project(
+-	'wayland', 'c', 'cpp',
++	'wayland', 'c',
+ 	version: '1.18.0',
+ 	license: 'MIT',
+ 	meson_version: '>= 0.47.0',
+-- 
+2.27.0
+
