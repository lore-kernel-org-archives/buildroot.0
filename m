From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 15:23:03 +0200
Subject: [Buildroot] [git commit] qt: fix up alignment after mechanical
	replacement
Message-ID: <20170705141335.1807581D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2ea6eaf23202c92063931bba6fe8f5506e90d52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index d867718..1dcb05d 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -598,11 +598,11 @@ QT_CONF_FILE = $(HOST_DIR)/bin/qt.conf
 define QT_INSTALL_QT_CONF
 	mkdir -p $(dir $(QT_CONF_FILE))
 	echo "[Paths]"                             > $(QT_CONF_FILE)
-	echo "Prefix=$(HOST_DIR)"             >> $(QT_CONF_FILE)
+	echo "Prefix=$(HOST_DIR)"                 >> $(QT_CONF_FILE)
 	echo "Headers=$(STAGING_DIR)/usr/include" >> $(QT_CONF_FILE)
 	echo "Libraries=$(STAGING_DIR)/usr/lib"   >> $(QT_CONF_FILE)
-	echo "Data=$(HOST_DIR)"               >> $(QT_CONF_FILE)
-	echo "Binaries=$(HOST_DIR)/bin"       >> $(QT_CONF_FILE)
+	echo "Data=$(HOST_DIR)"                   >> $(QT_CONF_FILE)
+	echo "Binaries=$(HOST_DIR)/bin"           >> $(QT_CONF_FILE)
 endef
 
 # After running Qt normal installation process (which installs
