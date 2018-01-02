From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  2 Jan 2018 10:28:05 -0500
Subject: [Buildroot] [PATCH 6/8] libselinux: check host-python version
In-Reply-To: <20180102152807.31470-1-aduskett@gmail.com>
References: <20180102152807.31470-1-aduskett@gmail.com>
Message-ID: <20180102152807.31470-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Check if host-python3 is selected instead of target-python3.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libselinux/libselinux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 8ac8000de5..f8e8ea1285 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -75,7 +75,7 @@ endef
 HOST_LIBSELINUX_DEPENDENCIES = \
 	host-libsepol host-pcre host-swig
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
 HOST_LIBSELINUX_DEPENDENCIES += host-python3
 HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)m/
 HOST_LIBSELINUX_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
-- 
2.14.3
