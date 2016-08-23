From: =?UTF-8?q?Manuel=20V=C3=B6gele?= <develop@manuel-voegele.de>
Date: Tue, 23 Aug 2016 12:56:49 +0200
Subject: [Buildroot] [PATCH 1/1] python-pyqt: Removed 'compileall' directive
	from INSTALL_TARGET_CMDS
Message-ID: <20160823105649.1267-1-develop@manuel-voegele.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since all python modules are now byte-compiled globally this is no
longer necessary.

Signed-off-by: Manuel V?gele <develop@manuel-voegele.de>
---
 package/python-pyqt/python-pyqt.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
index fa298c4..50e8351 100644
--- a/package/python-pyqt/python-pyqt.mk
+++ b/package/python-pyqt/python-pyqt.mk
@@ -108,9 +108,6 @@ define PYTHON_PYQT_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
 	touch $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4/__init__.py
 	$(RM) -rf $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4/uic/$(PYTHON_PYQT_RM_PORT_BASE)
-	PYTHONPATH="$(PYTHON_PATH)" \
-		$(HOST_DIR)/usr/bin/python -c "import compileall; \
-		compileall.compile_dir('$(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4')"
 endef
 
 $(eval $(generic-package))
-- 
2.1.4
