From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Jul 2013 00:34:04 +0200
Subject: [Buildroot] [git commit] package/nss-mdns: fix avahi socket location
Message-ID: <20130718224318.5CEC99A1A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8a7960c3184bb97a8a60704cd4ba9b2c523188c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In buildroot, the avahi socket is located in /var/run/avahi-daemon,
not in /usr/var/run/avahi-daemon/socket.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nss-mdns/nss-mdns.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index ea53bc2..4d36633 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -7,6 +7,8 @@
 NSS_MDNS_VERSION=0.10
 NSS_MDNS_SITE=http://0pointer.de/lennart/projects/nss-mdns
 
+NSS_MDNS_CONF_OPT += --localstatedir=/var
+
 define NSS_MDNS_INSTALL_CONFIG
 	$(INSTALL) -D -m 0664 package/nss-mdns/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf
 endef
