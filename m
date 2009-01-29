From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 18:03:00 +0100
Subject: [Buildroot] Updating toolchain config options to help external
	toolchain support.
In-Reply-To: <C13DBBE85AD6974B85C118C35890CA5F1AF39BD968@EU1RDCRDC1WX029.exi.nxp.com>
	(Daniel James Laird's message of "Wed\,
	28 Jan 2009 12\:52\:56 +0100")
References: <C13DBBE85AD6974B85C118C35890CA5F1AF39BD968@EU1RDCRDC1WX029.exi.nxp.com>
Message-ID: <87ocxqqc3f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel James Laird <daniel.j.laird@nxp.com> writes:

Hi,

 Daniel> After a lot a playing around I have made some changes to the
 Daniel> toolchain configuration options.  This now allows users of
 Daniel> external binary toolchains to enable/disable the same set of
 Daniel> features as those who are building a toolchain using
 Daniel> buildroot or external source.  However the number of changes
 Daniel> mean that I would like to post the patch below for comments
 Daniel> before commiting it.  I have tested the external toolchain
 Daniel> support side of things and checked the options are all ok but
 Daniel> I have not built a new buildroot toolchain (never done this)
 Daniel> perhaps someone can comment on patch below: If not I would
 Daniel> like to commit by friday to enable a few days testing before
 Daniel> final release.

It seems to work here - A few comments:

The reshuffle of configuration settings makes it fairly hard to find
stuff for existing users - I wonder if this is all worth it as these
things don't change very often.

 Daniel> +config BR2_ENABLE_LOCALE
 Daniel> +	bool "Toolchain built with locale/gettext/i18n support?"

The text used to be 'Enable locale/gettext/i18n support?', why the change?

 Daniel> ===================================================================
 Daniel> --- package/qte/Config.in	(revision 25087)
 Daniel> +++ package/qte/Config.in	(working copy)
 Daniel> @@ -2,7 +2,7 @@
 Daniel>  	bool "Qt/E"
 Daniel>  	depends on BR2_DEPRECATED
 Daniel>  	depends on BR2_INSTALL_LIBSTDCPP
 Daniel> -	select BR2_PTHREADS_NATIVE
 Daniel> +	depends on BR2_PTHREADS_NATIVE

This should go in a seperate commit, and have a comment entry like for
the other packages depending on toolchain config.

-- 
Bye, Peter Korsgaard
