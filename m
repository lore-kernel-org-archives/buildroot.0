From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Dec 2015 22:37:26 +0100
Subject: [Buildroot] [git commit] wireshark: add optional c-ares support
Message-ID: <20151203214015.F119E8198C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c27a25403b9bb1a870fb4b8e45ccd2cf5f2daba8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
