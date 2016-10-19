From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:01:22 +0200
Subject: [Buildroot] [git commit] wireshark: avoid host qtchooser
Message-ID: <20161019210216.9A46A817FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d06e17cd0f83cf2cf5bffef900003c88966ad25a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some distros provide a 'qtchooser' utility to select Qt library
version. Make sure not to use that host provided utility.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/wireshark.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index ce83d52..b1ef3f5 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -41,6 +41,7 @@ endif
 ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
 WIRESHARK_CONF_OPTS += --with-qt=5
 WIRESHARK_DEPENDENCIES += qt5base
+WIRESHARK_CONF_ENV += ac_cv_path_QTCHOOSER=""
 # Seems it expects wrappers and passes a -qt=X parameter for version
 WIRESHARK_MAKE_OPTS += \
 	MOC="$(HOST_DIR)/usr/bin/moc" \
