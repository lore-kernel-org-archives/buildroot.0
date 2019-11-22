From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 22 Nov 2019 13:42:33 +0100
Subject: [Buildroot] [PATCH v3 for-next 02/11] configs/qemu{x86,
 x86_64}: add a serial console
In-Reply-To: <CAJ4jsafEwAY2+3ayL7n=bUHtng2FnROJDD=DgUny3BEhBL3H=g@mail.gmail.com>
References: <20191117201909.12900-1-romain.naour@smile.fr>
 <20191117201909.12900-3-romain.naour@smile.fr>
 <CAJ4jsafEwAY2+3ayL7n=bUHtng2FnROJDD=DgUny3BEhBL3H=g@mail.gmail.com>
Message-ID: <c60e1bcb-e991-686c-6980-6d8397cdd366@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

Thanks for your feedback!

Le 22/11/2019 ? 12:27, Carlos Santos a ?crit?:
> On Sun, Nov 17, 2019 at 5:19 PM Romain Naour <romain.naour@smile.fr> wrote:
>>
>> The current Buildroot defconfigs for qemu_x86 and qemu_x86_64
>> instantiate a console on tty1, which appears on QEMU's
>> graphical window. Add a console on the serial port (ttyS0) to
>> be used later for gitlab testing.
>>
>> This change is need since the script used for gitlab testing
>> needs to use a serial output with pexpect.
>>
>> This change is similar to the one made for raspberrypi [1] to
>> handle HDMI and serial console:
> 
> I think the serial console should be the default on all qemu
> defconfigs, since it best matches embedded devices.

At least it's the common starting point when you start working with Buildroot
and a new embedded device.

Only x86 qemu defconfig was not using the serial console by default.

> 
> In the long run it should be possible to configure additional ttys by
> means of a cleaner and standard mechanism. I even sketched it by meas
> of a BR2_TARGET_GETTY_PORTS list some time but lost it when moved to a
> new job. I will try to recreate it and submit a draft for review.
> 

Ok.

Best regards,
Romain
