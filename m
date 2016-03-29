From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 03:10:52 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20160329011110.962F3817F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4889509db2e9b0d76769f85c7b9ebf018da30edb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated ffmpeg option name after upstream renamed it:
https://github.com/tvheadend/tvheadend/commit/1359effe28a0381b8c9cbd362d6e144fb87b00fc#diff-e2d5a00791bce9a01f99bc6fd613a39dR37

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 14d0fb0..9406d08 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	9f25c79247ba59a6eb9ff8b9843b2e6cbc2702fa339a0ed89d24beb9017066e3	tvheadend-7adea4a102475fbeb0267a9ab160e1e0644f11c2.tar.gz
+sha256	50ada2f30387f9526e1ed453f778686b443e599841a73a031cdd543b65e7a502	tvheadend-cd9f07fb865e5700156546ee326fbaf42ee99cf8.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 3398faf..a7a8218 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 7adea4a102475fbeb0267a9ab160e1e0644f11c2
+TVHEADEND_VERSION = cd9f07fb865e5700156546ee326fbaf42ee99cf8
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
@@ -81,7 +81,7 @@ define TVHEADEND_CONFIGURE_CMDS
 			--python="$(HOST_DIR)/usr/bin/python"	\
 			--enable-dvbscan			\
 			--enable-bundle				\
-			--disable-libffmpeg_static		\
+			--disable-ffmpeg_static			\
 			--disable-hdhomerun_static		\
 			$(TVHEADEND_CONF_OPTS)			\
 	)
