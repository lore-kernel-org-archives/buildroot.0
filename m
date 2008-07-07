From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 7 Jul 2008 20:05:25 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080707174828.59C853C2C9@busybox.net>
References: <20080707174828.59C853C2C9@busybox.net>
Message-ID: <20080707180525.GA17569@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 07, 2008 at 10:48:28AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2008-07-07 10:48:27 -0700 (Mon, 07 Jul 2008)
>New Revision: 22673
>
>Log:
>Remove some debug messages
>
>Modified:
>   trunk/buildroot/Makefile
>
>
>Changeset:
>Modified: trunk/buildroot/Makefile
>===================================================================
>--- trunk/buildroot/Makefile	2008-07-07 12:04:19 UTC (rev 22672)
>+++ trunk/buildroot/Makefile	2008-07-07 17:48:27 UTC (rev 22673)
>@@ -460,7 +460,7 @@
> #
> #############################################################
> clean:
>-	rm -f .config .config.old .config.cmd .tmpconfig.h
>+	rm -f .config .config.old .config.cmd .tmpconfig.h .lognr.*
> 	-$(MAKE) -C $(CONFIG) clean
> 
> distclean: clean
>@@ -479,18 +479,14 @@
> 
> prepatch:	gcc-patched binutils-patched gdb-patched uclibc-patched
> 
>-.lognr:
>+.lognr.$(PROJECT):
> 	@echo "0" > .lognr
> 
>-log:	.lognr
>+log:	.lognr.$(PROJECT)
> 	@expr `cat .lognr` + 1 > .lognr	

Ulf, please, if you really insist on adding such crap, then at least
make it right.

Thank you.
>-	@echo Creating $(PROJECT)-`cat .lognr`.log
>-	@$(MAKE) > $(PROJECT)-`cat .lognr`.log 2>&1 
>+	@echo Creating $(PROJECT)-`cat .lognr.$(PROJECT)`.log
>+	@$(MAKE) > $(PROJECT)-`cat .lognr.$(PROJECT)`.log 2>&1 
