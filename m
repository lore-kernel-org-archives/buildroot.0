From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 13:55:13 +0200
Subject: [Buildroot] [git commit] snappy: disable tests
Message-ID: <20150714115517.ECC8F819AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9818c94945bb882e0544d452d1d789d3fecfc57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will also fix an unsafe header path problem:

/br/output/host/usr/bin/mips-linux-gnu-g++ -DHAVE_CONFIG_H -I.
-I/usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64   -Os  -c -o snappy_unittest-snappy-test.o `test
-f 'snappy-test.cc' || echo './'`snappy-test.cc
mips-linux-gnu-g++: ERROR: unsafe header/library path used in
cross-compilation: '/usr/include'
Makefile:730: recipe for target 'snappy_unittest-snappy_unittest.o'
failed

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/snappy/snappy.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index 6bda7ce..b00dddf 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -13,4 +13,7 @@ SNAPPY_AUTORECONF = YES
 SNAPPY_DEPENDENCIES = host-pkgconf
 SNAPPY_INSTALL_STAGING = YES
 
+# Disable tests
+SNAPPY_CONF_OPTS = --disable-gtest
+
 $(eval $(autotools-package))
