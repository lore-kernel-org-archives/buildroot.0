From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 27 Feb 2017 21:56:10 +0100
Subject: [Buildroot] [PATCH] dependencies/cmake: blacklist cmake 3.7
In-Reply-To: <20170227200827.GA14356@megas.kitware.com>
References: <1488148967-8055-1-git-send-email-yann.morin.1998@free.fr>
 <1488215544.31837.9.camel@embedded.rocks> <20170227172540.GA17670@free.fr>
 <1488225846.14030.1.camel@embedded.rocks>
 <20170227200827.GA14356@megas.kitware.com>
Message-ID: <1488228970.14030.9.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ben,

On Mon, 2017-02-27 at 15:08 -0500, Ben Boeckel wrote:
> On Mon, Feb 27, 2017 at 21:04:06 +0100, J?rg Krause wrote:
> > I still think this is a bug! A host rpath should not be used when
> > cross-compiling whether lib32 is used or not. Somehow, it feels
> > weird
> > to say that Buildroot is not a Linux platform, in the sense of
> > CMake.
> 
> There's the chance that this was always a problem, but is now being
> exposed by this. Where is the lib32 rpath coming from? CMake doesn't
> add
> rpaths by default, so it has to be coming from somewhere. Is it added
> manually somewhere? Is a library that used to be found in the sysroot
> now being found on the host? If so, *that's* the bug which should be
> fixed. Given how widespread it is, maybe something is set up
> incorrectly
> in the toolchain file?
> 
> This flag is the same logic as lib64, just with a different suffix.
> Why
> is the problem not surfacing on Red Hat platforms which use lib64?

Note, that the build errors depend on the host system. I was able to
reproduce the build errors on a Debian system, whereas on a Arch, the
build does not break. However, all system are affected by having a
rpath set to a host path. It just not break the build on all host
systems. I did not investigated why...
