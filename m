From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jul 2013 23:24:13 +0200
Subject: [Buildroot] [PATCH 2/4] package/nss-mdns: fix avahi socket location
In-Reply-To: <cover.1374182572.git.yann.morin.1998@free.fr>
References: <cover.1374182572.git.yann.morin.1998@free.fr>
Message-ID: <ecbc3969bbc335c75373f15fb7daa9e29248ec5d.1374182572.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

In buildroot, the avahi socket is located in /var/run/avahi-daemon,
not in /usr/var/run/avahi-daemon/socket.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/nss-mdns/nss-mdns.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.8.1.2
