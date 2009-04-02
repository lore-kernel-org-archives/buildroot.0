From: Darcy L. Watkins <dwatkins@tranzeo.com>
Date: Thu, 02 Apr 2009 11:01:48 -0700
Subject: [Buildroot] The make target: cross fails because
 toolchain_build_<arch>/bin/sed not found
Message-ID: <1238695308.2640.14.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In the toplevel Makefile is a target 'cross' that appears to be intended
to allow you to build the cross toolchain without building everything
else.  Unfortunately it doesn't work from a clean extract of the
tarball.

If you invoke 'make cross' an error happens because sed is missing.

The following appears to fix it... [based on the 2009.02 release]

Signed-off-by: Darcy L. Watkins <dwatkins@tranzeo.com>

--- buildroot-2009.02_powerpc/Makefile.orig	2009-02-12 00:50:20.000000000 -0800
+++ buildroot-2009.02_powerpc/Makefile	2009-04-02 10:38:03.000000000 -0700
@@ -499,7 +499,7 @@ log:	.lognr.$(PROJECT)
 	@$(MAKE) > $(PROJECT)-`cat .lognr.$(PROJECT)`.log 2>&1
 
 
-cross: $(BASE_TARGETS)
+cross: dependencies dirs target-host-info $(BASE_TARGETS)
 
 help:
 	@echo 'Cleaning:'



Regards,

Darcy
