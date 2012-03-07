From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Mar 2012 20:34:16 +0100
Subject: [Buildroot] [PATCH 03/13] Remove filename extension crap for OS
	compatibility
In-Reply-To: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4b21c207e5fcfaa77f4cf8dd858014a0c6d04456.1331148806.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The only variable that is used is HOST_LOADLIBES, defined for the
cygwin case in the kconfig build. Since we don't support cygwin,
simply get rid of this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   28 ----------------------------
 1 files changed, 0 insertions(+), 28 deletions(-)

diff --git a/Makefile b/Makefile
index 7cc2380..c3ff284 100644
--- a/Makefile
+++ b/Makefile
@@ -194,34 +194,6 @@ unexport CONFIG_SITE
 
 GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
 
-#############################################################
-#
-# Setup the proper filename extensions for the host
-#
-##############################################################
-ifneq ($(findstring linux,$(GNU_HOST_NAME)),)
-HOST_EXEEXT:=
-HOST_LIBEXT:=.a
-HOST_SHREXT:=.so
-endif
-ifneq ($(findstring apple,$(GNU_HOST_NAME)),)
-HOST_EXEEXT:=
-HOST_LIBEXT:=.a
-HOST_SHREXT:=.dylib
-endif
-ifneq ($(findstring cygwin,$(GNU_HOST_NAME)),)
-HOST_EXEEXT:=.exe
-HOST_LIBEXT:=.lib
-HOST_SHREXT:=.dll
-HOST_LOADLIBES=-lcurses -lintl
-export HOST_LOADLIBES
-endif
-ifneq ($(findstring mingw,$(GNU_HOST_NAME)),)
-HOST_EXEEXT:=.exe
-HOST_LIBEXT:=.lib
-HOST_SHREXT:=.dll
-endif
-
 ##############################################################
 #
 # The list of stuff to build for the target toolchain
-- 
1.7.4.1
