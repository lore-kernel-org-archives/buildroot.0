From: James Hogan <james.hogan@imgtec.com>
Date: Tue, 23 Jul 2013 16:33:58 +0100
Subject: [Buildroot] [PATCH] directfb-examples: install rose.png for df_dok
Message-ID: <1374593638-16863-1-git-send-email-james.hogan@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The directfb example program df_dok now requires rose.png to be
installed, otherwise it gives the following error:

(#) DirectFBError [dfb->CreateImageProvider( dfb, DATADIR"/rose.png", &provider )]: A general or unknown error occured

Therefore add rose.png to the list of data files if df_dok is enabled.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
---
 package/directfb-examples/directfb-examples.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index bcd3c1c..b093ea8 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -58,6 +58,7 @@ DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directf
 DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/intro.png
 DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/fish.png
 DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/swirl.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/rose.png
 
 DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST) += usr/share/directfb-examples/pngtest.png
 DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST) += usr/share/directfb-examples/testmask.png
-- 
1.8.1.2
