From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Dec 2015 22:38:31 +0100
Subject: [Buildroot] [git commit] wireshark: add optional geoip support
Message-ID: <20151203214016.1800081D4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab2e5dddfc9ea4a8214f8d968b9aab9617e01998
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 0bc7801..534131b 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -62,6 +62,13 @@ else
 WIREHARK_CONF_OPTS += --without-c-ares
 endif
 
+ifeq ($(BR2_PACKAGE_GEOIP),y)
+WIRESHARK_CONF_OPTS += --with-geoip=$(STAGING_DIR)/usr
+WIRESHARK_DEPENDENCIES += geoip
+else
+WIRESHARK_CONF_OPTS += --without-geoip
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 WIRESHARK_CONF_OPTS += --with-gnutls=yes
 WIRESHARK_DEPENDENCIES += gnutls
