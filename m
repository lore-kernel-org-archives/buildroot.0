From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 17:03:07 +0200
Subject: [Buildroot] /etc//init.d init scripts in buildroot
In-Reply-To: <CALtfCQYjVE502OVpbTcbhpAGoLXuf-01ZRm+HjAY1hqaMZ4izA@mail.gmail.com>
References: <CALtfCQZAis0fX+J6NWTX+u=ZJB-0ZKoKgkBcteAJU4f+c46BJA@mail.gmail.com>
 <87shhzb3d1.fsf@dell.be.48ers.dk>
 <CALtfCQYpfbuuyfp7TZ1iXJ-OPmGQTPV1kv0XV6d0ck0AzwMQOw@mail.gmail.com>
 <CALtfCQZQzLtt86OyosfbF8PoVBS=whDfxsN-juHXhwRSjqAcpg@mail.gmail.com>
 <CALtfCQYjVE502OVpbTcbhpAGoLXuf-01ZRm+HjAY1hqaMZ4izA@mail.gmail.com>
Message-ID: <20170719170307.3b75e0a4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Jul 2017 17:00:19 +0200, Oscar Gomez Fuente wrote:

> I need goes high pin 26 at the end of the halt command. I've tried with
> this .dts:
> 
> /dts-v1/;
> /plugin/;
> 
> / {
>     compatible = "brcm,bcm2709";
>     fragment at 0 {
>         target-path = "/";
>         __overlay__ {
>             power_ctrl: power_ctrl {
>                 compatible = "gpio-poweroff";
>                 gpios = <&gpio 26 1>;
>             };
>         };
>     };
> 
> };
> 
> But it doesn't work and I get this error:
> 
> ...
> [    0.576179] mousedev: PS/2 mouse device common for all mice
> -->[    0.576225] poweroff-gpio power_ctrl: gpio_poweroff_probe:  
> pm_power_off function already registered
> -->[    0.576237] poweroff-gpio: probe of power_ctrl failed with error -16  
> [    0.576632] bcm2835-cpufreq: min=1200000 max=1200000
> [    0.576799] sdhci: Secure Digital Host Controller Interface driver
> ...
> 
> I have activated in the kernel config file: CONFIG_POWER_RESET=y and
> CONFIG_POWER_RESET_GPIO=y
> 
> Does anyone any suggestion?

This is no longer a Buildroot question, so not very appropriate on this
mailing list.

Some other driver or architecture code is registering a pm_power_off
hook, so you'd have to find which one.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
