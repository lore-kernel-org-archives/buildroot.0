From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Oct 2008 16:58:43 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
In-Reply-To: <C13DBBE85AD6974B85C118C35890CA5F13B20D9A20@EU1RDCRDC1WX029.exi.nxp.com>
	(Daniel J. Laird's message of "Wed\,
	29 Oct 2008 16\:33\:18 +0100")
References: <20081029124939.6BC543C368@busybox.net>
	<87skqf7bja.fsf@macbook.be.48ers.dk>
	<C13DBBE85AD6974B85C118C35890CA5F13B20D9A20@EU1RDCRDC1WX029.exi.nxp.com>
Message-ID: <87ljw71jgs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel J Laird <daniel.j.laird@nxp.com> writes:

 Daniel> The BR2_AC_CV_FUNC_MALLOC_0_NONNULL value seems to depend up a value called MALLOC_GLIBC_COMPAT.  This is only set in the uClibC config files.  This means GLIBC based external toolchains cant use this BR2_AC_CV_FUNC_MALLOC_0_NONNULL if they want it set to yes like libpng does.  
 Daniel> 1. We could add the calloc stuff
 Daniel> 2. We could have
 Daniel> ac_cv_have_decl_malloc=yes \
 Daniel> gl_cv_func_malloc_0_nonnull=yes \
 Daniel> ac_cv_func_malloc_0_nonnull=yes \
 Daniel> ac_cv_func_calloc_0_nonnull=yes \
 Daniel> ac_cv_func_realloc_0_nonnull=yes

 Daniel> When using an external toolchain as well

Or provide an option to let the user set it to whatever their
toolchain does. I'm not familiar with the external toolchain stuff,
how's the other toolchain settins handled (largefile, locales, wchar,
..)?

-- 
Bye, Peter Korsgaard
