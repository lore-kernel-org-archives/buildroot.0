From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 16:45:15 +0200
Subject: [Buildroot] [PATCH 03/22] Remove filename extension crap for OS
	compatibility
In-Reply-To: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5cae11523664c212bbb8278fce0d36d79a0a0acc.1334673910.git.thomas.petazzoni@free-electrons.com>
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
index 90c2086..e03fed5 100644
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
