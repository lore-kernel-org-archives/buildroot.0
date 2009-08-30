From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Aug 2009 22:08:21 +0200
Subject: [Buildroot] [git commit master] util-linux: fix libblkid detection
Message-ID: <20090830200849.4B56C7776F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=621e8726f927642359adec4b0916ca5c8c9fec22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't have libblkid in BR, so make sure the configure script doesn't
detect it if it is installed on the host.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/util-linux/util-linux.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 7f0d740..c9bae16 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -30,6 +30,7 @@ $(UTIL-LINUX_DIR)/.configured: $(UTIL-LINUX_DIR)/.unpacked
 	(cd $(UTIL-LINUX_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
+		ac_cv_lib_blkid_blkid_known_fstype=no \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
-- 
1.6.3.3
