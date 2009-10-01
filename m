From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Oct 2009 21:40:05 +0200
Subject: [Buildroot] [git commit master] mdnsresponder: fix -source target
Message-ID: <20091001194038.28D99777AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6a0a14d4e4b679db135e62fbe5ba9398d53281b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mdnsresponder/mdnsresponder.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mdnsresponder/mdnsresponder.mk b/package/mdnsresponder/mdnsresponder.mk
index bb836ab..514cd8a 100644
--- a/package/mdnsresponder/mdnsresponder.mk
+++ b/package/mdnsresponder/mdnsresponder.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_MDNSRESPONDER_UTILS),y)
 endif
 
 $(DL_DIR)/$(MDNSRESPONDER_SOURCE):
-	$(call DOWNLOAD,$(MDNSRESPONDER_SITE))
+	$(call DOWNLOAD,$(MDNSRESPONDER_SITE),$(MDNSRESPONDER_SOURCE))
 
 $(MDNSRESPONDER_DIR)/.unpacked: $(DL_DIR)/$(MDNSRESPONDER_SOURCE)
 	$(MDNSRESPONDER_CAT) $(DL_DIR)/$(MDNSRESPONDER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-- 
1.6.3.3
