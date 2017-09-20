From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 20 Sep 2017 12:41:42 +0200
Subject: [Buildroot] [PATCH 2/3] package/softether: update patch to remove
	renames
In-Reply-To: <20170920104143.21404-1-bernd.kuhls@t-online.de>
References: <20170920104143.21404-1-bernd.kuhls@t-online.de>
Message-ID: <20170920104143.21404-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since
https://git.buildroot.net/buildroot/commit/?id=85f11d08c387c200dbb59a8559f2ba62376689bf
buildroot refuses to apply patches that contain renames.

Fixes
http://autobuild.buildroot.net/results/223/2237b9ec78044678aac9e743318ce5dc01309ab7/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...1-Create-autotools-plumbing-for-SoftEther.patch | 176 ++++++++++++++++++++-
 1 file changed, 172 insertions(+), 4 deletions(-)

diff --git a/package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch b/package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch
index 587a94d01f..09cf29a837 100644
--- a/package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch
+++ b/package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch
@@ -1494,10 +1494,178 @@ index 00000000..4a3fc2ba
 +
 +
 +AC_OUTPUT
-diff --git a/configure b/manual_configure
-similarity index 100%
-rename from configure
-rename to manual_configure
+--- a/configure	2016-04-24 16:49:31.000000000 +0200
++++ b/configure	1970-01-01 01:00:00.000000000 +0100
+@@ -1,83 +0,0 @@
+-#!/bin/sh
+-
+-echo '---------------------------------------------------------------------'
+-echo 'SoftEther VPN for Unix'
+-echo
+-echo 'Copyright (c) SoftEther VPN Project at University of Tsukuba, Japan.'
+-echo 'Copyright (c) Daiyuu Nobori. All Rights Reserved.'
+-echo
+-echo 'This program is free software; you can redistribute it and/or'
+-echo 'modify it under the terms of the GNU General Public License'
+-echo 'version 2 as published by the Free Software Foundation.'
+-echo
+-echo 'Read and understand README.TXT, LICENSE.TXT and WARNING.TXT before use.'
+-echo '---------------------------------------------------------------------'
+-echo
+-
+-echo 'Welcome to the corner-cutting configure script !'
+-echo
+-echo 'Select your operating system below:'
+-echo ' 1: Linux'
+-echo ' 2: FreeBSD'
+-echo ' 3: Solaris'
+-echo ' 4: Mac OS X'
+-echo ' 5: OpenBSD'
+-echo
+-echo -n 'Which is your operating system (1 - 5) ? : '
+-read TMP
+-echo
+-OS=""
+-if test "$TMP" = "1"
+-then
+-	OS="linux"
+-fi
+-if test "$TMP" = "2"
+-then
+-	OS="freebsd"
+-fi
+-if test "$TMP" = "3"
+-then
+-	OS="solaris"
+-fi
+-if test "$TMP" = "4"
+-then
+-	OS="macos"
+-fi
+-if test "$TMP" = "5"
+-then
+-	OS="openbsd"
+-fi
+-
+-if test "$OS" = ""
+-then
+-	echo "Wrong number."
+-	exit 1
+-fi
+-
+-echo 'Select your CPU bits below:'
+-echo ' 1: 32-bit'
+-echo ' 2: 64-bit'
+-echo
+-echo -n 'Which is the type of your CPU (1 - 2) ? : '
+-read TMP
+-echo
+-CPU=""
+-if test "$TMP" = "1"
+-then
+-	CPU="32bit"
+-fi
+-if test "$TMP" = "2"
+-then
+-	CPU="64bit"
+-fi
+-
+-if test "$CPU" = ""
+-then
+-	echo "Wrong number."
+-	exit 1
+-fi
+-
+-cp src/makefiles/${OS}_${CPU}.mak Makefile
+-
+-echo "The Makefile is generated. Run 'make' to build SoftEther VPN."
+-
+--- a/manual_configure	1970-01-01 01:00:00.000000000 +0100
++++ b/manual_configure	2016-04-24 16:49:31.000000000 +0200
+@@ -0,0 +1,83 @@
++#!/bin/sh
++
++echo '---------------------------------------------------------------------'
++echo 'SoftEther VPN for Unix'
++echo
++echo 'Copyright (c) SoftEther VPN Project at University of Tsukuba, Japan.'
++echo 'Copyright (c) Daiyuu Nobori. All Rights Reserved.'
++echo
++echo 'This program is free software; you can redistribute it and/or'
++echo 'modify it under the terms of the GNU General Public License'
++echo 'version 2 as published by the Free Software Foundation.'
++echo
++echo 'Read and understand README.TXT, LICENSE.TXT and WARNING.TXT before use.'
++echo '---------------------------------------------------------------------'
++echo
++
++echo 'Welcome to the corner-cutting configure script !'
++echo
++echo 'Select your operating system below:'
++echo ' 1: Linux'
++echo ' 2: FreeBSD'
++echo ' 3: Solaris'
++echo ' 4: Mac OS X'
++echo ' 5: OpenBSD'
++echo
++echo -n 'Which is your operating system (1 - 5) ? : '
++read TMP
++echo
++OS=""
++if test "$TMP" = "1"
++then
++	OS="linux"
++fi
++if test "$TMP" = "2"
++then
++	OS="freebsd"
++fi
++if test "$TMP" = "3"
++then
++	OS="solaris"
++fi
++if test "$TMP" = "4"
++then
++	OS="macos"
++fi
++if test "$TMP" = "5"
++then
++	OS="openbsd"
++fi
++
++if test "$OS" = ""
++then
++	echo "Wrong number."
++	exit 1
++fi
++
++echo 'Select your CPU bits below:'
++echo ' 1: 32-bit'
++echo ' 2: 64-bit'
++echo
++echo -n 'Which is the type of your CPU (1 - 2) ? : '
++read TMP
++echo
++CPU=""
++if test "$TMP" = "1"
++then
++	CPU="32bit"
++fi
++if test "$TMP" = "2"
++then
++	CPU="64bit"
++fi
++
++if test "$CPU" = ""
++then
++	echo "Wrong number."
++	exit 1
++fi
++
++cp src/makefiles/${OS}_${CPU}.mak Makefile
++
++echo "The Makefile is generated. Run 'make' to build SoftEther VPN."
++
 diff --git a/src/Cedar/Makefile.am b/src/Cedar/Makefile.am
 new file mode 100644
 index 00000000..5346537d
-- 
2.11.0
