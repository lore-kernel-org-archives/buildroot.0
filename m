From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Nov 2020 16:06:19 +0100
Subject: [Buildroot] [PATCH 2/2] package/abootimg: use util-linux-libs
In-Reply-To: <20201101150619.1709959-1-fontaine.fabrice@gmail.com>
References: <20201101150619.1709959-1-fontaine.fabrice@gmail.com>
Message-ID: <20201101150619.1709959-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

abootimg only needs libblkid from util-linux-libs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/abootimg/abootimg.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/abootimg/abootimg.mk b/package/abootimg/abootimg.mk
index e906546948..d139d58ceb 100644
--- a/package/abootimg/abootimg.mk
+++ b/package/abootimg/abootimg.mk
@@ -9,8 +9,8 @@ ABOOTIMG_SITE = $(call github,ggrandou,abootimg,$(ABOOTIMG_VERSION))
 ABOOTIMG_LICENSE = GPL-2.0+
 ABOOTIMG_LICENSE_FILES = LICENSE
 
-# depends on libblkid from util-linux
-ABOOTIMG_DEPENDENCIES = util-linux
+# depends on libblkid from util-linux-libs
+ABOOTIMG_DEPENDENCIES = util-linux-libs
 
 define ABOOTIMG_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-- 
2.28.0
