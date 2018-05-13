From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 21:07:34 +0200
Subject: [Buildroot] [PATCH 5/8] janus-gateway: rename options to have
 proper prefix
In-Reply-To: <20180513190737.26079-1-thomas.petazzoni@bootlin.com>
References: <20180513190737.26079-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180513190737.26079-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sub-options of the janus-gateway package had their name option
prefixed by BR2_PACKAGE_JANUS, while the prefix should be
BR2_PACKAGE_JANUS_GATEWAY. This commit fixes that, and adds the
necessary Config.in.legacy handling.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                       | 117 +++++++++++++++++++++++++++++++++
 package/janus-gateway/Config.in        |  28 ++++----
 package/janus-gateway/janus-gateway.mk |  28 ++++----
 3 files changed, 145 insertions(+), 28 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 314e0578d8..981306f469 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,123 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.05"
 
+config BR2_PACKAGE_JANUS_AUDIO_BRIDGE
+	bool "janus-gateway audio-bridge option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_JANUS_GATEWAY_AUDIO_BRIDGE
+	help
+	  For consistency reasons, the janus-gateway option
+	  BR2_PACKAGE_JANUS_AUDIO_BRIDGE has been renamed to
+	  BR2_PACKAGE_JANUS_GATEWAY_AUDIO_BRIDGE.
+
+config BR2_PACKAGE_JANUS_ECHO_TEST
+	bool "janus-gateway echo-test option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_JANUS_GATEWAY_ECHO_TEST
+	help
+	  For consistency reasons, the janus-gateway option
+	  BR2_PACKAGE_JANUS_ECHO_TEST has been renamed to
+	  BR2_PACKAGE_JANUS_GATEWAY_ECHO_TEST.
+
+config BR2_PACKAGE_JANUS_RECORDPLAY
+	bool "janus-gateway recordplay option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_JANUS_GATEWAY_RECORDPLAY
+	help
+	  For consistency reasons, the janus-gateway option
+	  BR2_PACKAGE_JANUS_RECORDPLAY has been renamed to
+	  BR2_PACKAGE_JANUS_GATEWAY_RECORDPLAY.
+
+config BR2_PACKAGE_JANUS_SIP_GATEWAY
+	bool "janus-gateway sip-gateway option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_JANUS_GATEWAY_SIP_GATEWAY
+	help
+	  For consistency reasons, the janus-gateway option
+	  BR2_PACKAGE_JANUS_SIP_GATEWAY has been renamed to
+	  BR2_PACKAGE_JANUS_GATEWAY_SIP_GATEWAY.
+
+config BR2_PACKAGE_JANUS_STREAMING
+	bool "janus-gateway streaming option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_JANUS_GATEWAY_STREAMING
+	help
+	  For consistency reasons, the janus-gateway option
+	  BR2_PACKAGE_JANUS_STREAMING has been renamed to
+	  BR2_PACKAGE_JANUS_GATEWAY_STREAMING.
+
+config BR2_PACKAGE_JANUS_TEXT_ROOM
+	bool "janus-gateway text-room option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_JANUS_GATEWAY_TEXT_ROOM
+	help
+	  For consistency reasons, the janus-gateway option
+	  BR2_PACKAGE_JANUS_TEXT_ROOM has been renamed to
+	  BR2_PACKAGE_JANUS_GATEWAY_TEXT_ROOM.
+
+config BR2_PACKAGE_JANUS_VIDEO_CALL
+	bool "janus-gateway video-call option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_JANUS_GATEWAY_VIDEO_CALL
+	help
+	  For consistency reasons, the janus-gateway option
+	  BR2_PACKAGE_JANUS_VIDEO_CALL has been renamed to
+	  BR2_PACKAGE_JANUS_GATEWAY_VIDEO_CALL.
+
+config BR2_PACKAGE_JANUS_VIDEO_ROOM
+	bool "janus-gateway video-room option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_JANUS_GATEWAY_VIDEO_ROOM
+	help
+	  For consistency reasons, the janus-gateway option
+	  BR2_PACKAGE_JANUS_VIDEO_ROOM has been renamed to
+	  BR2_PACKAGE_JANUS_GATEWAY_VIDEO_ROOM.
+
+config BR2_PACKAGE_JANUS_MQTT
+	bool "janus-gateway mqtt option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_JANUS_GATEWAY_MQTT
+	help
+	  For consistency reasons, the janus-gateway option
+	  BR2_PACKAGE_JANUS_MQTT has been renamed to
+	  BR2_PACKAGE_JANUS_GATEWAY_MQTT.
+
+config BR2_PACKAGE_JANUS_RABBITMQ
+	bool "janus-gateway rabbitmq option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_JANUS_GATEWAY_RABBITMQ
+	help
+	  For consistency reasons, the janus-gateway option
+	  BR2_PACKAGE_JANUS_RABBITMQ has been renamed to
+	  BR2_PACKAGE_JANUS_GATEWAY_RABBITMQ.
+
+config BR2_PACKAGE_JANUS_REST
+	bool "janus-gateway rest option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_JANUS_GATEWAY_REST
+	help
+	  For consistency reasons, the janus-gateway option
+	  BR2_PACKAGE_JANUS_REST has been renamed to
+	  BR2_PACKAGE_JANUS_GATEWAY_REST.
+
+config BR2_PACKAGE_JANUS_UNIX_SOCKETS
+	bool "janus-gateway unix-sockets option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_JANUS_GATEWAY_UNIX_SOCKETS
+	help
+	  For consistency reasons, the janus-gateway option
+	  BR2_PACKAGE_JANUS_UNIX_SOCKETS has been renamed to
+	  BR2_PACKAGE_JANUS_GATEWAY_UNIX_SOCKETS.
+
+config BR2_PACKAGE_JANUS_WEBSOCKETS
+	bool "janus-gateway websockets option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_JANUS_GATEWAY_WEBSOCKETS
+	help
+	  For consistency reasons, the janus-gateway option
+	  BR2_PACKAGE_JANUS_WEBSOCKETS has been renamed to
+	  BR2_PACKAGE_JANUS_GATEWAY_WEBSOCKETS.
+
 config BR2_PACKAGE_IPSEC_SECCTX_DISABLE
 	bool "ipsec-tools security context disable option renamed"
 	select BR2_LEGACY
diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 5bd4e9586b..071183dc5f 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -19,21 +19,21 @@ if BR2_PACKAGE_JANUS_GATEWAY
 
 comment "plugins"
 
-config BR2_PACKAGE_JANUS_AUDIO_BRIDGE
+config BR2_PACKAGE_JANUS_GATEWAY_AUDIO_BRIDGE
 	bool "audio bridge"
 	select BR2_PACKAGE_OPUS
 
-config BR2_PACKAGE_JANUS_ECHO_TEST
+config BR2_PACKAGE_JANUS_GATEWAY_ECHO_TEST
 	bool "echo test"
 
-config BR2_PACKAGE_JANUS_RECORDPLAY
+config BR2_PACKAGE_JANUS_GATEWAY_RECORDPLAY
 	bool "record and play"
 
-config BR2_PACKAGE_JANUS_SIP_GATEWAY
+config BR2_PACKAGE_JANUS_GATEWAY_SIP_GATEWAY
 	bool "sip gateway"
 	select BR2_PACKAGE_SOFIA_SIP
 
-config  BR2_PACKAGE_JANUS_STREAMING
+config  BR2_PACKAGE_JANUS_GATEWAY_STREAMING
 	bool "streaming"
 	# SO_REUSEPORT
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
@@ -41,22 +41,22 @@ config  BR2_PACKAGE_JANUS_STREAMING
 comment "streaming plugin needs a toolchain w/ headers >= 3.9"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 
-config BR2_PACKAGE_JANUS_TEXT_ROOM
+config BR2_PACKAGE_JANUS_GATEWAY_TEXT_ROOM
 	bool "text room"
 
-config BR2_PACKAGE_JANUS_VIDEO_CALL
+config BR2_PACKAGE_JANUS_GATEWAY_VIDEO_CALL
 	bool "video call"
 
-config BR2_PACKAGE_JANUS_VIDEO_ROOM
+config BR2_PACKAGE_JANUS_GATEWAY_VIDEO_ROOM
 	bool "video room"
 
-config BR2_PACKAGE_JANUS_VOICE_MAIL
+config BR2_PACKAGE_JANUS_GATEWAY_VOICE_MAIL
 	bool "voice mail"
 	select BR2_PACKAGE_LIBOGG
 
 comment "transports"
 
-config BR2_PACKAGE_JANUS_MQTT
+config BR2_PACKAGE_JANUS_GATEWAY_MQTT
 	bool "MQTT"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -65,7 +65,7 @@ config BR2_PACKAGE_JANUS_MQTT
 comment "MQTT transport needs a toolchain w/ threads and dynamic library support"
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_JANUS_RABBITMQ
+config BR2_PACKAGE_JANUS_GATEWAY_RABBITMQ
 	bool "RabbitMQ"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_RABBITMQ_C
