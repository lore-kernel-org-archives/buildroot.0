From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Oct 2016 14:26:31 +0300
Subject: [Buildroot] [PATCH 2/3] wireshark: avoid host qtchooser
In-Reply-To: <a6f0bcffe24a338538c4da2f04091967593fa058.1476789992.git.baruch@tkos.co.il>
References: <a6f0bcffe24a338538c4da2f04091967593fa058.1476789992.git.baruch@tkos.co.il>
Message-ID: <e5503728e3ffc38e69ef0c443777ba24a2a2b116.1476789992.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some distros provide a 'qtchooser' utility to select Qt library
version. Make sure not to use that host provided utility.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/wireshark/wireshark.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index e71b419d8773..01886c803ea8 100644
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
-- 
2.9.3
