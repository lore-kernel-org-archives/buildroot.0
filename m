From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2012 18:42:52 +0100
Subject: [Buildroot] [PATCH 4/7] libusb-compat: add host variant
In-Reply-To: <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
References: <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
Message-ID: <13b44d8b46e93d46b1cd1d09fb6b67be12df4349.1327772556.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/libusb-compat/libusb-compat.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index e39cdd8..99e7716 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -18,4 +18,8 @@ endef
 
 LIBUSB_COMPAT_POST_INSTALL_STAGING_HOOKS+=LIBUSB_COMPAT_FIXUP_CONFIG
 
+HOST_LIBUSB_COMPAT_DEPENDENCIES = host-pkg-config host-libusb
+
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
+
-- 
1.7.4.1
