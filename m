From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Jul 2013 17:07:23 +0200
Subject: [Buildroot] [PATCH 2/3] efl: bump to version 1.7.7
In-Reply-To: <1373209644-18260-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373209644-18260-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373209644-18260-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package/efl/libevas/libevas-fix-xcb-backend-typo.patch patch is
removed, as it has been merged upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/efl.mk                                    |  2 +-
 .../efl/libevas/libevas-fix-xcb-backend-typo.patch    | 19 -------------------
 2 files changed, 1 insertion(+), 20 deletions(-)
 delete mode 100644 package/efl/libevas/libevas-fix-xcb-backend-typo.patch

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
-- 
1.8.1.2
