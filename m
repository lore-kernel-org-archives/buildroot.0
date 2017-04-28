From: J Evans <g4@novadsp.com>
Date: Fri, 28 Apr 2017 23:28:06 +0100
Subject: [Buildroot] [PATCH 2/2] ne10: Add aarch64 configuration option
In-Reply-To: <1493418486-109149-1-git-send-email-g4@novadsp.com>
References: <1493418486-109149-1-git-send-email-g4@novadsp.com>
Message-ID: <1493418486-109149-2-git-send-email-g4@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J Evans <g4@novadsp.com>
---
 package/ne10/ne10.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index 0da862c..b4611e8 100755
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -17,6 +17,12 @@ NE10_CONF_OPTS += \
 	-DNE10_BUILD_SHARED=ON
 endif
 
+# 
+ifeq ($(BR2_aarch64),y)
+NE10_CONF_OPTS += \
+    -DNE10_LINUX_TARGET_ARCH=aarch64
+endif
+
 # The package does not have any install target, so have to provide
 # INSTALL_STAGING_CMDS and INSTALL_TARGET_CMDS.
 
-- 
2.7.4
