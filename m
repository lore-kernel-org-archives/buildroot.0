From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:54 -0000
Subject: [Buildroot] [git commit branch/next] mediastreamer: disable test
	programs
Message-ID: <20120802195236.616B996AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fefae21c3f5f03d9f57dcd61e151acbebbbfbe1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Building tests produces an error during the "OBJCLD mediastream" phase with
some toolchains/architectures.

This is supposed to fix:
 - http://autobuild.buildroot.net/results/7fca436524e5f7ba300d27c615061b0838adb1e2
 - http://autobuild.buildroot.net/results/bd9027ce94348025f1ca02a77eb81b9200124d9a
 - http://autobuild.buildroot.net/results/4d9f554fc29901be1a577ca0c39369befee269b5

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mediastreamer/mediastreamer.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 8327a55..a503490 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -2,6 +2,8 @@ MEDIASTREAMER_VERSION = 2.8.2
 MEDIASTREAMER_SITE = http://download.savannah.nongnu.org/releases/linphone/mediastreamer
 MEDIASTREAMER_INSTALL_STAGING = YES
 MEDIASTREAMER_DEPENDENCIES = host-intltool host-pkg-config ortp
+# tests fail linking on some architectures, so disable them
+MEDIASTREAMER_CONF_OPT = --disable-tests
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 MEDIASTREAMER_CONF_OPT += --enable-alsa
