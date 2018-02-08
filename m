From: daggs <daggs@gmx.com>
Date: Thu, 8 Feb 2018 12:36:52 +0100
Subject: [Buildroot] aarch64 + armhf multiarch support?
In-Reply-To: <E10BD61C-1C84-4039-A741-331FC3C8B961@jens-maus.de>
References: <8EB2320D-F586-45FA-A9F4-F49D7FD5DD5D@jens-maus.de>
 <trinity-566065ed-72d1-4d19-9ae3-ab3368c01d3a-1518087937117@3c-app-mailcom-bs16>
 <E10BD61C-1C84-4039-A741-331FC3C8B961@jens-maus.de>
Message-ID: <trinity-ad8db11c-f541-454e-8440-6c47520cc02f-1518089812434@3c-app-mailcom-bs15>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Jens,

>
> Hi Dagg,
> 
> > Am 08.02.2018 um 12:05 schrieb daggs <daggs@gmx.com>:
> > 
> > Greetings Jens,
> > 
> >> 
> >> Hi,
> >> 
> >> I am maintaining a buildroot environment for several ARM embedded boards. They are currently exclusively pure ?armhf? platforms. However, I am currently evaluating to support also the ODROIDC2 which has a 64bit ARM processor (ARMv8) and the buildroot images are thus generated for the aarch64 platform. The problem I am currently facing is that I have several dependencies in my buildroot environment which requires that armhf binaries have to also work properly without any possibilities to recompile them for aarch64. I was therefore looking at possibilities in buildroot to enable multiarch support like other environments (e.g. Debian) support. However, I wasn?t successful in finding any possibilities in specifying that in addition to primarily setup buildroot for aarch64 I can also run armhf binaries out-of-the-box. Already when running through all packages (including my own external package) buildroot recognizes that there are binaries not being compiled for the aarch64 platform and thus cancels the build.
> >> 
> >> So is there any possibility to configure buildroot as a multiarch environment where the build process then automatically creates all necessary armhf dependencies (e.g. libc) for the armhf platform and install it properly so that armhf binaries run out-of-the-box on a aarch64 buildroot build?
> > 
> > what are you needs from the env? will headless buildroot works for you?
> 
> at least I don?t need X11 or any GPU stuff, but a pure console would be great (for debugging reasons). And if this is also not possible a complete headless buildroot would also be ok.
> 
> regards,
> jens
> -- 
> Jens Maus, Dresden/Germany
> http://jens-maus.de/

ok, currently in buildroot there is no possibility to build a odroid c2 based 32 big image because the vendor didn't implemented some of the opcode in u-boot.
however, I've posted a bunch of patches 2 months ago which introduce mainline kernel (4.14.x) and mainline uboot (2017.07) support for this board.
you might be able to build a 32 bit image using these patches.

imho it worth looking into it.

Dagg.
