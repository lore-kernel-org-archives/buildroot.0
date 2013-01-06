From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 18:27:06 +0100
Subject: [Buildroot] [PATCH] efl/libevas: fix build of XCB backend
Message-ID: <1357493226-24207-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.net/results/b2107dce84bbc24d9afae3c7b53d972043f6d073/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../efl/libevas/libevas-fix-xcb-backend-typo.patch |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/efl/libevas/libevas-fix-xcb-backend-typo.patch

diff --git a/package/efl/libevas/libevas-fix-xcb-backend-typo.patch b/package/efl/libevas/libevas-fix-xcb-backend-typo.patch
new file mode 100644
index 0000000..2531e75
--- /dev/null
+++ b/package/efl/libevas/libevas-fix-xcb-backend-typo.patch
@@ -0,0 +1,19 @@
+Fix typo in the Evas XCB backend
+
+This typo prevents the XCB backend from building.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/modules/engines/software_x11/evas_xcb_outbuf.c
+===================================================================
+--- a/src/modules/engines/software_x11/evas_xcb_outbuf.c
++++ b/src/modules/engines/software_x11/evas_xcb_outbuf.c
+@@ -871,7 +871,7 @@
+           }
+         else
+           {
+-             int pixelb = evas_software_xcb_output_buffer_depth(obr->xob) / 8;
++             int pixelb = evas_software_xcb_output_buffer_depth(obr->xcbob) / 8;
+              int run;
+              int dstjump;
+              
-- 
1.7.9.5
