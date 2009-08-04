From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Aug 2009 17:05:48 +0200
Subject: [Buildroot] [git commit] libusb: fix host libtool dependency
Message-ID: <20090804150723.D15897781D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bdca3189a8fc71b0260218e0c4e05bdfd01daa73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libusb/libusb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 3d0d798..d613133 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -23,7 +23,7 @@ $(DL_DIR)/$(LIBUSB_SOURCE): $(LIBUSB_PATCH)
 libusb-source: $(DL_DIR)/$(LIBUSB_SOURCE) $(LIBUSB_PATCH)
 
 libusb-unpacked: $(LIBUSB_DIR)/.unpacked
-$(LIBUSB_DIR)/.unpacked: $(STAMP_DIR)/host_autoconf_installed $(STAMP_DIR)/host_automake_installed $(LIBTOOL) $(DL_DIR)/$(LIBUSB_SOURCE)
+$(LIBUSB_DIR)/.unpacked: $(STAMP_DIR)/host_autoconf_installed $(STAMP_DIR)/host_automake_installed $(STAMP_DIR)/host_libtool_installed $(DL_DIR)/$(LIBUSB_SOURCE)
 	$(LIBUSB_CAT) $(DL_DIR)/$(LIBUSB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(LIBUSB_PATCH_FILE),)
 	(cd $(LIBUSB_DIR) && $(LIBUSB_CAT) $(LIBUSB_PATCH) | patch -p1)
-- 
1.6.3.3
