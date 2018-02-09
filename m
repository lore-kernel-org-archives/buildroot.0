From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 9 Feb 2018 09:49:06 +0100
Subject: [Buildroot] [PATCH v10 01/10] rustc: new virtual package
In-Reply-To: <20180208235221.1227a749@windsurf.lan>
References: <20180204180749.29942-1-eric.le.bihan.dev@free.fr>
 <20180204180749.29942-2-eric.le.bihan.dev@free.fr>
 <20180208235221.1227a749@windsurf.lan>
Message-ID: <20180209084906.GB6503@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-02-08 23:52, Thomas Petazzoni wrote:
> Hello,
>
> +Peter, Arnout, Ricardo in Cc.
>
> On Sun,  4 Feb 2018 19:07:40 +0100, Eric Le Bihan wrote:
>
> > diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
> > new file mode 100644
> > index 0000000000..7a951c0cfd
> > --- /dev/null
> > +++ b/package/rustc/rustc.mk
> > @@ -0,0 +1,20 @@
> > +################################################################################
> > +#
> > +# rustc
> > +#
> > +################################################################################
> > +
> > +RUSTC_ARCH = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ARCH))
> > +RUSTC_ABI = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ABI))
> > +
> > +RUST_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
> > +
> > +ifeq ($(HOSTARCH),x86)
> > +RUSTC_HOST_ARCH = i686
> > +else
> > +RUSTC_HOST_ARCH = $(HOSTARCH)
> > +endif
> > +
> > +RUST_HOST_NAME = $(RUSTC_HOST_ARCH)-unknown-linux-gnu
>
> check-package is not happy with RUST_TARGET_NAME and RUST_HOST_NAME
> because they don't have a RUSTC_ prefix, even though they are defined
> in rustc.mk:
>
> ./package/rustc/rustc.mk:10: possible typo: RUST_TARGET_NAME -> *RUSTC*
> ./package/rustc/rustc.mk:18: possible typo: RUST_HOST_NAME -> *RUSTC*
>
> Would renaming them to RUSTC_TARGET_NAME and RUSTC_HOST_NAME make
> sense ? Or do we need to keep RUST_TARGET_NAME/RUST_HOST_NAME and add
> an exception in check-package ?

I do not see any problems using RUSTC_{HOST,TARGET}_NAME: it still caries
the same information as RUST_{HOST,TARGET}_NAME.

Regards,

--
ELB
