From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 27 Dec 2019 10:37:35 +0100
Subject: [Buildroot] [PATCH 1/2] package/leveldb: disable benchmarks and
 tests
Message-ID: <20191227093736.373515-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Benchmarks and tests are enabled by default and benchmarks optionally
depend on sqlite

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/leveldb/leveldb.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index 5baf56c718..086fc53e47 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -10,6 +10,9 @@ LEVELDB_LICENSE = BSD-3-Clause
 LEVELDB_LICENSE_FILES = LICENSE
 LEVELDB_INSTALL_STAGING = YES
 LEVELDB_DEPENDENCIES = snappy
+LEVELDB_CONF_OPTS = \
+	-DLEVELDB_BUILD_BENCHMARKS=OFF \
+	-DLEVELDB_BUILD_TESTS=OFF \
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LEVELDB_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
-- 
2.24.0
