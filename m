From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Jul 2013 09:31:06 +0200
Subject: [Buildroot] [git commit] gcc-final: ensure TARGET_DIR/usr/lib
	exists before copying to it
Message-ID: <20130717073159.54FF09A5C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fedf4815ba8fd7e600e9894ad321eb99049f9223
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Got dropped in the toolchain/gcc -> package/gcc conversion.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/gcc-final/gcc-final.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index b89b2b7..0d9d581 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -128,6 +128,7 @@ endif
 
 ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
 define HOST_GCC_FINAL_INSTALL_USR_LIBS
+	mkdir -p $(TARGET_DIR)/usr/lib
 	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
 		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
 			$(STAGING_DIR)/usr/lib/ ; \
