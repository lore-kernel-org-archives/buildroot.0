From: Jason Kridner <jkridner@beagleboard.org>
Date: Thu, 26 Sep 2013 16:53:46 -0400
Subject: [Buildroot] [PATCH] beagleboneblack: add board
In-Reply-To: <OF4892FC0E.FA9FE3E3-ON86257BF2.006E10F1-86257BF2.006EC6A2@rockwellcollins.com>
References: <1380220826-17732-1-git-send-email-jkridner@beagleboard.org>
 <87bo3f5pz4.fsf@dell.be.48ers.dk>
 <OF4892FC0E.FA9FE3E3-ON86257BF2.006E10F1-86257BF2.006EC6A2@rockwellcollins.com>
Message-ID: <CA+T6QPknCP3O2uM_S8va-MqY+jjzmojgmADw3wg4=4ePNmLw0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 26, 2013 at 4:09 PM, Ryan Barnett
<rjbarnet@rockwellcollins.com> wrote:
>
> Peter/Jason/All,
>
> Peter Korsgaard <jacmet@uclibc.org> wrote on
> 09/26/2013 02:42:55 PM:
>
> >
> > >>>>> "Jason" == Jason Kridner <jkridner@beagleboard.org> writes:
> >
> > Hi Jason,
> >
> >  Jason> From: Jason Kridner <jdk@ti.com>
> >  Jason> Signed-off-by: Jason Kridner <jdk@ti.com>
> >  Jason> ---
> >  Jason>  board/beagleboneblack/linux-3.8.config | 4305 +++++++++++++++
> > +++++++++++++++++
> >  Jason>  configs/beagleboneblack_defconfig      |   38 +
> >  Jason>  2 files changed, 4343 insertions(+)
> >  Jason>  create mode 100644 board/beagleboneblack/linux-3.8.config
> >  Jason>  create mode 100644 configs/beagleboneblack_defconfig
> >
> >  Jason> diff --git a/board/beagleboneblack/linux-3.8.config b/board/
> > beagleboneblack/linux-3.8.config
> >  Jason> new file mode 100644
> >  Jason> index 0000000..e6cf0a2
> >  Jason> --- /dev/null
> >  Jason> +++ b/board/beagleboneblack/linux-3.8.config
> >  Jason> @@ -0,0 +1,4305 @@
> >  Jason> +#
> >  Jason> +# Automatically generated file; DO NOT EDIT.
> >  Jason> +# Linux/arm 3.8.13 Kernel Configuration
> >
> > Please run make ARCH=arm savedefconfig in the kernel source directory to
> > make a minimal config instead.


Will do. I'll probably post v2 late tonight.

>
>
> I believe there is an issue with that kernel where it is unable to
> compile the musb driver for the omap (CONFIG_USB_MUSB_OMAP2PLUS)
> statically into the kernel because it will default to being a module
> which will cause the kernel to fail to compile. I ran into this issue
> with the Beagleboard-XM with the same kernel. The solution I found was
> here:
>
> http://www.spinics.net/lists/linux-usb/msg67054.html
>
> I think added this patch to the kernel which I would may recommend adding
> to the git repository you reference for this kernel.

Well, the musb is working in my image, so I'm not sure what to say
other than I don't think this is necessary. I will move to the
mainline kernel as soon as the features are sufficiently stable.

Other questions from Peter cut out of the reply:
> Any specific reason to not use 2013.07 instead?

No, I just took this from the existing BeagleBone config. I'll move up
to 2013.07.

> Would there be any issues with bumping the kernel version to this for
> the original (white) beaglebone as well?

Nope. I could make one build that supported both boards, but it would
need to have both .dtb files in it. That's the only reason I made a
separate config. Is there an easy way to include multiple .dtb files?
Mainline u-boot is smart enough to tell me which one needs to be used
at boot.
