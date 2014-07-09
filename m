From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jul 2014 15:46:33 +0200
Subject: [Buildroot] [git commit] openvpn: disable plugins for static builds
Message-ID: <20140709134642.CE99C9D1E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93d23777811176d6f24b64f0ee54261bee0bff1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/082/08295cdcb3d14198bc7fbddec89d6fead946afba/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 3cb78a5..d2c408b 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -10,7 +10,8 @@ OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_LICENSE = GPLv2
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
-OPENVPN_CONF_OPT = --disable-plugin-auth-pam --enable-iproute2
+OPENVPN_CONF_OPT = --disable-plugin-auth-pam --enable-iproute2 \
+	$(if $(BR2_PREFER_STATIC_LIB),--disable-plugins)
 OPENVPN_CONF_ENV = IFCONFIG=/sbin/ifconfig \
 	NETSTAT=/bin/netstat \
 	ROUTE=/sbin/route
