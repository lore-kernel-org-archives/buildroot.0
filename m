From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  2 Jan 2018 11:33:37 -0500
Subject: [Buildroot] [PATCH 8/8] libselinux: check host-python version
In-Reply-To: <20180102163337.6334-1-aduskett@gmail.com>
References: <20180102163337.6334-1-aduskett@gmail.com>
Message-ID: <20180102163337.6334-9-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Check if host-python3 is selected instead of target-python3.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libsemanage/libsemanage.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 829409f527..b9a98c7b6c 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -37,7 +37,7 @@ HOST_LIBSEMANAGE_MAKE_OPTS += \
 	PREFIX=$(HOST_DIR) \
 	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
 HOST_LIBSEMANAGE_DEPENDENCIES += host-python3
 HOST_LIBSEMANAGE_MAKE_OPTS += \
 	PYINC="-I$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)m/" \
-- 
2.14.3
