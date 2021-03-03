From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 3 Mar 2021 16:56:32 +0100
Subject: [Buildroot] Problems with generating an x86 Image
In-Reply-To: <98397e30-a396-803a-ddc4-ed31719eae51@gmx.de>
References: <98397e30-a396-803a-ddc4-ed31719eae51@gmx.de>
Message-ID: <CAAXf6LVehreRKpkNMg2bY2KTsy2BL56dSOCVNUMUu5c7vNPzPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


El mi?, 3 mar 2021 a las 16:48, Lukas Hecht (<mixolydisch@gmx.de>) escribi?:
>
> Hi there,
>
> i'm having problems with generating an x86 image for an industrial pc
> based on an AMD Embedded G-Series APU which runs perfectly fine using
> Ubuntu.
>
> Here's what i did, using Buildroot 2020.02.10:
>
>
> make pc_x86_64_bios_defconfig
>
> make menuconfig changes:
>
> Filesystem Image: 250M size
>
> iso image
>
> initial ram filesystem
>
> Networking applications - wireless-regdb (to get rid of an regdb error
> while booting)
>
> make
>
>
> dd disk.img to USB drive, and then copy bzImage to /boot on the USB drive.
>
> Boot my target system with clonezilla to console, and then dd the usb
> drive to /dev/sda
>
>
> When i reboot and remove the usb drive, grub starts and selects
> "buildroot" after 5 seconds, and then the boot starts but i don't get to
> the console. It stops with:
>
>
> Welcome to Buildroot
>
> buildroot login: scsi 0:0:0:0: Direct-Access Generic Ultra HS-COMBO 1.98
> PQ: 0 ANSI : 0
>
> sd 0:0:0:0 [sda] Attached SCSI removable disk
>
> random: fast init done
>
> random: crng init done (coming up after some minutes)
>
>
> And there it just stops, with a blinking cursor. Can anyone point me to
> what i am doing wrong?
>
> If not, is there an easy way to access and save the console output that
> comes up before these last lines to get a better understanding of what
> is happening?

While I don't have experience specifically with using Buildroot for PC
images, this symptom gives me the impression that the 'getty', which
is supposed to give you a login prompt, is not going to the terminal
you are looking at.

Based on the boot output, do you agree that the system 'seems' booted,
but you are just missing the login prompt?

Have a look at /etc/inittab , based on the defconfig you started from,
the getty is supposed to be assigned to 'tty1'.
Did you change anything in this regard?
Do you have something specific on this hardware with respect to tty /
serial line?

Best regards,
Thomas
