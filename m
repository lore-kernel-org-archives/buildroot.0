From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  9 Jan 2012 08:42:07 +0100
Subject: [Buildroot] [PATCH] python-netifaces: add -x option to fix
	cross-compilation
Message-ID: <1326094927-27207-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-netifaces/python-netifaces.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index e9a7099..5bfa326 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -14,7 +14,7 @@ define PYTHON_NETIFACES_BUILD_CMDS
 	(cd $(@D); \
 		PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
 		LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
-	$(HOST_DIR)/usr/bin/python setup.py build)
+	$(HOST_DIR)/usr/bin/python setup.py build -x)
 endef
 
 define PYTHON_NETIFACES_INSTALL_TARGET_CMDS
-- 
1.7.1.1
