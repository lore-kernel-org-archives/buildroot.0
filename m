From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 17 Aug 2016 15:33:30 +0000
Subject: [Buildroot] BuildRoot cannot build powerpc64
In-Reply-To: <57b3aeb6944cf_7ec33f915a8b1b9c298e6@ultri3.mail>
References: <F9C551623D2CBB4C9488801D14F864C6EE8B1000@ex-mb1.corp.adtran.com>
 <57b3aeb6944cf_7ec33f915a8b1b9c298e6@ultri3.mail>
Message-ID: <F9C551623D2CBB4C9488801D14F864C6EE8B17ED@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the info Ricardo!

> 
> Hi Andy,
> 
> On Tue, Aug 16, 2016 at 07:43 PM, ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wrote:
> 
> > All,
> >
> > I just downloaded 2016_08rc-1 and attempted to build an RFS for the
> > T-series PowerPC parts, which, I assume, are powerpc64 and e5500.  In
> > doing so, after I select powerpc64 I cannot select any library for the
> > toolchain as all of the config dependencies appear to be excluding
> > powerpc64 in the options.
> >
> > Is this by design or oversight?
> 
> With Ubuntu 16.04 I can reproduce the behavior only after selecting static libs.
> 
> BR2_powerpc64=y
> BR2_powerpc_e5500=y
> BR2_STATIC_LIBS=y
> 
> Maybe you can unblock your work if static build is not a strict requirement.

Our RFS we like to have static, so that we can throw libs into
the system @ runtime without breaking our stable RFS.

Based upon your e-mail, I dropped into the uclibc dependencies
|| BR2_powerpc64, which made it selectable.  Problem is that
it wouldn?t build.  My guess is that the T-series parts haven't
been added to uClibC-ng yet, which is why it isn't selectable.

Thus, the answer to my question is "it is by design".

Thanks for the help, though!

Andy
