From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 19 Oct 2014 20:04:48 +0200
Subject: [Buildroot] [PATCH 12/15] package/ne10: cleanup configure options
In-Reply-To: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1413741891-30113-13-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BUILD_SHARED_LIBS is already driven by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/ne10/ne10.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index cb635e4..49e0704 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -11,11 +11,6 @@ NE10_LICENSE_FILES = doc/LICENSE
 
 NE10_CONF_OPTS = -DGNULINUX_PLATFORM=ON
 
-ifeq ($(BR2_PREFER_STATIC_LIB),)
-NE10_CONF_OPTS += \
-	-DNE10_BUILD_SHARED=ON
-endif
-
 # The package does not have any install target, so have to provide
 # INSTALL_STAGING_CMDS and INSTALL_TARGET_CMDS.
 
-- 
2.1.2
