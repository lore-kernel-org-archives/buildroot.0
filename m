From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 7 Jan 2020 21:23:55 +0100
Subject: [Buildroot] [git commit] package/leveldb: disable benchmarks and
 tests
Message-ID: <20200107201409.507E4836F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=723dfa4d1b9c54fc13caa5aa60dd487fd47964e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Benchmarks and tests are enabled by default and benchmarks optionally
depend on sqlite

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/leveldb/leveldb.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index 5baf56c718..5f5288be1c 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -10,6 +10,9 @@ LEVELDB_LICENSE = BSD-3-Clause
 LEVELDB_LICENSE_FILES = LICENSE
 LEVELDB_INSTALL_STAGING = YES
 LEVELDB_DEPENDENCIES = snappy
+LEVELDB_CONF_OPTS = \
+	-DLEVELDB_BUILD_BENCHMARKS=OFF \
+	-DLEVELDB_BUILD_TESTS=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LEVELDB_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
