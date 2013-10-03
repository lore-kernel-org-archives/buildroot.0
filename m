From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu,  3 Oct 2013 14:10:45 +0200
Subject: [Buildroot] [PATCH v7 6/6] Makefile: enable top-level parallel make
In-Reply-To: <1380802245-16978-1-git-send-email-fabio.porcedda@gmail.com>
References: <1380802245-16978-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1380802245-16978-7-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable top-level parallel make because the previous patches have fixed
all the know issue about top-level parallel make.

Example:
	make <board>_defconfig
	make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1))

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Makefile b/Makefile
index 2c9e17e..bd0b5ac 100644
--- a/Makefile
+++ b/Makefile
@@ -42,9 +42,6 @@ export HOSTARCH := $(shell uname -m | \
 	    -e s/macppc/powerpc/\
 	    -e s/sh.*/sh/)
 
-# This top-level Makefile can *not* be executed in parallel
-.NOTPARALLEL:
-
 # absolute path
 TOPDIR:=$(shell pwd)
 CONFIG_CONFIG_IN=Config.in
-- 
1.8.4
