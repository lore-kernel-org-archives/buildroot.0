From: Leonardo Giordano <lgiordano@controlnet.com.ar>
Date: Tue, 13 Dec 2016 16:11:27 -0300
Subject: [Buildroot] ADP5588 - Platform data
In-Reply-To: <874m273bdv.fsf@dell.be.48ers.dk>
References: <CAFMv-czcQedXA8nPsJgrEaZYJYg8UqW8ePO4NWB64=1BGwC=7A@mail.gmail.com>
 <874m273bdv.fsf@dell.be.48ers.dk>
Message-ID: <CAFMv-cyTxKvcy60pHj5u2osEY-JOUuwGwnyYuXS+Y3LVjapBFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,
Thanks for replying.

It seems I'm "extending" the driver, as I want to use device tree.
Sorry for sending to this list, I agree it should be sent to kernel list,
but I'm not part of it yet.

Regards,
Leonardo

2016-12-13 15:57 GMT-03:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Leonardo" == Leonardo Giordano <lgiordano@controlnet.com.ar>
> writes:
>
>  > Hi,
>  > My board has and ADP5588 IC (it is an I2C matrix keyboard scanner).
>
> This kind of kernel questions are really more suited for one of the
> kernel lists, E.G. the input or i2c lists.
>
>  > I enabled the ADP5588 at kernel configuration.
>  > Then I added the following section to i2c at dts file:
>
>  > adp5588: keyboard at 1b {
>  > compatible = "adp5588-keys";
>  > reg = <0x1b>;
>  > interrupt-parent = <&pioC>;
>  > interrupts = <1 0x0>;
>  > pinctrl-names = "default";
>  > pinctrl-0 = <&pinctrl_adp5588_irq>;
>  > wakeup-source;
>  > };
>
> Where did you get this from? As far as I can see there isn't any
> devicetree support in that driver of any bindings documented.
>
>  > However, at adp5588_probe() function (drivers/input/keyboard/adp5588.c),
> it
>  > fails when trying to get platform data:
>
>  > const struct adp5588_kpad_platform_data *pdata =
>  >  dev_get_platdata(&client->dev);
>
>  > pdata points to null.
>
> The driver has to be extended with devicetree bindings to get the
> information that used to be encoded in the platform data from the DT.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161213/616bfb61/attachment.html>
