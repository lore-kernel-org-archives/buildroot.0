From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Jul 2013 21:44:07 +0200
Subject: [Buildroot] [git commit] efl: bump to version 1.7.7
Message-ID: <20130707200245.B00B09A591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=338721636a21352b92a8da4ac8d4c6e6e7c01ff9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package/efl/libevas/libevas-fix-xcb-backend-typo.patch patch is
removed, as it has been merged upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/efl.mk                                 |    2 +-
 .../efl/libevas/libevas-fix-xcb-backend-typo.patch |   19 -------------------
 2 files changed, 1 insertions(+), 20 deletions(-)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index b7462f1..f284c93 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -1,3 +1,3 @@
-EFL_VERSION = 1.7.4
+EFL_VERSION = 1.7.7
 
 include package/efl/*/*.mk
diff --git a/package/efl/libevas/libevas-fix-xcb-backend-typo.patch b/package/efl/libevas/libevas-fix-xcb-backend-typo.patch
deleted file mode 100644
index 2531e75..0000000
--- a/package/efl/libevas/libevas-fix-xcb-backend-typo.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Fix typo in the Evas XCB backend
-
-This typo prevents the XCB backend from building.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/modules/engines/software_x11/evas_xcb_outbuf.c
-===================================================================
---- a/src/modules/engines/software_x11/evas_xcb_outbuf.c
-+++ b/src/modules/engines/software_x11/evas_xcb_outbuf.c
-@@ -871,7 +871,7 @@
-           }
-         else
-           {
--             int pixelb = evas_software_xcb_output_buffer_depth(obr->xob) / 8;
-+             int pixelb = evas_software_xcb_output_buffer_depth(obr->xcbob) / 8;
-              int run;
-              int dstjump;
-              
