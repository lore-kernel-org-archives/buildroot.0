From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Nov 2019 22:25:06 +0100
Subject: [Buildroot] [PATCH] toolchain/helpers: make sure we bail out
 when kernel headers check fails
In-Reply-To: <CAJ4jsaeAhEVJY9pCR3-vhmhpuAndc3F1Y3GVjrM-KXbEJv34KQ@mail.gmail.com>
References: <20191112202118.56136-1-thomas.petazzoni@bootlin.com>
 <CAJ4jsaeAhEVJY9pCR3-vhmhpuAndc3F1Y3GVjrM-KXbEJv34KQ@mail.gmail.com>
Message-ID: <20191112222506.7630c00f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Nov 2019 18:21:15 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> > diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> > index 42e5522060..996cc70d44 100644
> > --- a/toolchain/helpers.mk
> > +++ b/toolchain/helpers.mk
> > @@ -163,7 +163,9 @@ copy_toolchain_sysroot = \
> >  # $3: kernel version string, in the form: X.Y
> >  #
> >  check_kernel_headers_version = \
> > -       support/scripts/check-kernel-headers.sh $(1) $(2) $(3)
> > +       if ! support/scripts/check-kernel-headers.sh $(1) $(2) $(3); then \
> > +               exit 1; \
> > +       fi
> >
> >  #
> >  # Check the specific gcc version actually matches the version in the
> > --
> > 2.23.0
> >  
> 
> The function became a one-liner after commit 6136765b23. Wouldn't it
> be simpler and more readable to run the script and test the result,
> both in linux-headers.mk and pkg-toolchain-external.mk?

Yes, we could certainly do that. The aim of my patch was really just to
get back to where we were before, to fix the immediate issue. This of
course doesn't mean we can't improve things further.

I'll let Peter/Arnout/Yann decide what they want to do (i.e apply my
patch as-is, or have a more elaborate version).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
