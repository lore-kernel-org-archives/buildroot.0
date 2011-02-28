From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Feb 2011 17:18:16 +0100
Subject: [Buildroot] [git commit master 1/1] xerces: disable parallel builds
Message-ID: <20110228162119.CFB288F7B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=910a54002b9734b00a04111841cc1f628fec0a04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build system has a race condition causing build failure with high
BR2_JLEVEL values, so ensure make -j1 is used.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xerces/xerces.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 1dcc10a..6e84e64 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -78,7 +78,7 @@ $(XERCES_DIR)/.configured: $(XERCES_DIR)/.unpacked
 	touch $@
 
 $(XERCES_DIR)/src/.libs/$(LIBXERCES_BINARY): $(XERCES_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(XERCES_MAKE_OPT) -C $(XERCES_DIR)
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) $(XERCES_MAKE_OPT) -C $(XERCES_DIR)
 
 $(STAGING_DIR)/usr/lib/$(LIBXERCES_BINARY): $(XERCES_DIR)/src/.libs/$(LIBXERCES_BINARY)
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) \
-- 
1.7.3.4
