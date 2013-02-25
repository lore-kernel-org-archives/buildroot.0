From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Feb 2013 15:53:01 +0100
Subject: [Buildroot] [git commit] enlightenment: Alsa backend needs mixer
	support
Message-ID: <20130225145348.EE0BB9AD31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c54347c35006acbcade56256b5b09d12ee8938d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/3d6e35e3cda9428cc422b4f6203ba912bdc11faf/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/enlightenment/enlightenment.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index cd3b21f..5d77869 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -28,6 +28,13 @@ ENLIGHTENMENT_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet \
 			 --disable-rpath
 
+# alsa backend needs mixer support
+ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
+ENLIGHTENMENT_DEPENDENCIES += alsa-lib
+else
+ENLIGHTENMENT_CONF_ENV += enable_alsa=no
+endif
+
 ifeq ($(BR2_HAVE_DOCUMENTATION),)
 define ENLIGHTENMENT_REMOVE_DOCUMENTATION
 	rm -rf $(TARGET_DIR)/usr/share/enlightenment/doc/
