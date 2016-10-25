From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Tue, 25 Oct 2016 23:06:41 +0530
Subject: [Buildroot] [PATCH] zyre: disable docs
Message-ID: <1477417001-27870-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/c30/c307cfae46b800603b76f623840bd0fd950f0e3f/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
Note: Build doesn't fail on my PC. But confirmed that docs doesn't build.
---
 package/zyre/zyre.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 8647456..e47da97 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -11,6 +11,7 @@ ZYRE_LICENSE_FILES = LICENSE
 ZYRE_INSTALL_STAGING = YES
 ZYRE_DEPENDENCIES = czmq zeromq host-pkgconf
 ZYRE_AUTORECONF = YES
+ZYRE_CONF_OPTS = --without-docs
 
 define ZYRE_CREATE_CONFIG_DIR
 	mkdir -p $(@D)/config
-- 
2.6.2
