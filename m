From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 May 2013 09:15:25 +0200
Subject: [Buildroot] [PATCH v8 7/7] package: Introduce NOMMU symbol
In-Reply-To: <CAJxxZ0NJSpGMN+38KoHinvhNEsC4X1qXOSyqbuLv-Yps20mN0g@mail.gmail.com>
References: <1367825740-9408-1-git-send-email-sonic.adi@gmail.com>
 <1367825740-9408-2-git-send-email-sonic.adi@gmail.com>
 <CAJxxZ0NJSpGMN+38KoHinvhNEsC4X1qXOSyqbuLv-Yps20mN0g@mail.gmail.com>
Message-ID: <20130514091525.19e4e820@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Tue, 14 May 2013 14:23:11 +0800, Sonic Zhang wrote:

> > diff --git a/package/Makefile.in b/package/Makefile.in
> > index a449089..55d725d 100644
> > --- a/package/Makefile.in
> > +++ b/package/Makefile.in
> > @@ -107,6 +107,10 @@ ifeq ($(BR2_BINFMT_FLAT),y)
> >  TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))
> >  endif
> >
> > +ifneq ($(BR2_USE_MMU),y)
> > +TARGET_CFLAGS += -D__NOMMU__
> > +endif
> > +
> >  ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
> >  TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
> >  TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
> > --
> 
> May I have your Acked-by for the last 2 bfin arch support patches?

For the 2013.05 cycle, it is now too late to get functional patches in,
Peter is now only taking fixes. Though we can continue the work and get
them merged in -next.

Regarding this patch specifically (PATCH 7/7), I have never been happy
with it, because I don't like the idea of passing globally this
-D__NOMMU__ symbol all around, while it's not a standard symbol.

I've asked Peter, and he agrees with this position. Therefore, what we
would like to see is -D__NOMMU__ added only to those packages that
actually need it.

Regarding PATCH 6/7, since the 2013.05 cycle is over for new patches, I
was hoping to find some time to look and it and refactor it. But I
believe I'll just test it once again, give my Acked-by: so it gets
merged, and then later on find the time to refactor it.

Would this be ok for you?

Also, while we're at it, I've just launched a new version of our
autobuilders infrastructure (see
http://lists.busybox.net/pipermail/buildroot/2013-May/072143.html).
Would you be interested in receiving a daily e-mail that contains only
the list of Blackfin related build failures?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
