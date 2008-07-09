From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jul 2008 09:14:03 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  gperf
In-Reply-To: <20080709042746.AE27F3C6A2@busybox.net> (ulf@uclibc.org's message
	of "Tue\, 8 Jul 2008 21\:27\:46 -0700 \(PDT\)")
References: <20080709042746.AE27F3C6A2@busybox.net>
Message-ID: <87prpn5y2s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2008-07-08 21:27:45 -0700 (Tue, 08 Jul 2008)
 ulf> New Revision: 22696

 ulf> Log:
 ulf> Add gperf, perfect hash generator

What is it useful for? Does any other packages need it?

 ulf> Added:
 ulf>    trunk/buildroot/package/gperf/
 ulf>    trunk/buildroot/package/gperf/Config.in
 ulf>    trunk/buildroot/package/gperf/gperf.mk

 ulf> Modified:
 ulf>    trunk/buildroot/package/Config.in


 ulf> Changeset:
 ulf> Modified: trunk/buildroot/package/Config.in
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/Config.in	2008-07-08 20:41:57 UTC (rev 22695)
 ulf> +++ trunk/buildroot/package/Config.in	2008-07-09 04:27:45 UTC (rev 22696)
 ulf> @@ -71,6 +71,7 @@
 ulf>  source "package/dash/Config.in"
 ulf>  source "package/file/Config.in"
 ulf>  source "package/gamin/Config.in"
 ulf> +source "package/gperf/Config.in"

Doesn't it belong under development stuff?

 ulf>  source "package/icu/Config.in"
 ulf>  source "package/ipkg/Config.in"
 ulf>  source "package/kexec/Config.in"

 ulf> Added: trunk/buildroot/package/gperf/Config.in
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/gperf/Config.in	                        (rev 0)
 ulf> +++ trunk/buildroot/package/gperf/Config.in	2008-07-09 04:27:45 UTC (rev 22696)
 ulf> @@ -0,0 +1,7 @@
 ulf> +config BR2_PACKAGE_GPERF
 ulf> +	bool "gperf"
 ulf> +	default n
 ulf> +	help
 ulf> +	  A 'perfect hash function' generator
 ulf> +
 ulf> +	  $(BR2_GNU_MIRROR)

http://www.gnu.org/software/gperf/ would be better.

 ulf> Added: trunk/buildroot/package/gperf/gperf.mk
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/gperf/gperf.mk	                        (rev 0)
 ulf> +++ trunk/buildroot/package/gperf/gperf.mk	2008-07-09 04:27:45 UTC (rev 22696)
 ulf> @@ -0,0 +1,22 @@
 ulf> +#############################################################
 ulf> +#
 ulf> +# gperf
 ulf> +#
 ulf> +#############################################################
 ulf> +GPERF_VERSION = 3.0.3
 ulf> +GPERF_SOURCE = gperf-$(GPERF_VERSION).tar.gz
 ulf> +GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 ulf> +GPERF_AUTORECONF = NO
 ulf> +GPERF_INSTALL_STAGING = YES
 ulf> +GPERF_INSTALL_TARGET = YES

Why install the cross binary under staging?

 ulf> +GPERF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install 
 ulf> +GPERF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install 

Trailing spaces.

You're not stripping the binary in TARGET_DIR.

 ulf> +
 ulf> +GPERF_CONF_ENV = 
 ulf> +
 ulf> +GPERF_CONF_OPT = 
 ulf> +
 ulf> +GPERF_DEPENDENCIES = uclibc
 ulf> +
 ulf> +$(eval $(call AUTOTARGETS,package,gperf))
 ulf> +

-- 
Bye, Peter Korsgaard
