From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2012 18:42:53 +0100
Subject: [Buildroot] [PATCH 5/7] libusb: add host variant
In-Reply-To: <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
References: <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f3a4170c4cadff973bd8b27cbb916007e47d72bf.1327772556.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
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
