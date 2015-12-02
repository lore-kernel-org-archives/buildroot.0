From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Dec 2015 17:48:17 -0300
Subject: [Buildroot] [PATCH 5/9] wireshark: add optional c-ares support
In-Reply-To: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1449089301-29762-5-git-send-email-gustavo@zacarias.com.ar>
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
index d60f3b4..2940d26 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -57,6 +57,13 @@ ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_QT5BASE_WIDGETS)
 WIRESHARK_CONF_OPTS += --disable-wireshark
 endif
 
+ifeq ($(BR2_PACKAGE_C_ARES),y)
+WIRESHARK_CONF_OPTS += --with-c-ares=$(STAGING_DIR)/usr
+WIRESHARK_DEPENDENCIES += c-ares
+else
+WIREHARK_CONF_OPTS += --without-c-ares
+endif
+
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 WIRESHARK_CONF_OPTS += --with-libnl
 WIRESHARK_DEPENDENCIES += libnl
-- 
2.4.10
