From: Julian Scheel <julian@jusst.de>
Date: Wed,  4 Feb 2015 16:34:57 +0100
Subject: [Buildroot] [PATCH] Export BR2_EXTERNAL for post-build/support
	scripts
Message-ID: <1423064097-1151-1-git-send-email-julian@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Especially post-build scripts might want to make use of BR2_EXTERNAL variable,
so export it.

Signed-off-by: Julian Scheel <julian@jusst.de>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index e554a30..92ae3fa 100644
--- a/Makefile
+++ b/Makefile
@@ -349,6 +349,7 @@ endif
 # Scripts in support/ or post-build scripts may need to reference
 # these locations, so export them so it is easier to use
 export BR2_CONFIG
+export BR2_EXTERNAL
 export TARGET_DIR
 export STAGING_DIR
 export HOST_DIR
-- 
2.2.1
