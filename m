From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Oct 2017 20:02:14 +0200
Subject: [Buildroot] [PATCH v1] gdb: prevent installation of libbfd.so
Message-ID: <20171027180214.12657-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
For a previous discussion on this topic see [1].

[1] http://lists.busybox.net/pipermail/buildroot/2017-September/202337.html
---
 package/gdb/gdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 7e86ba0c7e..8c4188b1fe 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -111,7 +111,7 @@ GDB_CONF_OPTS = \
 	--with-curses \
 	--without-included-gettext \
 	--disable-werror \
-	--enable-static
+	--enable-static --disable-shared
 
 # When gdb is built as C++ application for ARC it segfaults at runtime
 # So we pass --disable-build-with-cxx config option to force gdb not to
-- 
2.14.2
