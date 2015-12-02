From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Dec 2015 17:48:20 -0300
Subject: [Buildroot] [PATCH 8/9] wireshark: add optional geoip support
In-Reply-To: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1449089301-29762-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.4.10
