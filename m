From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 24 Jun 2014 11:36:29 +0200
Subject: [Buildroot] dtb or dtsi ?
In-Reply-To: <CAHvj1qbZWcdUvq7du=Xo2KXpA_WjXvPr8+wg61niR7TeLVToRw@mail.gmail.com>
References: <CAHvj1qbZWcdUvq7du=Xo2KXpA_WjXvPr8+wg61niR7TeLVToRw@mail.gmail.com>
Message-ID: <CAAXf6LXV=jRqpCpx5FU31cNVcVXe_wNK6ut6GvWQzOF1bcrbLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bruce,

On Tue, Jun 24, 2014 at 11:22 AM, bruce bushby <bruce.bushby@gmail.com> wrote:
> Hi
>
>
> Apologies if these are junior/lazy questions....but I've been struggling for
> 5 days now :(
>
> What is the difference between "dtb" and "dtsi"?
>

dtb = device tree blob
dts = device tree source
dtsi = like dts, but I think the 'i' is to indicate that this file is
supposed to be included in another dts(i) file.

The dtb is the compiled version of the dts(i).

>
> I find that buildroot appends ".dtb" to the name defined by:
> BR2_LINUX_KERNEL_INTREE_DTS_NAME
>
> rather then append "dtsi"  ...what am I missing?
>
>
> I feel I should be using
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20.dtsi"

You should set a 'dts' file here, not dtsi. The dtsi is supposed to be
included from a toplevel dts file, and there exist make rules to
convert dts->dtb but not dtsi->dtb.
Note: the compilation step is done by dtc (device tree compiler).

>
>
> make[1]: Entering directory
> `/disk/software/drone/buildroot/output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee'
> make[2]: *** No rule to make target `arch/arm/boot/dts/sun7i-a20.dtb'.
> Stop.
> make[1]: *** [sun7i-a20.dtb] Error 2
>
>
>

You should find/create the proper .dts file instead, then this step will work.


>  ....Do I still need "fex" if i am using "dts"?

I suppose not. According to wikipedia fex is a proprietary alternative
to device trees, and so you shouldn't need both. I haven't worked with
fex nor allwinner before.



Best regards,
Thomas
