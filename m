From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 18:08:12 +0100
Subject: [Buildroot] [git commit] package/atk: fix static build
Message-ID: <20190112170809.0598E8677B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aecdbea4c951a09b74cdfc911e636a123973419e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use library instead of shared_library to allow the user to build a
static libatk library

Fixes:
 - http://autobuild.buildroot.org/results/347a37dd2585974bdbf3bf99158e8ee9127d1202

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...n.build-replace-shared_library-by-library.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/atk/0001-atk-meson.build-replace-shared_library-by-library.patch b/package/atk/0001-atk-meson.build-replace-shared_library-by-library.patch
new file mode 100644
index 0000000000..6260cca89f
--- /dev/null
+++ b/package/atk/0001-atk-meson.build-replace-shared_library-by-library.patch
@@ -0,0 +1,33 @@
+From da08587d9a57b45cc8a76cb31390c79c1199959b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 10 Jan 2019 10:13:03 +0100
+Subject: [PATCH] atk/meson.build: replace shared_library by library
+
+Use library instead of shared_library to allow the user to build a
+static libatk library
+
+Fixes:
+ - http://autobuild.buildroot.org/results/347a37dd2585974bdbf3bf99158e8ee9127d1202
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://gitlab.gnome.org/GNOME/atk/merge_requests/11]
+---
+ atk/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/atk/meson.build b/atk/meson.build
+index 69ba6c5..0ad67e5 100644
+--- a/atk/meson.build
++++ b/atk/meson.build
+@@ -122,7 +122,7 @@ endif
+ 
+ atk_inc = include_directories('.')
+ 
+-libatk = shared_library('atk- at 0@'.format(atk_api_version),
++libatk = library('atk- at 0@'.format(atk_api_version),
+                         sources: atk_sources + atk_enums + atk_marshals,
+                         soversion: atk_soversion,
+                         version: atk_libversion,
+-- 
+2.14.1
+
