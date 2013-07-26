From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jul 2013 21:20:35 +0200
Subject: [Buildroot] [git commit] directfb-examples: install rose.png for
	df_dok
Message-ID: <20130726192311.F40D199AB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8b0a3f87022c1723238f307ad9dddbeaf834d08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The directfb example program df_dok now requires rose.png to be
installed, otherwise it gives the following error:

(#) DirectFBError [dfb->CreateImageProvider( dfb, DATADIR"/rose.png", &provider )]: A general or unknown error occured

Therefore add rose.png to the list of data files if df_dok is enabled.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb-examples/directfb-examples.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index c39d411..26408bf 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -58,6 +58,7 @@ DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directf
 DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/intro.png
 DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/fish.png
 DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/swirl.png
+DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/rose.png
 
 DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST) += usr/share/directfb-examples/pngtest.png
 DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST) += usr/share/directfb-examples/testmask.png
