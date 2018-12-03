From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon,  3 Dec 2018 15:34:03 +0100
Subject: [Buildroot] [PATCH] pulseview: fix a build error
Message-ID: <20181203143403.18506-1-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch that fixes a build error occuring when libsigrokdecode is
not selected.

Fixes: http://autobuild.buildroot.net/results/79ed29bdd1eec9bf7cb5003202da5ceaeb8101b6/
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 ...ar-fix-build-without-libsigrokdecode.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/pulseview/0001-mainbar-fix-build-without-libsigrokdecode.patch

diff --git a/package/pulseview/0001-mainbar-fix-build-without-libsigrokdecode.patch b/package/pulseview/0001-mainbar-fix-build-without-libsigrokdecode.patch
new file mode 100644
index 0000000000..5cf0c446a6
--- /dev/null
+++ b/package/pulseview/0001-mainbar-fix-build-without-libsigrokdecode.patch
@@ -0,0 +1,37 @@
+From da124df864dd7555733d6690eacf856435d55b2d Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <brgl@bgdev.pl>
+Date: Mon, 3 Dec 2018 13:14:16 +0100
+Subject: [PATCH] mainbar: fix build without libsigrokdecode
+
+We must not include decodesignal.hpp if we're not using libsigrokdecode
+or the build will fail due to libsigrokdecode.hpp not being present in
+the system.
+
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+---
+ pv/toolbars/mainbar.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pv/toolbars/mainbar.cpp b/pv/toolbars/mainbar.cpp
+index e6beb2b..7c4d0fb 100644
+--- a/pv/toolbars/mainbar.cpp
++++ b/pv/toolbars/mainbar.cpp
+@@ -35,7 +35,6 @@
+ 
+ #include <boost/algorithm/string/join.hpp>
+ 
+-#include <pv/data/decodesignal.hpp>
+ #include <pv/devicemanager.hpp>
+ #include <pv/devices/hardwaredevice.hpp>
+ #include <pv/devices/inputfile.hpp>
+@@ -52,6 +51,7 @@
+ #include <pv/widgets/importmenu.hpp>
+ #ifdef ENABLE_DECODE
+ #include <pv/widgets/decodermenu.hpp>
++#include <pv/data/decodesignal.hpp>
+ #endif
+ 
+ #include <libsigrokcxx/libsigrokcxx.hpp>
+-- 
+2.19.1
+
-- 
2.19.1
