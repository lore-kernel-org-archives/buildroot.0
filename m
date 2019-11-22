From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 22 Nov 2019 08:27:49 -0300
Subject: [Buildroot] [PATCH v3 for-next 02/11] configs/qemu{x86,
 x86_64}: add a serial console
In-Reply-To: <20191117201909.12900-3-romain.naour@smile.fr>
References: <20191117201909.12900-1-romain.naour@smile.fr>
 <20191117201909.12900-3-romain.naour@smile.fr>
Message-ID: <CAJ4jsafEwAY2+3ayL7n=bUHtng2FnROJDD=DgUny3BEhBL3H=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 17, 2019 at 5:19 PM Romain Naour <romain.naour@smile.fr> wrote:
>
> The current Buildroot defconfigs for qemu_x86 and qemu_x86_64
> instantiate a console on tty1, which appears on QEMU's
> graphical window. Add a console on the serial port (ttyS0) to
> be used later for gitlab testing.
>
> This change is need since the script used for gitlab testing
> needs to use a serial output with pexpect.
>
> This change is similar to the one made for raspberrypi [1] to
> handle HDMI and serial console:

I think the serial console should be the default on all qemu
defconfigs, since it best matches embedded devices.

In the long run it should be possible to configure additional ttys by
means of a cleaner and standard mechanism. I even sketched it by meas
of a BR2_TARGET_GETTY_PORTS list some time but lost it when moved to a
new job. I will try to recreate it and submit a draft for review.

-- 
Carlos Santos <unixmania@gmail.com>
