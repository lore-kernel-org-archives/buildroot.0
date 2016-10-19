From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:02:11 +0200
Subject: [Buildroot] [git commit] wireshark: needs the qt5tools lrelease
	utility
Message-ID: <20161019210216.A64BD81E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa6feffa0def0ee88c7c1ac05e7d14deec0e2db1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/0a4/0a4ccf752ed1e81e2416d33a78984b47087f68bd/
http://autobuild.buildroot.net/results/196/196b96e28a2cd5983a58948df4a2c3eb3bccdfa4/
http://autobuild.buildroot.net/results/056/056b3299ce45552fe3e7cbf5aa68b223f8fa458e/

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/Config.in    | 2 ++
 package/wireshark/wireshark.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 4982c1f..959fb5b 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_WIRESHARK
 	bool "wireshark"
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_QT5TOOLS if BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS if BR2_PACKAGE_QT5BASE_WIDGETS
 	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index b1ef3f5..f7cc8f8 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -40,7 +40,7 @@ endif
 # Qt4 needs accessibility, we don't support it
 ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
 WIRESHARK_CONF_OPTS += --with-qt=5
-WIRESHARK_DEPENDENCIES += qt5base
+WIRESHARK_DEPENDENCIES += qt5base qt5tools
 WIRESHARK_CONF_ENV += ac_cv_path_QTCHOOSER=""
 # Seems it expects wrappers and passes a -qt=X parameter for version
 WIRESHARK_MAKE_OPTS += \
