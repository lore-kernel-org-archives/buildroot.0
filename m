From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:46:41 +0200
Subject: [Buildroot] [git commit] gdb: Remove /usr part from installation
	path of gdbserver
Message-ID: <20170705095036.0F23F817B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=967874a65589079cc8f9d2d0c6ec8c86cee100b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 7036b4c..9a97cb7 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -181,7 +181,7 @@ GDB_POST_INSTALL_TARGET_HOOKS += GDB_REMOVE_UNNEEDED_FILES
 # does.
 define GDB_SDK_INSTALL_GDBSERVER
 	$(INSTALL) -D -m 0755 $(TARGET_DIR)/usr/bin/gdbserver \
-		$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/debug-root/usr/bin/gdbserver
+		$(HOST_DIR)/$(GNU_TARGET_NAME)/debug-root/usr/bin/gdbserver
 endef
 
 ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
