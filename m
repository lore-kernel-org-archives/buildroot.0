From: Eric Limpens <limpens@gmail.com>
Date: Fri, 20 Jun 2014 00:00:23 +0200
Subject: [Buildroot] [PATCH 2/2] Change Makefile into a crosscompile
	friendly version
In-Reply-To: <1403215223-10871-1-git-send-email-limpens@gmail.com>
References: <1403215223-10871-1-git-send-email-limpens@gmail.com>
Message-ID: <1403215223-10871-2-git-send-email-limpens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Limpens <limpens@gmail.com>
---
 ...ifmrds-000-Makefile-crosscompile-friendly.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/pifmrds/pifmrds-000-Makefile-crosscompile-friendly.patch

diff --git a/package/pifmrds/pifmrds-000-Makefile-crosscompile-friendly.patch b/package/pifmrds/pifmrds-000-Makefile-crosscompile-friendly.patch
new file mode 100644
index 0000000..8b8cd49
--- /dev/null
+++ b/package/pifmrds/pifmrds-000-Makefile-crosscompile-friendly.patch
@@ -0,0 +1,25 @@
+diff -purN PiFmRds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile
+--- PiFmRds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile	2014-05-04 18:21:40.000000000 +0200
++++ pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile	2014-06-19 21:21:14.220328601 +0200
+@@ -1,20 +1,8 @@
+-CC = gcc
+-STD_CFLAGS = -Wall -std=gnu99 -c -g -O3
+-
+-# Enable ARM-specific options only on ARM, and compilation of the app only on ARM
+-UNAME := $(shell uname -m)
+-
+-ifeq ($(UNAME), armv6l)
+-	CFLAGS = $(STD_CFLAGS) -march=armv6 -mtune=arm1176jzf-s -mfloat-abi=hard -mfpu=vfp -ffast-math
++all:	app rds_wav
+ 
+ app: rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o
+ 	$(CC) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lm -lsndfile
+ 
+-else
+-	CFLAGS = $(STD_CFLAGS)
+-endif
+-
+-
+ rds_wav: rds.o waveforms.o rds_wav.o fm_mpx.o
+ 	$(CC) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lm -lsndfile
+ 
-- 
1.9.1
