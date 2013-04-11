From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 23:09:13 +0200
Subject: [Buildroot] [git commit] gdb: add back $ARCH-linux-gdb symlink for
	host-gdb
Message-ID: <20130411211022.B796A9B5A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4e6f4fef777bff7635939ed4de61e45733a3e6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like we do for the toolchain and we used to to do for gdb.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gdb/gdb.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index cec64d5..73ff7a4 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -111,5 +111,13 @@ HOST_GDB_CONF_OPT = \
 	--without-included-gettext \
 	--disable-sim
 
+# legacy $arch-linux-gdb symlink
+define HOST_GDB_ADD_SYMLINK
+	cd $(HOST_DIR)/usr/bin && \
+		ln -snf $(GNU_TARGET_NAME)-gdb $(ARCH)-linux-gdb
+endef
+
+HOST_GDB_POST_INSTALL_HOOKS += HOST_GDB_ADD_SYMLINK
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
