From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Dec 2016 19:57:32 +0100
Subject: [Buildroot] ADP5588 - Platform data
In-Reply-To: <CAFMv-czcQedXA8nPsJgrEaZYJYg8UqW8ePO4NWB64=1BGwC=7A@mail.gmail.com>
 (Leonardo Giordano's message of "Tue, 13 Dec 2016 15:08:38 -0300")
References: <CAFMv-czcQedXA8nPsJgrEaZYJYg8UqW8ePO4NWB64=1BGwC=7A@mail.gmail.com>
Message-ID: <874m273bdv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Leonardo" == Leonardo Giordano <lgiordano@controlnet.com.ar> writes:

 > Hi,
 > My board has and ADP5588 IC (it is an I2C matrix keyboard scanner).

This kind of kernel questions are really more suited for one of the
kernel lists, E.G. the input or i2c lists.

 > I enabled the ADP5588 at kernel configuration.
 > Then I added the following section to i2c at dts file:

 > adp5588: keyboard at 1b {
 > compatible = "adp5588-keys";
 > reg = <0x1b>;
 > interrupt-parent = <&pioC>;
 > interrupts = <1 0x0>;
 > pinctrl-names = "default";
 > pinctrl-0 = <&pinctrl_adp5588_irq>;
 > wakeup-source;
 > };

Where did you get this from? As far as I can see there isn't any
devicetree support in that driver of any bindings documented.

 > However, at adp5588_probe() function (drivers/input/keyboard/adp5588.c), it
 > fails when trying to get platform data:

 > const struct adp5588_kpad_platform_data *pdata =
 >  dev_get_platdata(&client->dev);

 > pdata points to null.

The driver has to be extended with devicetree bindings to get the
information that used to be encoded in the platform data from the DT.

-- 
Bye, Peter Korsgaard
