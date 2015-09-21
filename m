From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 21 Sep 2015 20:08:16 +0300
Subject: [Buildroot] [PATCH] configs: add nitrogen6sx_defconfig for
 Boundary Devices SoloX board
In-Reply-To: <CAAMH-yt8Y3GruOxEvw9op=-00op9pnVA_L0ddwi1XNT3b1qqwA@mail.gmail.com>
References: <1441965609-4092-1-git-send-email-gary.bisson@boundarydevices.com>
 <20150919153410.06fe7394@free-electrons.com>
 <CAAMH-yt8Y3GruOxEvw9op=-00op9pnVA_L0ddwi1XNT3b1qqwA@mail.gmail.com>
Message-ID: <20150921170816.GC2242@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Mon, Sep 21, 2015 at 06:19:03PM +0200, Gary Bisson wrote:
> On Sat, Sep 19, 2015 at 3:34 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > On Fri, 11 Sep 2015 12:00:09 +0200, Gary Bisson wrote:
> >> This board is using the exact same kernel and u-boot revision as the
> >> Nitrogen6x. They also share the same u-boot "autoboot" script.
> >>
> >> The differences between the two configurations are:
> >> - getty port is ttymxc0 instead of ttymxc1
> >> - uImage load address is 0x80008000
> >
> > Do you have a reason to keep using uImage instead of using zImage?
> > uImage are now a bit deprecated on ARM, and zImage is the modern way of
> > booting the kernel even from U-Boot (using the bootz command).
> 
> Legacy I guess. I should look into it but the main advantage I see of
> bootm/uImage is the CRC check. What is the story behind the switch to
> bootz?

Multiplatform. See [1], for example.

[1] 
http://lists.infradead.org/pipermail/linux-arm-kernel/2011-September/066289.html

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
