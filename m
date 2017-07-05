From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Jul 2017 13:14:25 +0200
Subject: [Buildroot] [PATCH v4 08/36] qt: fix up alignment after mechanical
	replacement
In-Reply-To: <20170705111453.2284-1-arnout@mind.be>
References: <20170705111453.2284-1-arnout@mind.be>
Message-ID: <20170705111453.2284-9-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt/qt.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index d867718c47..1dcb05d6af 100644
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
-- 
2.13.2
