From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Nov 2014 16:53:34 +0100
Subject: [Buildroot] [git commit] rtai: fix typo in config script fixup
Message-ID: <20141125155521.CAB727FE8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4a1a4f4ea1e24264444542184279bc04448dd5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Spielmann Werner <Werner.Spielmann@SWAROVSKI.COM>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtai/rtai.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index 33318e8..6f94121 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -11,7 +11,7 @@ RTAI_INSTALL_STAGING = YES
 
 # The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of rtai-config
 define RTAI_POST_PATCH_FIXUP
-	(SED) 's%^staging=.*%staging=$(STAGING_DIR)%' $(STAGING_DIR)/usr/bin/rtai-config
+	$(SED) 's%^staging=.*%staging=$(STAGING_DIR)%' $(STAGING_DIR)/usr/bin/rtai-config
 endef
 
 RTAI_POST_INSTALL_STAGING_HOOKS += RTAI_POST_PATCH_FIXUP
