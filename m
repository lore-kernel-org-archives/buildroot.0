From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jun 2016 09:47:19 +0200
Subject: [Buildroot] [git commit] package/janus-gateway: Changed WebSockets
	library from libwebsock to libwebsockets
Message-ID: <20160606074803.7985B802A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c6d20c9dc69ea1d61f59ce1effa8f5c55be69b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see
https://github.com/meetecho/janus-gateway/commit/f500ae8ea492109e7e8d52c669e1a7d1a5021537

Fixes
http://autobuild.buildroot.net/results/e46/e468792af4aadbc6c9fce828a9d423e35c303b90/
http://autobuild.buildroot.net/results/88f/88f2cdbe2aad2d2476372dd4d559edf2bf16d5b1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/janus-gateway/janus-gateway.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 206a855..d65ab19 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -26,8 +26,8 @@ JANUS_GATEWAY_CONF_OPTS = \
 	--disable-data-channels \
 	--disable-rabbitmq
 
-ifeq ($(BR2_PACKAGE_LIBWEBSOCK),y)
-JANUS_GATEWAY_DEPENDENCIES += libwebsock
+ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
+JANUS_GATEWAY_DEPENDENCIES += libwebsockets
 JANUS_GATEWAY_CONF_OPTS += --enable-websockets
 else
 JANUS_GATEWAY_CONF_OPTS += --disable-websockets
