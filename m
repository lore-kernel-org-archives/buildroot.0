From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 08 Jul 2008 07:52:31 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <878wwdvszs.fsf@macbook.be.48ers.dk>
References: <20080707232011.1D0473C608@busybox.net>
	<878wwdvszs.fsf@macbook.be.48ers.dk>
Message-ID: <4873009F.20308@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Peter Korsgaard skrev:
>>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2008-07-07 16:20:09 -0700 (Mon, 07 Jul 2008)
>  ulf> New Revision: 22676
> 
>  ulf> Log:
>  ulf> Fix log
> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/Makefile
> 
> 
>  ulf> Changeset:
>  ulf> Modified: trunk/buildroot/Makefile
>  ulf> ===================================================================
>  ulf> --- trunk/buildroot/Makefile	2008-07-07 18:32:41 UTC (rev 22675)
>  ulf> +++ trunk/buildroot/Makefile	2008-07-07 23:20:09 UTC (rev 22676)
>  ulf> @@ -485,9 +485,8 @@
>  ulf>  log:	.lognr.$(PROJECT)
>  ulf>  	@expr `cat .lognr.$(PROJECT)` + 1 > .lognr.$(PROJECT)	
>  ulf>  	@echo Creating $(PROJECT)-`cat .lognr.$(PROJECT)`.log
>  ulf> -	@$(MAKE) testing > $(PROJECT)-`cat .lognr.$(PROJECT)`.log 2>&1 
>  ulf> +	@$(MAKE) > $(PROJECT)-`cat .lognr.$(PROJECT)`.log 2>&1 
> 
> I'm still questioning how general this is. I could imagine other
> people wanting a different naming convention (E.G. perhaps something
> with the timestamp instead of just a number), and maybe store it
> together with the output files (binaries/<project>).
> 

I do not mind discussing implementation.
Personally - I think that storing with a time-stamp
in the binaries/project is OK, for a completed
build, but intermediate builds are better in the top directory,
to have easy access and indication of failure.

OpenEmbedded stores the log for each package separately
which is nice but their build system is very different.

BR
Ulf Samuelsson


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIcwCfAyRRH5cXxqwRApwmAKCU2FSezvuWlUYLYWx5QGM/1bep2QCdGq6e
QFLeqdoxHOzBgdyeZ5BJ5oA=
=0g15
-----END PGP SIGNATURE-----
