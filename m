From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:31:00 +0100
Subject: [Buildroot] [PATCH 29/39] libusb: convert to autotools
	infrastructure for host package
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f3e2f5c04e4da3bf9ff578d78377ae3cf9fad1e9.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libusb/libusb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index b93451b..618d36b 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -23,7 +23,7 @@ $(DL_DIR)/$(LIBUSB_SOURCE): $(LIBUSB_PATCH)
 libusb-source: $(DL_DIR)/$(LIBUSB_SOURCE) $(LIBUSB_PATCH)
 
 libusb-unpacked: $(LIBUSB_DIR)/.unpacked
-$(LIBUSB_DIR)/.unpacked: $(STAMP_DIR)/host_autoconf_installed $(STAMP_DIR)/host_automake_installed $(STAMP_DIR)/host_libtool_installed $(DL_DIR)/$(LIBUSB_SOURCE)
+$(LIBUSB_DIR)/.unpacked: host-autoconf host-automake host-libtool $(DL_DIR)/$(LIBUSB_SOURCE)
 	$(LIBUSB_CAT) $(DL_DIR)/$(LIBUSB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(LIBUSB_PATCH_FILE),)
 	(cd $(LIBUSB_DIR) && $(LIBUSB_CAT) $(LIBUSB_PATCH) | patch -p1)
-- 
1.6.3.3
