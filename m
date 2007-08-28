From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 28 Aug 2007 12:36:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpg123
Message-ID: <20070828193640.A003FA6825@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-28 12:36:40 -0700 (Tue, 28 Aug 2007)
New Revision: 19719

Log:
Remove renamed mpg123 patch

Removed:
   trunk/buildroot/package/mpg123/mpg123-cross.patch


Changeset:
Deleted: trunk/buildroot/package/mpg123/mpg123-cross.patch
===================================================================
--- trunk/buildroot/package/mpg123/mpg123-cross.patch	2007-08-28 19:35:54 UTC (rev 19718)
+++ trunk/buildroot/package/mpg123/mpg123-cross.patch	2007-08-28 19:36:40 UTC (rev 19719)
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
