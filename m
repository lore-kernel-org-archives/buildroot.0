From: Gaha Bana <gahabana@gmail.com>
Date: Thu, 29 Sep 2016 21:02:12 +0000
Subject: [Buildroot] Build for Odroid-C2 not booting
In-Reply-To: <CAK4VdL0d-v9PwNDGapXsYDCcFu2PhLVFG3gALo-UR5qdTe=Zng@mail.gmail.com>
References: <CAOw_jL1fWrGQHCanQZ_BNXsH3ytiVZ0Kmj4NWNY6paYLXYKT2g@mail.gmail.com>
 <874m4yzvuo.fsf@dell.be.48ers.dk>
 <CAOw_jL2pzrvWfZWSoOOPwTEEQHSup=oVoXYZYGWUH4Q+486AFA@mail.gmail.com>
 <CAK4VdL0d-v9PwNDGapXsYDCcFu2PhLVFG3gALo-UR5qdTe=Zng@mail.gmail.com>
Message-ID: <CAOw_jL39x9EkpPcRvz10cBcwGym_zBMPHm2egqkpYgQSacOBaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi Erico,
not sure about boot.ini/UART thingy - i think C2 gets stuck on u-boot as i
never see kernel heartbeat blink the blue-LED and i dont have
UART/Serial/USB cable yet (placed the order for one). SD card is fine
(Sandisk Ultra, fresh, have tried with Armbian and Hardkernel's Ubuntu
images) and is new.
If i had the UART, i'd probably know where it gets stuck. If you do have C2
- can you try building / burning vanilla config (i made 0 modifications)
and see if it would boot on yours ? i doubt it.

tx !



On Thu, Sep 29, 2016 at 8:36 PM Erico Nunes <nunes.erico@gmail.com> wrote:

> Hi Gana,
>
> On Thu, Sep 29, 2016 at 3:42 PM, Gaha Bana <gahabana@gmail.com> wrote:
> >
> > hi Peter,
> > yes - it's just a link to 'instructions' ... here is what i did:
> >
> >
> > git clone git://git.buildroot.net/buildroot
> > cd buildroot
> >
> >  make odroidc2_defconfig
> >  make menuconfig (leave with Esc-Esc and save the config)
> >
> >  make
> >
> >
> > resulting sdcard.img found in output/images burnt to sd-card.
> >
> >
> > if anyone else can replicate it ... will take 15mins. at least i will
> know problem must be in something else.
> >
> >
> > ps. i did try various SD cards , 2 different ways of writing to them
> (linux and macos) etc etc to avoid usual suspects.
>
>
> The default boot.ini shipped by Buildroot at
> board/hardkernel/odroidc2/boot.ini contains:
>
> # Default Console Device Setting
> setenv condev "console=ttyS0,115200n8 console=tty0"   # on both
>
> If you are monitoring the uart console only, can you try removing
> console=tty0, leaving it only as:
>
> # Default Console Device Setting
> setenv condev "console=ttyS0,115200n8"
>
> I have once noticed on my odroid-c2 that if I had this console "on
> both", it didn't really work for the uart console.
>
>
> Also, my odroid-c2 is unable to even load u-boot if I use old/slow SD
> cards. I have to use the eMMC or a decently rated SD card for it to
> work. The recommendation for Class 10 SD cards is something they even
> mention in their wiki and product pages.
>
> Erico
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160929/365f3e6d/attachment.html>
