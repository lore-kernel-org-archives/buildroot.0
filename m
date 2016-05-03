From: Martin Bark <martin@barkynet.com>
Date: Tue, 3 May 2016 11:23:50 +0100
Subject: [Buildroot] [PATCH v2] raspberrypi3: fix serial console (load
 pi3-miniuart-bt overlay)
In-Reply-To: <871t5jr7e6.fsf@dell.be.48ers.dk>
References: <1462220744-6368-1-git-send-email-ps.report@gmx.net>
 <CALtfCQZowiGZUJ0HV4oTyRMfMY02TherviK_ZE6D4wgfUcQ3gg@mail.gmail.com>
 <871t5jr7e6.fsf@dell.be.48ers.dk>
Message-ID: <CAFGQKxeRKWNCOH2YV0FYA17tdfyeemv3Xau2Bkrzmrxh5Rm-4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 3 May 2016 at 07:18, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:
>
>  > Hi Peter Seiderer,
>  > What's the difference between enabling pi3-miniuart-bt instead of
>  > pi3-disable-bt?
>
>  > With pi3-disable-bt enables it works fine the serial console on (14 [TxD] &
>  > 15 [RxD] pins).
>
> From the names I would guess it is the difference between completely
> disabling access to the bluetooth module and providing access to it
> though the secondary (mini) uart.
>
> The miniuart has some limitations, but I guess basic bluetooth stuff
> should work with it.

I've got a bit lost in the rpi3 serial console issues but as i
understand the current situation all you need to do is set
enable_uart=1 in config.txt.  See
https://github.com/raspberrypi/firmware/issues/553#issuecomment-199486644.
I've not tested this.

I think you also need to change cmdline.txt to use console=serial0 as
the pi3-miniuart-bt will replace it with the correct serial device
(ttyAMA0 or ttyS0) depending if it's enabled or not.  See the comments
in https://github.com/raspberrypi/linux/blob/rpi-4.1.y/arch/arm/boot/dts/overlays/pi3-miniuart-bt-overlay.dts.

Thanks

Martin

>
> --
> Venlig hilsen,
> Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
