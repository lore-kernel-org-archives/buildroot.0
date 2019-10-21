From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 21 Oct 2019 13:04:36 -0700
Subject: [Buildroot] [PATCH v14 3/5] package/gdb: depend on libiberty
In-Reply-To: <20191021200438.97453-1-aduskett@gmail.com>
References: <20191021200438.97453-1-aduskett@gmail.com>
Message-ID: <20191021200438.97453-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If present, GDB may use a system installed libiberty. As such, we must ensure
that host-libiberty is installed first.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
v13 -> v14:
  - Fix typo in the comment. (Arnout)

v1 -> v11:
  - Add this patch to the series

 package/gdb/gdb.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 46d745a897..01f7e14460 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -35,7 +35,9 @@ endif
 # For the host variant, we really want to build with XML support,
 # which is needed to read XML descriptions of target architectures. We
 # also need ncurses.
-HOST_GDB_DEPENDENCIES = host-expat host-ncurses
+# As for libiberty, gdb may use a system-installed one if present, so
+# we must ensure ours is installed first.
+HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses
 
 # Disable building documentation
 GDB_MAKE_OPTS += MAKEINFO=true
-- 
2.21.0
