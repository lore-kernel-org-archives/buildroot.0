From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 14:35:59 +0100
Subject: [Buildroot] [PATCH 13/15] toolchain: expose thread options in
 the Crosstool-NG backend
In-Reply-To: <201012121137.22698.yann.morin.1998@anciens.enib.fr>
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<ebd285ae70fb69572d98ea560e2180aecf57ffd7.1291541115.git.thomas.petazzoni@free-electrons.com>
	<201012121137.22698.yann.morin.1998@anciens.enib.fr>
Message-ID: <20101212143559.45cbf31b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Dec 2010 11:37:22 +0100
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> > s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_OLD).*:\# \2 is not settted:;
> 
> 'settted' ?

Leftover from a crappy debugging session. Thanks for spotting this, I
fixed it.

> > +CTNG_FIX_DOT_CONFIG_SED +=
> > s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_NEW).*:\2=y:;
> > +  endif
> > + endif
> > +else ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_NPTL)),)
> > +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NPTL).*:\2=y:;
> > +else ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_NONE)),)
> > +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NONE).*:\2=y:;
> > +endif
> > +
> >  #--------------
> >  # And the specials for paths
> >  CTNG_FIX_DOT_CONFIG_PATHS_SED +=
> > s:^(CT_PREFIX_DIR)=.*:\1="$(TOOLCHAIN_DIR)":;
> 
> I am not so sure what to say about this one...
> 
> There is already a place where we check the C library, on line 223
> (upstream) and I would say that should go there.

I am not sure how it would fit in the existing checks. Can we fix this
as a separate patchset ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
