From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 15:24:03 +0200
Subject: [Buildroot] [git commit] glibc: split hash files for licenses,
 fixes ARC
Message-ID: <20181010132409.D359F8257F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b14ad0bd697038e4cf48ecf48830fb3369f1f25e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Configuration that build a glibc toolchain on ARC currently fail to
run "make legal-info", because the hash for the LICENSES file is
different between the ARC glibc version, and glibc 2.28.

To fix this, this commit moves the hashes for the glibc license files
to per-version hash files.

Fixes:

  http://autobuild.buildroot.net/results/5a98a801dccaaeb4b5cbc26d9a017726d0953157/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/arc-2018.03-release/glibc.hash                          | 3 +++
 .../glibc.hash                                                        | 3 +++
 package/glibc/glibc.hash                                              | 4 ----
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/glibc/arc-2018.03-release/glibc.hash b/package/glibc/arc-2018.03-release/glibc.hash
new file mode 100644
index 0000000000..4c9830e6f6
--- /dev/null
+++ b/package/glibc/arc-2018.03-release/glibc.hash
@@ -0,0 +1,3 @@
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  61abdd6930c9c599062d89e916b3e7968783879b6be0ee1c6229dd6169def431  LICENSES
diff --git a/package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/glibc.hash b/package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/glibc.hash
new file mode 100644
index 0000000000..03abf1e96a
--- /dev/null
+++ b/package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/glibc.hash
@@ -0,0 +1,3 @@
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  35bdb41dc0bcb10702ddacbd51ec4c0fe6fb3129f734e8c85fc02e4d3eb0ce3f  LICENSES
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 9fff30e1ef..093392371a 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -2,7 +2,3 @@
 sha256  6e88cea4002efa7f78d86ea5e98eb92ed423d5a35068751517c4f00f56b8666c     glibc-glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab.tar.gz
 # Locally calculated (fetched from Github)
 sha256  e08ab67b2db2d0f0e8f3311d23c54fb8f6d4c1ef6fa0b4047fd5da400e3ce9de     glibc-arc-2018.03-release.tar.gz
-
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  35bdb41dc0bcb10702ddacbd51ec4c0fe6fb3129f734e8c85fc02e4d3eb0ce3f  LICENSES
