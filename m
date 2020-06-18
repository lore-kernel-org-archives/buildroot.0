From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:14:19 +0200
Subject: [Buildroot] [git commit] package/janus-gateway: add systemd socket
 support
Message-ID: <20200618201238.1934D85F62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=190d563b3847b9357835e0b6333c24cbc67c46d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If systemd is selected, add the systemd package to the dependency list and set
the conf opt --enable-systemd-sockets.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
