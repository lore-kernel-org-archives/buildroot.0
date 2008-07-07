From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 7 Jul 2008 20:41:58 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080707183248.8D9B73C3F8@busybox.net>
References: <20080707183248.8D9B73C3F8@busybox.net>
Message-ID: <20080707184158.GB17569@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 07, 2008 at 11:32:48AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2008-07-07 11:32:41 -0700 (Mon, 07 Jul 2008)
>New Revision: 22675
>
>Log:
>Fix log
>
>Modified:
>   trunk/buildroot/Makefile
>
>
>Changeset:
>Modified: trunk/buildroot/Makefile
>===================================================================
>--- trunk/buildroot/Makefile	2008-07-07 18:26:09 UTC (rev 22674)
>+++ trunk/buildroot/Makefile	2008-07-07 18:32:41 UTC (rev 22675)
>@@ -480,13 +480,15 @@
> prepatch:	gcc-patched binutils-patched gdb-patched uclibc-patched
> 
> .lognr.$(PROJECT):
>-	@echo "0" > .lognr
>+	@echo "0" > .lognr.$(PROJECT)
> 
> log:	.lognr.$(PROJECT)
>-	@expr `cat .lognr` + 1 > .lognr	
>+	@expr `cat .lognr.$(PROJECT)` + 1 > .lognr.$(PROJECT)	
> 	@echo Creating $(PROJECT)-`cat .lognr.$(PROJECT)`.log
>-	@$(MAKE) > $(PROJECT)-`cat .lognr.$(PROJECT)`.log 2>&1 
>+	@$(MAKE) testing > $(PROJECT)-`cat .lognr.$(PROJECT)`.log 2>&1 
> 
>+testing:
>+

Ulf, Please do not leak your debug stuff into the tree.
TIA
