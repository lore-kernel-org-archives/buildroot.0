From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2008 07:34:47 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080707232011.1D0473C608@busybox.net> (ulf@uclibc.org's message
	of "Mon\, 7 Jul 2008 16\:20\:10 -0700 \(PDT\)")
References: <20080707232011.1D0473C608@busybox.net>
Message-ID: <878wwdvszs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2008-07-07 16:20:09 -0700 (Mon, 07 Jul 2008)
 ulf> New Revision: 22676

 ulf> Log:
 ulf> Fix log

 ulf> Modified:
 ulf>    trunk/buildroot/Makefile


 ulf> Changeset:
 ulf> Modified: trunk/buildroot/Makefile
 ulf> ===================================================================
 ulf> --- trunk/buildroot/Makefile	2008-07-07 18:32:41 UTC (rev 22675)
 ulf> +++ trunk/buildroot/Makefile	2008-07-07 23:20:09 UTC (rev 22676)
 ulf> @@ -485,9 +485,8 @@
 ulf>  log:	.lognr.$(PROJECT)
 ulf>  	@expr `cat .lognr.$(PROJECT)` + 1 > .lognr.$(PROJECT)	
 ulf>  	@echo Creating $(PROJECT)-`cat .lognr.$(PROJECT)`.log
 ulf> -	@$(MAKE) testing > $(PROJECT)-`cat .lognr.$(PROJECT)`.log 2>&1 
 ulf> +	@$(MAKE) > $(PROJECT)-`cat .lognr.$(PROJECT)`.log 2>&1 

I'm still questioning how general this is. I could imagine other
people wanting a different naming convention (E.G. perhaps something
with the timestamp instead of just a number), and maybe store it
together with the output files (binaries/<project>).

-- 
Bye, Peter Korsgaard
