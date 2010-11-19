From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 15:05:20 +0100
Subject: [Buildroot] [git commit master 1/1] makedevs: add source targets
Message-ID: <20101119141255.EC1088D2FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c7af389523ba4134ba88c2e4481a56dab84d3594
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/makedevs/makedevs.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index a3bb5cb..eee635e 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -18,6 +18,7 @@ $(TARGET_DIR)/usr/bin/makedevs: $(MAKEDEVS_DIR)/makedevs
 	$(INSTALL) -m 755 $^ $@
 
 makedevs: $(TARGET_DIR)/usr/bin/makedevs
+makedevs-source:
 
 HOST_MAKEDEVS_DIR=$(BUILD_DIR)/host-makedevs
 
@@ -32,4 +33,5 @@ $(HOST_MAKEDEVS_DIR)/makedevs: $(HOST_MAKEDEVS_DIR)/makedevs.c
 $(HOST_DIR)/usr/bin/makedevs: $(HOST_MAKEDEVS_DIR)/makedevs
 	$(INSTALL) -m 755 $^ $@
 
-host-makedevs: $(HOST_DIR)/usr/bin/makedevs
\ No newline at end of file
+host-makedevs: $(HOST_DIR)/usr/bin/makedevs
+host-makedevs-source:
-- 
1.7.2.2
