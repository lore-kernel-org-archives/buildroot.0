From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Sep 2015 23:30:55 +0200
Subject: [Buildroot] [git commit] package/libyuv: Fix aarch64 support
Message-ID: <20150913215906.AB67581992@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e64c5685acc5fa913628b44a08e4d3928f45215d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

aarch64 is a NEON-enabled arch according to the source code[1] but the
files containing the NEON-specific functions[2] were not added to the
build using CMake.

Fixes
http://autobuild.buildroot.net/results/c8d/c8d9bff33484b598ff85a26771ce51295bec550d/
http://autobuild.buildroot.net/results/7f3/7f3a09157c4c385434458b6aafec202376e75706/
http://autobuild.buildroot.net/results/991/9917d7bb18305c6a6bcbd9fe2aa986d452f7d4a4/
http://autobuild.buildroot.net/results/6bf/6bf9e48b53f77b8a7bb8a667ea3f63298a4685ce/
http://autobuild.buildroot.net/results/ccf/ccff5d1cb3de8642e3fa24a6b01b31a503df67f9/
http://autobuild.buildroot.net/results/0c5/0c559f1b1b9bc9f2e2a131e34f034ce4e34fa75b/
http://autobuild.buildroot.net/results/bf3/bf324985e9bbcd61196304de1d0313a0e216a0a8/
http://autobuild.buildroot.net/results/d55/d552e5e46c263ff9860192a993ee9ed11d7783a6/
http://autobuild.buildroot.net/results/2d7/2d73ccdfd5d06bd6dfdc4e303fe48a554460fa1c/
http://autobuild.buildroot.net/results/972/97207ed46a519368e242f0621e4363d522e21ee8/
http://autobuild.buildroot.net/results/d84/d84d54d85183296c57c9131d946e4517ddcaa84d/
http://autobuild.buildroot.net/results/c18/c189149b8d2a0242da06ec68863db23cd0fa65b8/
http://autobuild.buildroot.net/results/73a/73a026644179708692c43166a8ffba3ce0e19d95/

[1] https://freeswitch.org/stash/projects/SD/repos/libyuv/browse/include/libyuv/row.h#263
[2] https://freeswitch.org/stash/projects/SD/repos/libyuv/browse/BUILD.gn#101

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libyuv/0002-aarch64.patch |   36 ++++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/libyuv/0002-aarch64.patch b/package/libyuv/0002-aarch64.patch
new file mode 100644
index 0000000..c783cff
--- /dev/null
+++ b/package/libyuv/0002-aarch64.patch
@@ -0,0 +1,36 @@
+Add missing source files for aarch64.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr libyuv-1ebf86795cb213a37f06eb1ef3713cff080568ea.org/CMakeLists.txt libyuv-1ebf86795cb213a37f06eb1ef3713cff080568ea/CMakeLists.txt
+--- libyuv-1ebf86795cb213a37f06eb1ef3713cff080568ea.org/CMakeLists.txt	2015-06-20 00:04:06.000000000 +0200
++++ libyuv-1ebf86795cb213a37f06eb1ef3713cff080568ea/CMakeLists.txt	2015-09-07 19:29:42.898034988 +0200
+@@ -14,6 +14,7 @@
+   ${ly_src_dir}/compare.cc
+   ${ly_src_dir}/compare_common.cc
+   ${ly_src_dir}/compare_neon.cc
++  ${ly_src_dir}/compare_neon64.cc
+   ${ly_src_dir}/compare_gcc.cc
+   ${ly_src_dir}/compare_win.cc
+   ${ly_src_dir}/convert.cc
+@@ -31,10 +32,12 @@
+   ${ly_src_dir}/rotate_argb.cc
+   ${ly_src_dir}/rotate_mips.cc
+   ${ly_src_dir}/rotate_neon.cc
++  ${ly_src_dir}/rotate_neon64.cc
+   ${ly_src_dir}/row_any.cc
+   ${ly_src_dir}/row_common.cc
+   ${ly_src_dir}/row_mips.cc
+   ${ly_src_dir}/row_neon.cc
++  ${ly_src_dir}/row_neon64.cc
+   ${ly_src_dir}/row_gcc.cc
+   ${ly_src_dir}/row_win.cc
+   ${ly_src_dir}/scale.cc
+@@ -43,6 +46,7 @@
+   ${ly_src_dir}/scale_common.cc
+   ${ly_src_dir}/scale_mips.cc
+   ${ly_src_dir}/scale_neon.cc
++  ${ly_src_dir}/scale_neon64.cc
+   ${ly_src_dir}/scale_gcc.cc
+   ${ly_src_dir}/scale_win.cc
+   ${ly_src_dir}/video_common.cc
