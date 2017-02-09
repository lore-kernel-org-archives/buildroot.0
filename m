From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  9 Feb 2017 23:30:55 +0100
Subject: [Buildroot] [PATCH v1 2/2] WIP: qt5base: use system/buildroot
	provided harfbuzz
In-Reply-To: <20170209223055.31121-1-ps.report@gmx.net>
References: <20170209223055.31121-1-ps.report@gmx.net>
Message-ID: <20170209223055.31121-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Missing BR2_TOOLCHAIN_HAS_SYNC_4 dependecy propagation from harfbuzz.
---
 package/qt5/qt5base/Config.in  | 1 +
 package/qt5/qt5base/qt5base.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 337dcf245..9cfbd10ab 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -129,6 +129,7 @@ config BR2_PACKAGE_QT5BASE_XML
 config BR2_PACKAGE_QT5BASE_GUI
 	bool "gui module"
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_HARFBUZZ
 	# At least one graphic backend must be enabled, so enable
 	# linuxfb if nothing is enabled.
 	select BR2_PACKAGE_QT5BASE_LINUXFB if \
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 07803e776..5c17c649d 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -102,6 +102,8 @@ endif
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GUI),-gui,-no-gui)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GUI),-system-freetype,-no-freetype)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_GUI),freetype)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GUI),-system-harfbuzz,-no-harfbuzz)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_GUI),harfbuzz)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_WIDGETS),-widgets,-no-widgets)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_LINUXFB),--enable-linuxfb,-no-linuxfb)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-directfb)
-- 
2.11.0
