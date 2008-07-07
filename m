From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 7 Jul 2008 19:30:58 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
References: <20080704222950.E76B63C61F@busybox.net><87fxqmg53j.fsf@macbook.be.48ers.dk>
	<48720878.3070602@atmel.com> <87iqvh4v04.fsf@macbook.be.48ers.dk>
Message-ID: <402994CA99E94279B9CF869B4BB3942B@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
> >> That breaks the source-check/external-deps check in
> >> Makefile.autotools.in (r22607).
> >> 
> 
> Ulf> Is not something like the following to be preferred?
> 
> Ulf> Index: Makefile
> Ulf> ===================================================================
> Ulf> --- Makefile (revision 22671)
> Ulf> +++ Makefile (arbetskopia)
> Ulf> @@ -346,10 +346,10 @@
> Ulf>  source: $(TARGETS_SOURCE) $(HOST_SOURCE)
> 
> Ulf>  _source-check:
> Ulf> - $(MAKE) SPIDER=--spider source
> Ulf> + $(MAKE) FORCE_DOWNLOAD=y SPIDER=--spider source
> 
> It would be simpler to just set the download directory to an empty dir
> - But I still question the need the special purpose log and status
> targets you're adding.
> 

I actually do not even need buildroot at all, because everything
buildroot does, I can do manually.
It is just more convenient and less error prone to automate common tasks.

Best Regards
Ulf Samuelsson

 
