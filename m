From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Dec 2015 17:48:16 -0300
Subject: [Buildroot] [PATCH 4/9] wireshark: add optional libnl suport
In-Reply-To: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1449089301-29762-4-git-send-email-gustavo@zacarias.com.ar>
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
index 9a8d370..d60f3b4 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -57,4 +57,11 @@ ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_QT5BASE_WIDGETS)
 WIRESHARK_CONF_OPTS += --disable-wireshark
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+WIRESHARK_CONF_OPTS += --with-libnl
+WIRESHARK_DEPENDENCIES += libnl
+else
+WIRESHARK_CONF_OPTS += --without-libnl
+endif
+
 $(eval $(autotools-package))
-- 
2.4.10
