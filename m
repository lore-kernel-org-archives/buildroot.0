From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Tue,  4 Feb 2014 10:38:57 +0100
Subject: [Buildroot] [PATCH 1/1] gpm: run autogen.sh as PRE_CONFIGURE step
Message-ID: <1391506737-16469-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the GPM_RUN_AUTOGEN to be a PRE_CONFIGURE step because this step
depends on the dependancies being built. If it is a POST_PATCH step
the dependancies won't be built and the GPM_RUN_AUTOGEN step will fail.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/gpm/gpm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index 296966a..58fab00 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -28,7 +28,7 @@ GPM_CONF_OPT = --without-curses
 define GPM_RUN_AUTOGEN
 	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
 endef
-GPM_POST_PATCH_HOOKS += GPM_RUN_AUTOGEN
+GPM_PRE_CONFIGURE_HOOKS += GPM_RUN_AUTOGEN
 
 GPM_DEPENDENCIES += host-automake host-autoconf host-libtool
 
-- 
1.8.3.2
