From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 6 Jul 2016 19:25:03 +0000
Subject: [Buildroot] Interesting circular dependency, how to solve?
In-Reply-To: <20160706202005.6e2ac6c3@free-electrons.com>
References: <20160706175617.67b0e1ea@free-electrons.com>
 <F9C551623D2CBB4C9488801D14F864C6EE83C112@ex-mb1.corp.adtran.com>
 <20160706202005.6e2ac6c3@free-electrons.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C6EE83C19D@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Wednesday, July 06, 2016 1:20 PM
> To: ANDY KENNEDY
> Cc: buildroot at uclibc.org; paul.ashford at zurria.co.uk
> Subject: Re: [Buildroot] Interesting circular dependency, how to solve?
> 
> Hello,
> 
> On Wed, 6 Jul 2016 17:54:01 +0000, ANDY KENNEDY wrote:
> 
> > >  - When cryptodev-linux is enabled, OpenSSL will depend on it to use
> > >    crypto accelerators supported in the kernel via cryptodev-linux.
> >
> > If I understand you correctly, this builds TWO things, right?
> >
> > If this is the case, make it separate packages to build the
> > kernel module then the userspace package.
> 
> It builds a kernel module, so it has to depend on "linux", and it
> installs cryptodev.h, which OpenSSL needs. I am not sure splitting this
> package into two is really a good idea, though it would indeed solve
> the problem: all what OpenSSL needs at build time is the cryptodev.h
> header file. The kernel module can be built separately, and is only at
> runtime.
> 
> So, yes, one possibility is to break cryptodev-linux into two packages.

You _could_ do it via a hidden option that is selected by the other
option.  Then, it is still "one" package, however, the make
dependency tree would see it as two.

Andy
