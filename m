From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 22:32:54 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/gdb: also disable
 gprof
Message-ID: <20201002204714.99E948E7D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ada76af1e968197b703e51ec15ec5d9f99a4b827
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

When gdb is built from sources fetched from Git, it contains both the
gdb and the binutils code base. In order to really build only gdb, we
disable a number of binutils components in the
GDB_DISABLE_BINUTILS_CONF_OPTS variable: --disable-binutils,
--disable-ld, --disable-gas, etc. However, gprof was still being
built, so disable it as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 71719b91ee17fb99135a32c1d2504c57a329084a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/gdb.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 8c74a0e2f6..4bd0187343 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -69,7 +69,8 @@ GDB_DISABLE_BINUTILS_CONF_OPTS = \
 	--disable-binutils \
 	--disable-install-libbfd \
 	--disable-ld \
-	--disable-gas
+	--disable-gas \
+	--disable-gprof
 
 GDB_CONF_ENV = \
 	ac_cv_type_uintptr_t=yes \
