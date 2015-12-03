From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Dec 2015 22:37:13 +0100
Subject: [Buildroot] [git commit] wireshark: add optional libnl suport
Message-ID: <20151203214015.E42BE8198C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8540551034fd8c1096138fc462fefc705ed896dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
