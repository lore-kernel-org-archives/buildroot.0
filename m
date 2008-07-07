From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 08:36:45 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <48714AA0.8000809@atmel.com> (Ulf Samuelsson's message of "Mon\,
	07 Jul 2008 00\:43\:44 +0200")
References: <20080705092238.AB5163C65B@busybox.net>
	<87bq1ag4zs.fsf@macbook.be.48ers.dk> <48714AA0.8000809@atmel.com>
Message-ID: <871w26dwua.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Please keep communication on the list.

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 ulf> config BR2_STAGING_DIR
 >> 
 ulf> Modified: trunk/buildroot/Makefile
 ulf> ===================================================================
 ulf> --- trunk/buildroot/Makefile	2008-07-05 09:18:54 UTC (rev 22651)
 ulf> +++ trunk/buildroot/Makefile	2008-07-05 09:22:38 UTC (rev 22652)
 ulf> @@ -36,7 +36,7 @@
 ulf> ifneq ($(BUILDROOT_LOCAL),)
 ulf> BR2_LOCAL:=$(BUILDROOT_LOCAL)
 ulf> else
 ulf> -BR2_LOCAL:=$(TOPDIR)/local
 ulf> +BR2_LOCAL:=$(TOPDIR)local
 ulf> endif
 >> 
 >> Why?

 Ulf> Topdir seems to have a slash already
 Ulf> so this changes BR2_LOCAL from ".//local" to "./local"

And, is that a problem? This will break if someone forgets the
trailing slash. Double slashes are normally fine.

 ulf> +
 ulf> +status:
 ulf> +	@echo LOCAL=$(LOCAL)
 ulf> +	@echo BR2_DL_DIR=$(BR2_DL_DIR)
 ulf> +	@echo HOST_GLIB=$(HOST_GLIB)
 >> 
 >> And why?

 Ulf> Just some debugging help

Does it need to be checked in?

-- 
Bye, Peter Korsgaard
