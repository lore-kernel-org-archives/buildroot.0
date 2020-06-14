From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 14 Jun 2020 14:19:13 -0700
Subject: [Buildroot] [PATCH 2/2] package/janus-gateway: add systemd socket
 support
In-Reply-To: <20200614211913.646488-1-aduskett@gmail.com>
References: <20200614211913.646488-1-aduskett@gmail.com>
Message-ID: <20200614211913.646488-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If systemd is selected, add the systemd package to the dependency list and set
the conf opt --enable-systemd-sockets.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/janus-gateway/janus-gateway.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 0ecd83fce1..56b7d67332 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -112,4 +112,11 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-websockets
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+JANUS_GATEWAY_DEPENDENCIES += systemd
+JANUS_GATEWAY_CONF_OPTS += --enable-systemd-sockets
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-systemd-sockets
+endif
+
 $(eval $(autotools-package))
-- 
2.26.2