@@ -73,7 +73,7 @@ config BR2_PACKAGE_JANUS_RABBITMQ
 comment "RabbitMQ transport needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_JANUS_REST
+config BR2_PACKAGE_JANUS_GATEWAY_REST
 	bool "REST (HTTP/HTTPS)"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBMICROHTTPD
@@ -81,11 +81,11 @@ config BR2_PACKAGE_JANUS_REST
 comment "REST transport needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_JANUS_UNIX_SOCKETS
+config BR2_PACKAGE_JANUS_GATEWAY_UNIX_SOCKETS
 	bool "Unix Sockets"
 	default y
 
-config BR2_PACKAGE_JANUS_WEBSOCKETS
+config BR2_PACKAGE_JANUS_GATEWAY_WEBSOCKETS
 	bool "WebSockets"
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBWEBSOCKETS
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index c37cda0860..261fc25202 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -26,91 +26,91 @@ JANUS_GATEWAY_CONF_OPTS = \
 	--disable-data-channels \
 	--disable-sample-event-handler
 
-ifeq ($(BR2_PACKAGE_JANUS_AUDIO_BRIDGE),y)
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_AUDIO_BRIDGE),y)
 JANUS_GATEWAY_DEPENDENCIES += opus
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-audiobridge
 else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-audiobridge
 endif
 
-ifeq ($(BR2_PACKAGE_JANUS_ECHO_TEST),y)
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_ECHO_TEST),y)
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-echotest
 else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-echotest
 endif
 
-ifeq ($(BR2_PACKAGE_JANUS_RECORDPLAY),y)
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_RECORDPLAY),y)
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-recordplay
 else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-recordplay
 endif
 
-ifeq ($(BR2_PACKAGE_JANUS_SIP_GATEWAY),y)
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_SIP_GATEWAY),y)
 JANUS_GATEWAY_DEPENDENCIES += sofia-sip
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-sip
 else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-sip
 endif
 
-ifeq ($(BR2_PACKAGE_JANUS_STREAMING),y)
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_STREAMING),y)
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-streaming
 else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-streaming
 endif
 
-ifeq ($(BR2_PACKAGE_JANUS_TEXT_ROOM),y)
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_TEXT_ROOM),y)
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-textroom
 else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-textroom
 endif
 
-ifeq ($(BR2_PACKAGE_JANUS_VIDEO_CALL),y)
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_VIDEO_CALL),y)
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-videocall
 else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-videocall
 endif
 
-ifeq ($(BR2_PACKAGE_JANUS_VIDEO_ROOM),y)
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_VIDEO_ROOM),y)
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-videoroom
 else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-videoroom
 endif
 
-ifeq ($(BR2_PACKAGE_JANUS_VOICE_MAIL),y)
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_VOICE_MAIL),y)
 JANUS_GATEWAY_DEPENDENCIES += libogg
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-voicemail
 else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-voicemail
 endif
 
-ifeq ($(BR2_PACKAGE_JANUS_MQTT),y)
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_MQTT),y)
 JANUS_GATEWAY_DEPENDENCIES += paho-mqtt-c
 JANUS_GATEWAY_CONF_OPTS += --enable-mqtt
 else
 JANUS_GATEWAY_CONF_OPTS += --disable-mqtt
 endif
 
-ifeq ($(BR2_PACKAGE_JANUS_RABBITMQ),y)
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_RABBITMQ),y)
 JANUS_GATEWAY_DEPENDENCIES += rabbitmq-c
 JANUS_GATEWAY_CONF_OPTS += --enable-rabbitmq
 else
 JANUS_GATEWAY_CONF_OPTS += --disable-rabbitmq
 endif
 
-ifeq ($(BR2_PACKAGE_JANUS_REST),y)
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_REST),y)
 JANUS_GATEWAY_DEPENDENCIES += libmicrohttpd
 JANUS_GATEWAY_CONF_OPTS += --enable-rest
 else
 JANUS_GATEWAY_CONF_OPTS += --disable-rest
 endif
 
-ifeq ($(BR2_PACKAGE_JANUS_UNIX_SOCKETS),y)
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_UNIX_SOCKETS),y)
 JANUS_GATEWAY_CONF_OPTS += --enable-unix-sockets
 else
 JANUS_GATEWAY_CONF_OPTS += --disable-unix-sockets
 endif
 
-ifeq ($(BR2_PACKAGE_JANUS_WEBSOCKETS),y)
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_WEBSOCKETS),y)
 JANUS_GATEWAY_DEPENDENCIES += libwebsockets
 JANUS_GATEWAY_CONF_OPTS += --enable-websockets
 else
-- 
2.14.3
