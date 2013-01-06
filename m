From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 17:14:02 +0100
Subject: [Buildroot] [PATCH] gstreamer: provide necessary config value for
	AArch64
Message-ID: <1357488842-22491-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Provide the as_cv_unaligned_access value for the AArch64 architecture.

Fixes:

  http://autobuild.buildroot.net/results/5d6d76451a00d79e1bdfe87b6ced61807666cc48/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/gstreamer/gstreamer.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index b87f029..3fb913e 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -15,6 +15,9 @@ GSTREAMER_INSTALL_STAGING = YES
 ifeq ($(BR2_avr32),y)
 GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
 endif
+ifeq ($(BR2_aarch64),y)
+GSTREAMER_CONF_ENV = as_cv_unaligned_access=yes
+endif
 
 GSTREAMER_CONF_OPT = \
 		--disable-examples \
-- 
1.7.9.5
