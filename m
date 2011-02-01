From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Feb 2011 20:53:05 +0100
Subject: [Buildroot] [git commit master 1/1] barebox: use ccache if enabled
Message-ID: <20110201203534.CDF058EE4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a7306b8aa5b51f7c6e9f5327e0bd80c11cfadda6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/barebox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 3df424c..07266d9 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -19,7 +19,7 @@ else
 BAREBOX_ARCH=$(KERNEL_ARCH)
 endif
 
-BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE=$(TARGET_CROSS)
+BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)"
 
 $(DL_DIR)/$(BAREBOX_SOURCE):
 	 $(call DOWNLOAD,$(BAREBOX_SITE),$(BAREBOX_SOURCE))
-- 
1.7.3.4
