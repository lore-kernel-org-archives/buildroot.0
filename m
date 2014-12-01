From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:16:45 +0100
Subject: [Buildroot] [git commit] iostat: ensure binary gets installed with
	proper permissions
Message-ID: <20141201223450.454A480048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ad82a3eb4e8660ae0506d19d0eb2976177b5f3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iostat/iostat.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index 2080e56..d19a15a 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -16,7 +16,7 @@ define IOSTAT_BUILD_CMDS
 endef
 
 define IOSTAT_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(IOSTAT_DIR)/iostat $(TARGET_DIR)/usr/bin/iostat
+	$(INSTALL) -D -m 0755 $(IOSTAT_DIR)/iostat $(TARGET_DIR)/usr/bin/iostat
 endef
 
 $(eval $(generic-package))
