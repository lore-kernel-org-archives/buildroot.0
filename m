From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 21:01:49 +0100
Subject: [Buildroot] [git commit] libusb: add host variant
Message-ID: <20120202201521.8F1A3909A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66ac654d8ebeffde1414d58bda4945fbd68e7de7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove redundant HOST_*_DEPENDENCIES]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libusb/libusb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index af75f5f..fce0c28 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -8,6 +8,6 @@ LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libusb/libusb-1.0/libusb-$(LIBUSB_VERSION)
 LIBUSB_DEPENDENCIES = host-pkg-config
 LIBUSB_INSTALL_STAGING = YES
-LIBUSB_INSTALL_TARGET = YES
 
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
