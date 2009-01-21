From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 07:21:29 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libcgicc
In-Reply-To: <20090121002146.562C8775DB@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Wed\, 21 Jan 2009 00\:21\:46 +0000 \(UTC\)")
References: <20090121002146.562C8775DB@busybox.osuosl.org>
Message-ID: <878wp5uql2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-21 00:21:43 +0000 (Wed, 21 Jan 2009)
 ulf> New Revision: 24932

 ulf> Log:
 ulf> include string.h when building cgicc, add libcgicc-unpacked, and clean up libcgicc.mk - still does not build OK

 ulf>  $(LIBCGICC_DIR)/.configured: $(LIBCGICC_DIR)/.unpacked
 ulf>  	(cd $(LIBCGICC_DIR); rm -f config.cache; \
 ulf> @@ -40,11 +41,11 @@
 ulf>  		--mandir=/usr/man \
 ulf>  		--infodir=/usr/info \
 ulf>  	)
 ulf> -	touch $(LIBCGICC_DIR)/.configured
 ulf> +	touch $@
 
 ulf>  $(LIBCGICC_DIR)/.compiled: $(LIBCGICC_DIR)/.configured
 ulf>  	$(MAKE) -C $(LIBCGICC_DIR)
 ulf> -	touch $(LIBCGICC_DIR)/.compiled
 ulf> +	touch $@

Please just convert to Makefile.autotools.in format instead of hacking
on those old .mk's.

-- 
Bye, Peter Korsgaard
