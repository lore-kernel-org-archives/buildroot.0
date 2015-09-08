From: Brendan Heading <brendanheading@gmail.com>
Date: Tue,  8 Sep 2015 15:05:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/host-gdb: fix autobuild failure
Message-ID: <1441721106-27234-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes :

http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/

.. and many others.

host-gdb is broken on all architectures at the moment, as it seems to
require makeinfo during "make install" even if configure
failed to detect it. Instead of trying to hack it, let's simply make gdb
dependent on host-texinfo.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 package/gdb/gdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 338de20..efe195a 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -40,7 +40,7 @@ endif
 # For the host variant, we really want to build with XML support,
 # which is needed to read XML descriptions of target architectures. We
 # also need ncurses.
-HOST_GDB_DEPENDENCIES = host-expat host-ncurses
+HOST_GDB_DEPENDENCIES = host-expat host-ncurses host-texinfo
 
 # Apply the Xtensa specific patches
 XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
-- 
2.4.3
