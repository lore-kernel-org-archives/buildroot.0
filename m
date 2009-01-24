From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 24 Jan 2009 10:31:32 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mpg123
Message-ID: <20090124103132.E7569769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-24 10:31:32 +0000 (Sat, 24 Jan 2009)
New Revision: 25003

Log:
mpg123: remove unused legacy patch

Removed:
   trunk/buildroot/package/multimedia/mpg123/mpg123-0.59r-cross.patch


Changeset:
Deleted: trunk/buildroot/package/multimedia/mpg123/mpg123-0.59r-cross.patch
===================================================================
--- trunk/buildroot/package/multimedia/mpg123/mpg123-0.59r-cross.patch	2009-01-24 10:23:00 UTC (rev 25002)
+++ trunk/buildroot/package/multimedia/mpg123/mpg123-0.59r-cross.patch	2009-01-24 10:31:32 UTC (rev 25003)
@@ -1,44 +0,0 @@
-diff -ruN mpg123-0.59r.orig/Makefile mpg123-0.59r/Makefile
---- mpg123-0.59r.orig/Makefile	1999-06-15 22:39:06.000000000 +0200
-+++ mpg123-0.59r/Makefile	2006-12-14 15:52:44.000000000 +0100
-@@ -103,14 +103,14 @@
-         mpg123-make
- 
- linux:
--	$(MAKE) CC=gcc LDFLAGS= \
-+	$(MAKE) LDFLAGS= \
- 		OBJECTS='decode_i386.o dct64_i386.o decode_i586.o \
- 			audio_oss.o term.o' \
- 		CFLAGS='-DI386_ASSEM -DPENTIUM_OPT -DREAL_IS_FLOAT -DLINUX \
- 			-DREAD_MMAP -DOSS -DTERM_CONTROL\
--			-Wall -O2 -m486 \
-+			-Wall \
- 			-fomit-frame-pointer -funroll-all-loops \
--			-finline-functions -ffast-math' \
-+			-finline-functions -ffast-math $(CFLAGS)' \
- 		mpg123-make
- 
- linux-3dnow:
-@@ -246,6 +246,22 @@
- 			-finline-functions -ffast-math' \
- 		mpg123-make
- 
-+linux-bigend:
-+	$(MAKE) LDFLAGS= OBJECTS='decode.o dct64.o audio_oss.o' \
-+		CFLAGS+='-DREAL_IS_FLOAT -DLINUX -DREAD_MMAP \
-+			-DOSS -DOSS_BIG_ENDIAN -Wall \
-+			-fomit-frame-pointer -funroll-loops \
-+			-finline-functions -ffast-math $(CFLAGS)' \
-+		mpg123-make
-+
-+linux-littleend:
-+	$(MAKE) LDFLAGS= OBJECTS='decode.o dct64.o audio_oss.o' \
-+		CFLAGS='-DREAL_IS_FLOAT -DLINUX -DREAD_MMAP \
-+			-DOSS -Wall \
-+			-fomit-frame-pointer -funroll-loops \
-+			-finline-functions -ffast-math $(CFLAGS)' \
-+		mpg123-make
-+
- linux-sajber:
- 	@ $(MAKE) FRONTEND=sajberplay-make linux-frontend
- 
