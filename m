From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 16:41:15 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <48720878.3070602@atmel.com> (Ulf Samuelsson's message of "Mon\,
	07 Jul 2008 14\:13\:44 +0200")
References: <20080704222950.E76B63C61F@busybox.net>
	<87fxqmg53j.fsf@macbook.be.48ers.dk> <48720878.3070602@atmel.com>
Message-ID: <87iqvh4v04.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> That breaks the source-check/external-deps check in
 >> Makefile.autotools.in (r22607).
 >> 

 Ulf> Is not something like the following to be preferred?

 Ulf> Index: Makefile
 Ulf> ===================================================================
 Ulf> --- Makefile	(revision 22671)
 Ulf> +++ Makefile	(arbetskopia)
 Ulf> @@ -346,10 +346,10 @@
 Ulf>  source: $(TARGETS_SOURCE) $(HOST_SOURCE)

 Ulf>  _source-check:
 Ulf> -	$(MAKE) SPIDER=--spider source
 Ulf> +	$(MAKE) FORCE_DOWNLOAD=y SPIDER=--spider source

It would be simpler to just set the download directory to an empty dir
- But I still question the need the special purpose log and status
targets you're adding.

-- 
Bye, Peter Korsgaard
