From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 24 Jan 2017 14:54:33 -0500
Subject: [Buildroot] [PATCH 05/10] janus-gateway: Make recordplay plugin
	optional.
In-Reply-To: <20170124195438.4144-1-aduskett@codeblue.com>
References: <20170124195438.4144-1-aduskett@codeblue.com>
Message-ID: <20170124195438.4144-5-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently janus-gateway is built by default with the recordplay plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want.
This patch makes the recordplay plugin a option.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index e1e3601..d2ffb8b 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -38,6 +38,12 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-echotest
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_PLUGIN_RECORDPLAY),y)
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-recordplay
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-recordplay
+endif
+
 ifeq ($(BR2_PACKAGE_JANUS_PLUGIN_SIP_GATEWAY),y)
 JANUS_GATEWAY_DEPENDENCIES += sofia-sip
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-sip
-- 
2.9.3
