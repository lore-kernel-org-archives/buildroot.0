From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 13:43:10 +0100
Subject: [Buildroot] [git commit] live555: bump version
Message-ID: <20140113211744.6607D9C414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02e51ba86483a0260b39f1871a95012deef0a25f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And cleanup/add license info while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/live555/live555.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 1fc533b..7bb45cf 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2011.06.16
+LIVE555_VERSION = 2014.01.11
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public/
+LIVE555_LICENSE = LGPLv2.1+
+LIVE555_LICENSE_FILES = COPYING
 LIVE555_INSTALL_STAGING = YES
 
 define LIVE555_CONFIGURE_CMDS
@@ -34,12 +36,10 @@ LIVE555_LIBS_TO_INSTALL = \
 	UsageEnvironment/libUsageEnvironment.a \
 	BasicUsageEnvironment/libBasicUsageEnvironment.a
 
-LIVE555_FILES_TO_INSTALL- =
 LIVE555_FILES_TO_INSTALL-y =
 LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_OPENRTSP) += testProgs/openRTSP
 LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MEDIASERVER) += mediaServer/live555MediaServer
 LIVE555_FILES_TO_INSTALL-$(BR2_PACKAGE_LIVE555_MPEG2_INDEXER) += testProgs/MPEG2TransportStreamIndexer
-LIVE555_FILES_TO_INSTALL- += $(LIVE555_FILES_TO_INSTALL-y)
 
 define LIVE555_INSTALL_STAGING_CMDS
 	for i in $(LIVE555_HEADERS_TO_INSTALL); do \
