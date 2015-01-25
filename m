From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 25 Jan 2015 22:13:48 +0100
Subject: [Buildroot] [PATCH 1/8 v2] package/libftdi: fix libftdi.pc
In-Reply-To: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
References: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1422220435-18689-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes libftdi pkg-config module, so that packages linking
against libftdi correctly have all needed CFLAGS and LIBS defined,
especially when running a static build.

Fixes:
  http://autobuild.buildroot.org/results/e90/e90b4d5ad79d99487f21c9d18581e8eba7034501/

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
change v1->v2:
- libusb as "Require" (ThomasP)
---
 ...bftdi.pc-requires-libusb-fix-static-build.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/libftdi/0002-libftdi.pc-requires-libusb-fix-static-build.patch

diff --git a/package/libftdi/0002-libftdi.pc-requires-libusb-fix-static-build.patch b/package/libftdi/0002-libftdi.pc-requires-libusb-fix-static-build.patch
new file mode 100644
index 0000000..ee47af6
--- /dev/null
+++ b/package/libftdi/0002-libftdi.pc-requires-libusb-fix-static-build.patch
@@ -0,0 +1,27 @@
+From d3d6ca63cb86727533d7d83c98e70002bb04f343 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Wed, 21 Jan 2015 11:18:59 +0100
+Subject: [PATCH] libftdi.pc: requires libusb (fix static build)
+
+---
+ libftdi.pc.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libftdi.pc.in b/libftdi.pc.in
+index 2061b91..57f0a09 100644
+--- a/libftdi.pc.in
++++ b/libftdi.pc.in
+@@ -5,8 +5,8 @@ includedir=@includedir@
+ 
+ Name: libftdi
+ Description: Library to program and control the FTDI USB controller
+-Requires:
++Requires: libusb
+ Version: @VERSION@
+-Libs: -L${libdir} -lftdi -lusb
++Libs: -L${libdir} -lftdi
+ Cflags: -I${includedir}
+ 
+-- 
+2.1.0
+
-- 
2.2.2
