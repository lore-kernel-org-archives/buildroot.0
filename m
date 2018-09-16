From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Sep 2018 14:01:16 +0200
Subject: [Buildroot] [PATCH 1/1] botan: fix build with i586
Message-ID: <20180916120116.2835-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/randombit/botan/commit/513d19781a558fbd1ff03c7152f61b5e7f294297
removed support for i586, put it back otherwise the following build
failure is raised:

(cd /accts/mlweber1/instance-0/output/build/botan-2.7.0; PATH="/accts/mlweber1/instance-0/output/host/bin:/accts/mlweber1/instance-0/output/host/sbin:/usr/bin:/bin" ./configure.py --cpu="i586" --os=linux --cc=gcc --cc-bin="/accts/mlweber1/instance-0/output/host/bin/i586-linux-g++" --prefix=/usr --disable-static-library --enable-shared-library --without-stack-protector --with-boost --with-bzip2 --with-openssl --with-sqlite --with-lzma --with-zlib --disable-altivec --disable-neon)
   INFO: ./configure.py invoked with options "--cpu=i586 --os=linux --cc=gcc --cc-bin=/accts/mlweber1/instance-0/output/host/bin/i586-linux-g++ --prefix=/usr --disable-static-library --enable-shared-library --without-stack-protector --with-boost --with-bzip2 --with-openssl --with-sqlite --with-lzma --with-zlib --disable-altivec --disable-neon"
   INFO: Autodetected platform information: OS="Linux" machine="x86_64" proc="x86_64"
  ERROR: Unknown or unidentifiable processor "i586"

Fixes:
 - http://autobuild.buildroot.org/results/aaa2ea8c3fb5fe954c0af0061f83ad70e0a862f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/0002-Fix-build-with-i586.patch | 37 ++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/botan/0002-Fix-build-with-i586.patch

diff --git a/package/botan/0002-Fix-build-with-i586.patch b/package/botan/0002-Fix-build-with-i586.patch
new file mode 100644
index 0000000000..1d47f43d4a
--- /dev/null
+++ b/package/botan/0002-Fix-build-with-i586.patch
@@ -0,0 +1,37 @@
+From 3d448ae401de4c4826d53aebbf6690d103ebca90 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 16 Sep 2018 11:59:12 +0200
+Subject: [PATCH] Fix build with i586
+
+Commit 513d19781a558fbd1ff03c7152f61b5e7f294297 removed support for
+i586, put it back otherwise the following build failure is raised:
+
+(cd /accts/mlweber1/instance-0/output/build/botan-2.7.0; PATH="/accts/mlweber1/instance-0/output/host/bin:/accts/mlweber1/instance-0/output/host/sbin:/usr/bin:/bin" ./configure.py --cpu="i586" --os=linux --cc=gcc --cc-bin="/accts/mlweber1/instance-0/output/host/bin/i586-linux-g++" --prefix=/usr --disable-static-library --enable-shared-library --without-stack-protector --with-boost --with-bzip2 --with-openssl --with-sqlite --with-lzma --with-zlib --disable-altivec --disable-neon)
+   INFO: ./configure.py invoked with options "--cpu=i586 --os=linux --cc=gcc --cc-bin=/accts/mlweber1/instance-0/output/host/bin/i586-linux-g++ --prefix=/usr --disable-static-library --enable-shared-library --without-stack-protector --with-boost --with-bzip2 --with-openssl --with-sqlite --with-lzma --with-zlib --disable-altivec --disable-neon"
+   INFO: Autodetected platform information: OS="Linux" machine="x86_64" proc="x86_64"
+  ERROR: Unknown or unidentifiable processor "i586"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/aaa2ea8c3fb5fe954c0af0061f83ad70e0a862f9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/randombit/botan/pull/1687]
+---
+ src/build-data/arch/x86_32.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/build-data/arch/x86_32.txt b/src/build-data/arch/x86_32.txt
+index 6cbc5d0b3..a36c0c556 100644
+--- a/src/build-data/arch/x86_32.txt
++++ b/src/build-data/arch/x86_32.txt
+@@ -12,6 +12,7 @@ x86pc # for QNX
+ bepc  # for Haiku
+ 
+ i686
++i586
+ i386
+ </aliases>
+ 
+-- 
+2.17.1
+
-- 
2.17.1
