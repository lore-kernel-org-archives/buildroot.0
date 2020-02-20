From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Feb 2020 22:07:17 +0100
Subject: [Buildroot] [git commit branch/next] package/gdb: depend on
 libiberty
Message-ID: <20200220212007.6AF0B8E650@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0a583ddc4c2cab121330284e316f54229dee492
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

If present, GDB may use a system installed libiberty. As such, we must ensure
that host-libiberty is installed first.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
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
