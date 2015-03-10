From: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
Date: Tue, 10 Mar 2015 17:37:13 -0400
Subject: [Buildroot] [PATCH] sunxi-mali: require fbset
Message-ID: <1426023433-24991-1-git-send-email-jerome.oufella@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>

The S80mali startup scripts depends on the presence of the fbset utility
to configure the display settings. To address this, select
BR2_PACKAGE_FBSET for the matter.

Signed-off-by: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
---
 package/sunxi-mali/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index c95ebbb..9a4eecc 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SUNXI_MALI
 	bool "sunxi-mali"
+	select BR2_PACKAGE_FBSET
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	# The egl/gles mali libraries are provided as a git submodule of the
-- 
2.1.0
