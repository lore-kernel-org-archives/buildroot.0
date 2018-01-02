From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  2 Jan 2018 10:28:04 -0500
Subject: [Buildroot] [PATCH 5/8] ninja: check host-python version
In-Reply-To: <20180102152807.31470-1-aduskett@gmail.com>
References: <20180102152807.31470-1-aduskett@gmail.com>
Message-ID: <20180102152807.31470-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Check if host-python3 is selected instead of target-python3.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/ninja/ninja.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index 259a87d216..b58d1a0f43 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -9,7 +9,7 @@ NINJA_SITE = $(call github,ninja-build,ninja,$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
 
-HOST_NINJA_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+HOST_NINJA_DEPENDENCIES = $(if $(BR2_PACKAGE_HOST_PYTHON3),host-python3,host-python)
 
 define HOST_NINJA_BUILD_CMDS
 	(cd $(@D); ./configure.py --bootstrap)
-- 
2.14.3
