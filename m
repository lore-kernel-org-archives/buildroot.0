From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 17:43:51 +0100
Subject: [Buildroot] [git commit] gstreamer: provide necessary config value
	for AArch64
Message-ID: <20130106164433.D60069A5E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3210cbac3cce63ae74fd2936849937b90c35cfb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Provide the as_cv_unaligned_access value for the AArch64 architecture.

Fixes:

  http://autobuild.buildroot.net/results/5d6d76451a00d79e1bdfe87b6ced61807666cc48/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gstreamer/gstreamer.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
