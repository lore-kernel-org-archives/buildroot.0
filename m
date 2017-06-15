From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 15 Jun 2017 08:13:10 -0400
Subject: [Buildroot] [PATCH 3/7] janus-gatway: add websockets to transport
	section.
In-Reply-To: <20170615121314.1485-1-aduskett@codeblue.com>
References: <20170615121314.1485-1-aduskett@codeblue.com>
Message-ID: <20170615121314.1485-3-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/janus-gateway/Config.in        | 4 ++++
 package/janus-gateway/janus-gateway.mk | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 7fc213f..eaec8a1 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -60,6 +60,10 @@ config BR2_PACKAGE_JANUS_REST
 	bool "REST (HTTP/HTTPS)"
 	select BR2_PACKAGE_LIBMICROHTTPD
 
+config BR2_PACKAGE_JANUS_WEBSOCKETS
+	bool "WebSockets"
+	select BR2_PACKAGE_LIBWEBSOCKETS
+
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 01021f8..4a13199 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -84,7 +84,7 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-voicemail
 endif
 
-ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
+ifeq ($(BR2_PACKAGE_JANUS_WEBSOCKETS),y)
 JANUS_GATEWAY_DEPENDENCIES += libwebsockets
 JANUS_GATEWAY_CONF_OPTS += --enable-websockets
 else
-- 
2.9.4
