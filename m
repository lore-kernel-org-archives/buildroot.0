From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 22:33:00 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/gdb: also disable
 gprof
Message-ID: <20201002204734.D9DD28E7D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5bc68f7b777c4a81c5ecb78b08bee87f023c930
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
index 46d745a897..469f25ff90 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -67,7 +67,8 @@ GDB_DISABLE_BINUTILS_CONF_OPTS = \
 	--disable-binutils \
 	--disable-install-libbfd \
 	--disable-ld \
-	--disable-gas
+	--disable-gas \
+	--disable-gprof
 
 GDB_CONF_ENV = \
 	ac_cv_type_uintptr_t=yes \
