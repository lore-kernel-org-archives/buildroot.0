From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 23 Jun 2019 17:23:39 -0400
Subject: [Buildroot] [PATCH v12 3/6] package/gdb: depend on libiberty
In-Reply-To: <20190623212342.41809-1-aduskett@gmail.com>
References: <20190623212342.41809-1-aduskett@gmail.com>
Message-ID: <20190623212342.41809-4-aduskett@gmail.com>
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
v1 -> v11:
  - Add this patch to the series

 package/gdb/gdb.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 46d745a897..39d20be1aa 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -35,7 +35,9 @@ endif
 # For the host variant, we really want to build with XML support,
 # which is needed to read XML descriptions of target architectures. We
 # also need ncurses.
-HOST_GDB_DEPENDENCIES = host-expat host-ncurses
+# As for libiberty, gdb may use a system-isntalled one if present, so
+# we must ensure ours is installed first.
+HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses
 
 # Disable building documentation
 GDB_MAKE_OPTS += MAKEINFO=true
-- 
2.21.0
