From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Apr 2012 16:02:48 +0200
Subject: [Buildroot] [git commit] Remove filename extension crap for OS
	compatibility
Message-ID: <20120419194555.3A06296B1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aba915fe2b189ca3efcb512f3d8cc0abd12fc1a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The only variable that is used is HOST_LOADLIBES, defined for the
cygwin case in the kconfig build. Since we don't support cygwin,
simply get rid of this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |   28 ----------------------------
 1 files changed, 0 insertions(+), 28 deletions(-)

diff --git a/Makefile b/Makefile
index 55d552b..bb3a49b 100644
--- a/Makefile
+++ b/Makefile
@@ -195,34 +195,6 @@ unexport CONFIG_SITE
 
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
