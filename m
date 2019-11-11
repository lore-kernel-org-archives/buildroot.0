From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 11 Nov 2019 15:35:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysrepo: fix host/staging
 install steps
In-Reply-To: <20191111152732.43c195c1@windsurf.home>
References: <20191103060113.4884-1-heiko.thiery@gmail.com>
 <20191108225833.6d81ea18@windsurf>
 <CAEyMn7Yg83V6bQoCG3-JH0ScRm=3qAxVLM3fKA_k1naKjFQqJw@mail.gmail.com>
 <20191111145304.00972312@windsurf.home>
 <CAEyMn7Zm+7k+Mwugu-oxRGUjfsyV3btam3DCdR+8mrenzdCzug@mail.gmail.com>
 <20191111152732.43c195c1@windsurf.home>
Message-ID: <CAEyMn7bWYSitctm2hA6h-BTByHwOuYRyEUkVK-d6a2SsmDeiQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 11. Nov. 2019 um 15:27 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> On Mon, 11 Nov 2019 15:07:31 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > > > Your defconfig shows the problem not while building rather in the install step.
> > >
> > > Hu? When I said "build", it of course means a Buildroot build, so it
> > > does both the build and installation of all packages.
> > >
> > > The autobuilder failures happens at Buildroot build time, and I was not
> > > able to reproduce it, and therefore not able to check that your patch
> > > solves it.
> >
> > Hmm, now I'm a little bit confused. Do you mean with autobuilder
> > failure the results of the buildroot CI?
> > I think this issues was already solves with the patch provided by
> > Fabrice Fontaine:
> >
> > http://lists.busybox.net/pipermail/buildroot/2019-October/265043.html
> > http://lists.busybox.net/pipermail/buildroot/2019-October/265044.html
> >
> > And currently there should'nt be any autobuilder failures!?
>
> Is your patch https://patchwork.ozlabs.org/patch/1188504/ fixing any
> autobuilder failure ? I was assuming it was there to fix the build
> issue at
> http://autobuild.buildroot.net/results/bcd/bcd9bdd3bc83c1f2ab0b24348d51de27d88649b4/build-end.log.
>
> http://lists.busybox.net/pipermail/buildroot/2019-October/265043.html
> fixes
> http://autobuild.buildroot.net/results/d80/d807f3dc922a61e099a66de3bc340c018a86e150/build-end.log,
> which is a different failure.
>
> http://lists.busybox.net/pipermail/buildroot/2019-October/265044.html
> fixes
> http://autobuild.buildroot.net/results/f0e/f0e4368977f257d76aedff335af3068deafaf28f/build-end.log
> which another different issue.
>
> > And this patch fixes some "new" issues with wrongly installed files in
> > wrong locations.
>
> Yes, which is exactly what is reported at
> http://autobuild.buildroot.net/results/bcd/bcd9bdd3bc83c1f2ab0b24348d51de27d88649b4/build-end.log,
> but I was not able to reproduce this failure with a simple configuration.
>
> Hence my question: do you have a simple configuration that reproduces
> the "wrongly installed files in wrong locations" issue ?

Ok .. I was not aware of that failure. Simple misunderstanding. I
don't have a config for that.

--
Heiko
