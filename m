From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Mon, 08 Dec 2014 22:17:03 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: fix check-musl
In-Reply-To: <20141208203200.4ca75210@free-electrons.com>
References: <1417648439-10146-1-git-send-email-jkrause@posteo.de>
 <20141208203200.4ca75210@free-electrons.com>
Message-ID: <1418073423.2353.13.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mo, 2014-12-08 at 20:32 +0100, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Thu,  4 Dec 2014 00:13:59 +0100, J?rg Krause wrote:
> > check_musl works fine for the external musl 1.1.1 toolchain which is downloaded
> > and installed, but fails for a musl toolchain which, in a first step is build
> > by the internal toolchain backend of Buildroot, and in a second step is copied
> > to an external directory and imported as an custom external toolchain (in a new
> > configuration).
> > 
> > In case of the downloaded musl 1.1.1 toolchain the libc.so and libm.a files
> > reside in the sysroot/lib directory and sysroot/usr/lib is a symlink to
> > sysroot/lib.
> > 
> > In case of the custom musl toolchain build by Buildroot the files reside in
> > sysroot/usr/lib which is not a symlink.
> 
> Actually, I am not sure this is the best fix we could do. Having the C
> library installed in /usr/lib in the sysroot is a bit weird, and I
> believe we should rather fix the Buildroot musl package to ensure that
> the C library gets installed in /lib instead.
> 
> Do you want to have a look into this?

I'm not a toolchain expert, but I will have a look at it.
