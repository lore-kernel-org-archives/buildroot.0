From: Lukas Hecht <mixolydisch@gmx.de>
Date: Wed, 3 Mar 2021 17:16:31 +0100
Subject: [Buildroot] Problems with generating an x86 Image
In-Reply-To: <CAAXf6LVehreRKpkNMg2bY2KTsy2BL56dSOCVNUMUu5c7vNPzPw@mail.gmail.com>
References: <98397e30-a396-803a-ddc4-ed31719eae51@gmx.de>
 <CAAXf6LVehreRKpkNMg2bY2KTsy2BL56dSOCVNUMUu5c7vNPzPw@mail.gmail.com>
Message-ID: <8311428a-3ee1-6e00-78e5-064df934dbc5@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

maybe this idea could lead in the right direction. The process takes
about 12 seconds from leaving grub till stopping to boot, which sounds
about right to me for such a basic system.

I did not change anything on the getty, etc/inittab shows:
tty1::respawn:/sbin/getty -L tty1 0 vt100 # GENERIC_SERIAL

My hardware has three serial ports but i don't know any more details
about these at the moment.

Is there an easy way (like with booting a live ubuntu) to find out if
tty1 is the right one?

Thanks a lot,
Lukas


Am 03.03.2021 um 16:56 schrieb Thomas De Schampheleire:
> While I don't have experience specifically with using Buildroot for PC
> images, this symptom gives me the impression that the 'getty', which
> is supposed to give you a login prompt, is not going to the terminal
> you are looking at.
>
> Based on the boot output, do you agree that the system 'seems' booted,
> but you are just missing the login prompt?
>
> Have a look at /etc/inittab , based on the defconfig you started from,
> the getty is supposed to be assigned to 'tty1'.
> Did you change anything in this regard?
> Do you have something specific on this hardware with respect to tty /
> serial line?
>
> Best regards,
> Thomas
