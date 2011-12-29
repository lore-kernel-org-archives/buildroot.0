From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Dec 2011 18:40:47 +0100
Subject: [Buildroot] [PATCH 5/7] libusb: add host variant
In-Reply-To: <cover.1325178529.git.thomas.petazzoni@free-electrons.com>
References: <cover.1325178529.git.thomas.petazzoni@free-electrons.com>
Message-ID: <89d5795c0b7eafa13ee19fe5c2d2cb5b3d41f6bd.1325178529.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libusb/libusb.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index af75f5f..b3ca353 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -10,4 +10,7 @@ LIBUSB_DEPENDENCIES = host-pkg-config
 LIBUSB_INSTALL_STAGING = YES
 LIBUSB_INSTALL_TARGET = YES
 
+HOST_LIBUSB_DEPENDENCIES = host-pkg-config
+
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.4.1
