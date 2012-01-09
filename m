From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 9 Jan 2012 23:50:50 +0100
Subject: [Buildroot] [git commit] python-netifaces: add -x option to fix
	cross-compilation
Message-ID: <20120110124715.5D32C901F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b10a8058206f246d8234c4adff9c6b29a6d3759c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
