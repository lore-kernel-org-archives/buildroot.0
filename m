From: Cjw X <cjwfirmware@vxmdesign.com>
Date: Fri, 16 Jan 2015 21:06:09 -0500
Subject: [Buildroot] support for cortex m3/m4 with newlib
In-Reply-To: <20150116092226.0f2859dd@free-electrons.com>
References: <CAOudHSX=sc7hwE0PObED1jtDp7pOs-=PPVG_Rsh6+di9iYWojA@mail.gmail.com>
 <20150116092226.0f2859dd@free-electrons.com>
Message-ID: <CAOudHSVRRGNt3nSe9nXN64f+ShWyMxmcFNvp5JDPOBsM36RNTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 16, 2015 at 3:22 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Thu, 15 Jan 2015 17:57:32 -0500, Cjw X wrote:
>
> > I've been working on modifying buildroot to support cortex m3/m4
> processors
> > against the newlib library.
> >
> > This way I can use buildroot to build RTOS's for those processors. I've
> > been using buildroot for years to build linux systems and I would like to
> > expand that for the smaller processors with different operating systems.
> >
> > I am making some progress. The toolchain already works. I'm now starting
> to
> > go down the road of supporting RTOS's.
> >
> > I'm going to keep going regardless, but I wanted to check to find out if
> > this interests the community.
> >
> > Does this interest people?
>
> Support for Cortex-M3/M4 based platforms is definitely interesting.
> However, I'm wondering if it really makes sense for Buildroot to
> support non-Linux operating systems. To me, the main value of Buildroot
> is the 1200+ packages that we have, and all of them are based on the
> fact that you run a Linux kernel underneath.
>
>
I've been using buildroot for years, and it is my distro I prefer to use if
I have an option. I really like the package support, but that has never
been my reason for choosing it. If I want massive package support, Debian
has good arm support, and Yocto/OpenEmbedded has thousands of packages.

I go to buildroot because it is the best most reliable and consistent way
to get a toolchain/os/and host support working for a piece of hardware. It
is extremely easy to modify and maintain and source control. Buildroot is
built on standard tools with no weird dependencies so it works on every
linux distro without much hassle. I can easily maintain several different
toolchains for different hardware on the same system. And while the
packages natively supported is good, it is basically trivial to add any new
package to it.

This is why I use it, why I encourage my clients to use it, and why I would
like to see it extended to other small-os targets on the lower-end
processors.



> What would Buildroot do for a newlib based system, except building the
> toolchain? If it's really only about building the toolchain, then maybe
> using Crosstool-NG is a better idea, since it already has newlib
> support if I remember correctly.
>
> I was never huge fan of crosstool-ng. I could always get it to work, but
it was never as reliable at providing a tool chain/os/ and host support for
my target as buildroot has been.

That is how I tend to feel about it. The community may feel differently.

-Chris

-"It's not programming if you don't need a multimeter"



> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150116/3ffc3345/attachment.html>
