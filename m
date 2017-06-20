From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 23:09:49 +0200
Subject: [Buildroot] [git commit] janus-gateway: add unix-sockets to
	transport section
Message-ID: <20170620211023.389CB7FBE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6842b6774a2c7661af23ea681fcd3ae088160f34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
[Thomas: alphabetic ordering.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/janus-gateway/Config.in        | 4 ++++
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index b0e4ae9..5bd4e95 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -81,6 +81,10 @@ config BR2_PACKAGE_JANUS_REST
 comment "REST transport needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
+config BR2_PACKAGE_JANUS_UNIX_SOCKETS
+	bool "Unix Sockets"
+	default y
+
 config BR2_PACKAGE_JANUS_WEBSOCKETS
 	bool "WebSockets"
 	depends on BR2_USE_MMU
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index b19ed54..b32fc9a 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -104,6 +104,12 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-rest
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_UNIX_SOCKETS),y)
+JANUS_GATEWAY_CONF_OPTS += --enable-unix-sockets
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-unix-sockets
+endif
+
 ifeq ($(BR2_PACKAGE_JANUS_WEBSOCKETS),y)
 JANUS_GATEWAY_DEPENDENCIES += libwebsockets
 JANUS_GATEWAY_CONF_OPTS += --enable-websockets
