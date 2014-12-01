From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 09:38:10 +0100
Subject: [Buildroot] [git commit] gdb: unbreak host-gdb with python support
	if python3 is enabled
Message-ID: <20141201083953.213D17FFF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3fa9141827999d1482dab2323507d2d0d2729c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/ef4/ef487b495e57f098af0fe9508d430b56b0750339/

Explicitly pass the path to host-python to ensure it gets used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/gdb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 8d0f76d..dbec760 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -146,7 +146,7 @@ else
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON),y)
-	HOST_GDB_CONF_OPTS += --with-python
+	HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/usr/bin/python2
 	HOST_GDB_DEPENDENCIES += host-python
 else
 	HOST_GDB_CONF_OPTS += --without-python
