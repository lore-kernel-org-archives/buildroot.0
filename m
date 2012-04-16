From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Apr 2012 23:12:38 +0200
Subject: [Buildroot] [git commit] libhid: don't build with -Werror
Message-ID: <20120416211304.5EFF996AED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e530970c28ac1341613cc7a3605960e0373731b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libhid/libhid.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index 7730af8..8ad9ac1 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -12,6 +12,10 @@ LIBHID_INSTALL_STAGING = YES
 # configure runs libusb-config for cflags/ldflags. Ensure it picks up
 # the target version
 LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(TARGET_PATH)
-LIBHID_CONF_OPT = --disable-swig --without-doxygen --disable-package-config
+LIBHID_CONF_OPT = \
+	--disable-swig \
+	--disable-werror \
+	--without-doxygen \
+	--disable-package-config
 
 $(eval $(call AUTOTARGETS))
