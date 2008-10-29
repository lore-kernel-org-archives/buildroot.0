From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Oct 2008 14:53:29 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
In-Reply-To: <20081029124939.6BC543C368@busybox.net> (laird@uclibc.org's
	message of "Wed\, 29 Oct 2008 05\:49\:39 -0700 \(PDT\)")
References: <20081029124939.6BC543C368@busybox.net>
Message-ID: <87skqf7bja.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "laird" == laird  <laird@uclibc.org> writes:

 laird> Author: laird
 laird> Date: 2008-10-29 05:49:38 -0700 (Wed, 29 Oct 2008)
 laird> New Revision: 23851

 laird> Log:
 laird> package/libpng/libpng.mk: Change to autotools.in format

 laird> Move libpng into the new era.....

Cool.

 laird> +LIBPNG_CONF_ENV = \
 laird>  		ac_cv_have_decl_malloc=yes \
 laird>  		gl_cv_func_malloc_0_nonnull=yes \
 laird>  		ac_cv_func_malloc_0_nonnull=yes \
 laird>  		ac_cv_func_calloc_0_nonnull=yes \
 laird> -		ac_cv_func_realloc_0_nonnull=yes \

We have a BR2_AC_CV_FUNC_MALLOC_0_NONNULL for this (it seems to be
missing calloc though).

 laird> +LIBPNG_CONF_OPT = \
 laird>  		--without-libpng-compat \
 laird> -		--without-x \
 laird> -	)
 laird> -	touch $@
 laird> +		--without-x

Does libpng configure really have a --without-x option? I'm pretty
sure it doesn't.

-- 
Bye, Peter Korsgaard
