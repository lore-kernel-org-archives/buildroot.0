From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 9 Oct 2019 19:16:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/brltty: fix build with expat
In-Reply-To: <20191005223747.4cdc2ee9@windsurf>
References: <20190929084004.21350-1-fontaine.fabrice@gmail.com>
 <20190930234632.697b127d@windsurf.home>
 <CAPi7W81GM5+T7iaqAFajZzjn_NWVLQfi=z8vGxpGAU67KX7M4w@mail.gmail.com>
 <20191005223747.4cdc2ee9@windsurf>
Message-ID: <CAPi7W83QDivBVTL6O+ZQ_i6DmL+wz+i_sbQEMAySRsp-bNEG2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le sam. 5 oct. 2019 ? 22:37, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Tue, 1 Oct 2019 08:42:24 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > > Maybe it's because it's late and I'm no longer thinking properly, but
> > > do you understand how disabling expat prevents the cldr program from
> > > being built, and therefore the tbl2hex utility tool from being built ?
> > > They seem to be unconditionally built by Programs/Makefile.in.
> > cldr.c is mostly an empty shell without expat as most of the code is
> > protected by ifdef HAVE_EXPAT blocks, see
> > https://github.com/brltty/brltty/blob/aba3d8cc2dc765a0933aabb609928e568e085d39/Programs/cldr.c.
>
> OK, but where is the logic that links with -lexpat when it's available,
> and doesn't link with -lexpat when not available ? I'm a bit confused
> by the build logic of this package I must say.
Linking with expat is done through EXPAT_LIBS in Programs/Makefile.in.
EXPAT_LIBS is set to @expat_libs@ in config.mk.in.
expat_libs is set in configure.ac depending on BRLTTY_HAVE_PACKAGE
result (which is basically a pkg-config wrapper defined in
m4/brltty.m4).
The main issue with this package is that it assumes that if expat is
available on target then it is also available on host.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
