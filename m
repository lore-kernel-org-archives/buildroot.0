From: hartleys <hartleys@visionengravers.com>
Date: Wed, 5 Nov 2008 12:16:02 -0500
Subject: [Buildroot] [PATCH] Make the MESSAGE Macro work
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909C91CCD@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

The following patch makes the MESSAGE Macro in Makefile.autotools.in
work.

I think it was originally intended to print the messages in bold type
but it doesn't appear to work correctly. This patch should work on all
platforms.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

--- package/Makefile.autotools.in.orig	2008-11-05 10:01:49.000000000
-0700
+++ package/Makefile.autotools.in	2008-11-05 10:08:25.000000000
-0700
@@ -114,8 +114,8 @@
 
 # MESSAGE Macro -- display a message in bold type
 MESSAGE = @echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION)
$(1)$(TERM_RESET)"
-TERM_BOLD = #$(shell tput bold)
-TERM_RESET = #$(shell tput rmso)
+TERM_BOLD = $(shell tput smso)
+TERM_RESET = $(shell tput rmso)
 
 # Utility programs used to build packages
 TAR ?= tar 
