From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Wed, 23 Dec 2020 11:35:01 +0800
Subject: [Buildroot] [PATCH 1/1] package/tini: install docker-init symlink
Message-ID: <20201223033501.1890640-1-tianyuanhao@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christian Stewart <christian@paral.in>

This removes the warning that docker can't find docker-init in PATH.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
---
 package/tini/tini.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tini/tini.mk b/package/tini/tini.mk
index 157477f8df..af4a3bcb5e 100644
--- a/package/tini/tini.mk
+++ b/package/tini/tini.mk
@@ -30,6 +30,7 @@ endef
 
 define TINI_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/bin/tini $(TARGET_DIR)/usr/bin/tini
+	ln -sf tini $(TARGET_DIR)/usr/bin/docker-init
 endef
 
 # Tini's CMakeLists.txt is not suitable for Buildroot.
-- 
2.25.1
