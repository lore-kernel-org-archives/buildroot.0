From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Oct 2018 08:02:39 +0100
Subject: [Buildroot] [git commit] package/mjpg-streamer: add optional
 dependency to zeromq
Message-ID: <20181028071412.D5E408296B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a4e2bfd64a6f5fe26bdd6d6f8e1e6e21854cbc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ZeroMQ output module also depends on protobuf, see upstream PR 145.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mjpg-streamer/mjpg-streamer.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index de8bad0c03..4077a3dcbc 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -29,6 +29,13 @@ else
 MJPG_STREAMER_CONF_OPTS += -DPLUGIN_INPUT_OPENCV=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_PROTOBUF_C)$(BR2_PACKAGE_ZEROMQ),yy)
+MJPG_STREAMER_CONF_OPTS += -DPLUGIN_OUTPUT_ZMQSERVER=ON
+MJPG_STREAMER_DEPENDENCIES += host-pkgconf protobuf-c zeromq
+else
+MJPG_STREAMER_CONF_OPTS += -DPLUGIN_OUTPUT_ZMQSERVER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_SDL),y)
 MJPG_STREAMER_CONF_OPTS += -DPLUGIN_OUTPUT_VIEWER=ON
 MJPG_STREAMER_DEPENDENCIES += host-pkgconf sdl
