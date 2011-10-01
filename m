From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  1 Oct 2011 17:00:21 +0200
Subject: [Buildroot] [PATCH 4/6] libusb-compat: add host variant
In-Reply-To: <cover.1317481137.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317481137.git.thomas.petazzoni@free-electrons.com>
Message-ID: <01596349e2ee119699af5a011d79ad1d2bb7eb55.1317481137.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
