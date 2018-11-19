From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 21:42:34 +0100
Subject: [Buildroot] [git commit] keepalive: add optional json-c dependency
Message-ID: <20181202071556.75D218843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6748f35f3d28c6ccf7f10d3f4660ca681abb191b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/keepalived/keepalived.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 8756811e04..fa8b2e4112 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -13,6 +13,13 @@ KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_AUTORECONF = YES
 KEEPALIVED_CONF_OPTS += --disable-dbus
 
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+KEEPALIVED_DEPENDENCIES += json-c
+KEEPALIVED_CONF_OPTS += --enable-json
+else
+KEEPALIVED_CONF_OPTS += --disable-json
+endif
+
 ifeq ($(BR2_PACKAGE_LIBNL)$(BR2_PACKAGE_LIBNFNETLINK),yy)
 KEEPALIVED_DEPENDENCIES += libnl libnfnetlink
 KEEPALIVED_CONF_OPTS += --enable-libnl
