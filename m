From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:47 -0000
Subject: [Buildroot] [git commit branch/next] nanocom: use provided
	compiler/linker flags as well
Message-ID: <20120802195246.8ED758C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6d1887d26994a4da5db947f9ecdde5c85b47fa9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nanocom/nanocom.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
index 4fb7aee..8421397 100644
--- a/package/nanocom/nanocom.mk
+++ b/package/nanocom/nanocom.mk
@@ -13,7 +13,7 @@ define NANOCOM_EXTRACT_CMDS
 endef
 
 define NANOCOM_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" -C $(@D)
 endef
 
 define NANOCOM_INSTALL_TARGET_CMDS
