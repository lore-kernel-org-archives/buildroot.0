From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:59 +0200
Subject: [Buildroot] [PATCH 25/53] qt: things are no longer installed in
	$(HOST_DIR)/usr
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-26-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also fixup alignment that was broken due to mechanical replacement.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt/qt.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 465e81a778..960a34440c 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -612,11 +612,11 @@ QT_CONF_FILE = $(HOST_DIR)/bin/qt.conf
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
@@ -630,7 +630,7 @@ define QT_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 	mkdir -p $(HOST_DIR)/bin
 	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/bin
-	ln -sf $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr/mkspecs
+	ln -sf $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/mkspecs
 	$(QT_INSTALL_QT_CONF)
 	for i in moc uic rcc lupdate lrelease ; do \
 		$(SED) "s,^$${i}_location=.*,$${i}_location=$(HOST_DIR)/bin/$${i}," \
-- 
2.11.0
