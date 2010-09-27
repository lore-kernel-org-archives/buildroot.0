From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 27 Sep 2010 10:22:04 +0200
Subject: [Buildroot] [PATCH] add lzop dependency
Message-ID: <4CA0542C.4080400@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lzop will be required to compress Linux kernel via lzo compression method.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Index: b/toolchain/dependencies/dependencies.sh
===================================================================
--- a/toolchain/dependencies/dependencies.sh	2010-08-26 16:37:08.000000000 +0200
+++ b/toolchain/dependencies/dependencies.sh	2010-09-27 09:52:29.000000000 +0200
@@ -137,7 +137,7 @@
 fi;
 
 # Check that a few mandatory programs are installed
-for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python svn ; do
+for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python svn lzop ; do
     if ! which $prog > /dev/null ; then
 	/bin/echo -e "\nYou must install '$prog' on your build machine";
 	if test $prog = "makeinfo" ; then
