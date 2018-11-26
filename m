From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Nov 2018 21:20:42 +0100
Subject: [Buildroot] [PATCH] docs/manual: standardize a bit more the
 formatting of commit titles
In-Reply-To: <20181125210940.2d18852f@windsurf>
References: <20181124101903.18138-1-thomas.petazzoni@bootlin.com>
 <20181125161722.GC28830@scaer> <20181125210940.2d18852f@windsurf>
Message-ID: <20181126202042.GM28830@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-25 21:09 +0100, Thomas Petazzoni spake thusly:
> On Sun, 25 Nov 2018 17:17:22 +0100, Yann E. MORIN wrote:
> > When I add 'package/' as a prefix, it is not because it is in the
> > package subdirectory, but because it is touching a package, as opposed
> > to something else, like core stuff or package infrastructures.
> > 
> > The prefix is a 'semantic' prefix, not a path prefix. A path prefix
> > serves no purpose in and of itself.
> 
> I don't quite agree. If we really want to use 'semantic' prefix, then
> we should do:
> 
> 	package: foo: bump version to ...
> 
> Using 'package/foo' really looks way too much like a path, and
> therefore...
> 
> > There, I would have sued 'infra/' as a prefix, because it is touching
> > the pkg0generic infrastructure, not a package.
> 
> this doesn't make much sense to me, because there is nothing named
> infra/pkg-generic in the tree. "infra: pkg-generic: " would be OK,

I'd be OK to use your proposal using the 'prefix: name: what" (even
though I find it ugly, but that's probably because I haven't been
totally tainted by the kernel yet ;-) )

So, for example:

    package: busybox: bump version to 1.29.3
    package: xdriver_xf86-video-siliconmotion: bump version to 1.7.9
    package: uboot: switch to kconfig by default
    infra: pkg-generic: fix show-build-order stdout pollution
    core: legal: add package dependencies with licenses to the manifest
    fs: common: drop intermediate tarball
    fs: ext2: add option for lz4 compression
    testing: add test for the f2fs filesystem support
    [...]
    arch: arm: add FPv5 support for cortex-m7
    docs: manual: add external.desc to list of files needed for BR2_EXTERNAL
    docs: website: update for 2018.11-rc1
    misc: anything else goes here

> but
> we have never really used such 'semantic' naming so far.

Actually, that is exactly what I've been doing all those years.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
