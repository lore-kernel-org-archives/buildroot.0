From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  4 Feb 2019 20:00:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/zbar: bump to version
 57d601e82089f2f31de9e1683c3834f237421f5d
Message-ID: <20190204190015.30321-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building statically zbar, build fails on:
configure: error: unable to find libv4l.so

The following errors are raised in config.log:
configure:19371:
/home/buildroot/buildroot-test/instance-0/output/host/bin/arm-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g2  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lv4l2 -lpthread  >&5
/home/buildroot/buildroot-test/instance-0/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libv4l2.a(libv4l2_la-libv4l2.o): In function `v4l2_set_src_and_dest_format':
/home/buildroot/buildroot-test/instance-0/output/build/libv4l-1.16.2/lib/libv4l2/libv4l2.c:952: undefined reference to `v4lconvert_supported_dst_format'

To fix this error, bump to version
57d601e82089f2f31de9e1683c3834f237421f5d to replace AC_CHECK_LIB by
PKG_CHECK_MODULES to find the correct library (-lv4lconvert but also
-ljpeg, ...)

Fixes:
 - http://autobuild.buildroot.org/results/acf39e4754508d7ee49e21f08ff0a1fcac4fb7cd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zbar/zbar.hash | 2 +-
 package/zbar/zbar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zbar/zbar.hash b/package/zbar/zbar.hash
index dcad1bd55c..6735bc67d6 100644
--- a/package/zbar/zbar.hash
+++ b/package/zbar/zbar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 fac99e835c4ced03a5a3d9c94c99aea118aef9663ed86a0ac45c9b7162dac4b1 zbar-b3b4e32b55f570372fc3af473e51f0a13ee57869.tar.gz
+sha256 94c71c6110c705f07ba5ba2803583d09b3853e8773169c86bdcf831443156aaa zbar-57d601e82089f2f31de9e1683c3834f237421f5d.tar.gz
 sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89 LICENSE
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index fd56e94e70..6df069e001 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZBAR_VERSION = b3b4e32b55f570372fc3af473e51f0a13ee57869
+ZBAR_VERSION = 57d601e82089f2f31de9e1683c3834f237421f5d
 ZBAR_SITE = git://linuxtv.org/zbar.git
 ZBAR_LICENSE = LGPL-2.1+
 ZBAR_LICENSE_FILES = LICENSE
-- 
2.14.1
