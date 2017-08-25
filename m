From: Aseem Sharma <aseem.sharma19@gmail.com>
Date: Fri, 25 Aug 2017 12:20:06 +0530
Subject: [Buildroot] Need help with "CONFIG_CMDLINE" or setting up
	serial console.
In-Reply-To: <20170824192406.785ce955@windsurf>
References: <CANK3ZEcnN1bK_LkiN-WGBcOqeRJhyPWwFjdDvAUQMefRp5QDew@mail.gmail.com>
 <CANK3ZEeshYV1gRVEdJwFv-qJ7FW3bBS3p0Uv64EGgtiqBu=+DQ@mail.gmail.com>
 <CANK3ZEcxuKgGCJeMxPQG6DytubWuojBieb+ApJiaW3rOrMbWzw@mail.gmail.com>
 <CANK3ZEfboeXLiyTZs0nR_CnmOp_VOsKdZxfo_0ocUbumEr_kkA@mail.gmail.com>
 <CANK3ZEdDRfwMSXKHHxKSHbzzxzfr1Z4dgL8eTKZSYHdKgGdjCA@mail.gmail.com>
 <CANK3ZEcNN4dS1mhsWCPQmc1RaUrVacErJ0eeVG_rEYcoMWER+g@mail.gmail.com>
 <CANK3ZEe8-g11nW4xsjnO8f1YX7sxOaEiVrvcTNdg3uCudgOQbw@mail.gmail.com>
 <CANK3ZEfgerodJDfKZr0QOfo1SuSeMFGR+fqthi=u4urN-T7sPQ@mail.gmail.com>
 <CANK3ZEeRTwNokPC8WS1VXiViQqmt6=Dpo3f_-_metsKQM3AjFg@mail.gmail.com>
 <CANK3ZEdib88=wt7YLnhBj2XwNJA8E3eZdecN3F_SgCO8Tbv=xw@mail.gmail.com>
 <20170824192406.785ce955@windsurf>
Message-ID: <CANK3ZEfu78kXsFBGJajJhiR2D1Fk3zT1CH+utDTgMsxweU9dog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas for your inputs and time.

Best Regards,
Aseem

On Thu, Aug 24, 2017 at 10:54 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Thu, 24 Aug 2017 07:13:55 +0530, Aseem Sharma wrote:
>
> > I have created rootfs and zImage for "arm926t" using the long term
> support
> > release of buildroot. However I am having trouble knowing if it is
> working
> > as I do not see any messages on the screen.
> >
> > How do I setup serial console on my device? I am not able to find the
> usual
> > "CONFIG_CMDLINE" option in menuconfig to be able to set kernel command
> line.
>
> CONFIG_CMDLINE is a Linux kernel option, not a Buildroot option.
>
> In Buildroot, "make menuconfig" shows you the Buildroot options (which
> architecture to use, which packages to build, which filesystem image to
> generate, which kernel version and configuration to use, etc.)
>
> If you want to access the Linux kernel configuration in the context of
> Buildroot, you need to do "make linux-menuconfig". This is all
> explained in the Buildroot manual, so please have a look at it.
>
> However, using CONFIG_CMDLINE is by far not the easiest way of changing
> the kernel command line. Instead, if you're using a decent bootloader,
> it for sure provides a way to specify the kernel command line. Under
> U-Boot for example, the bootargs variable is used for the kernel
> command line value.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170825/b63cb6cb/attachment.html>
