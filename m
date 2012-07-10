From: =?UTF-8?Q?Mihajlo_Jovanovi=C4=87?= <jovanovic.mihajlo@gmail.com>
Date: Tue, 10 Jul 2012 17:13:16 +0200
Subject: [Buildroot] /dev/ttyS0 in filesystem created by Buildroot can't
 be opened in Qemu
In-Reply-To: <20120710125411.GC4206@sapphire.tkos.co.il>
References: <CAM1vXnbUXsTaCbtRnS5z8SdqKTTY-EV3=o79vcGbwnSjukYmNw@mail.gmail.com>
 <20120709084152.GJ22116@sapphire.tkos.co.il>
 <CAM1vXnZsLGimtxeVZ3k6n+K6k3OdV=VwWPVEuujAD0-ZT176Bg@mail.gmail.com>
 <20120709161602.GG3783@tarshish>
 <CAM1vXnaJ2c1NY1CRqcAwo0ZY8M-MTBwEsx_gGQzZkXRLf+gvVA@mail.gmail.com>
 <20120710102910.GA4206@sapphire.tkos.co.il>
 <20120710144610.2d5599aa@skate>
 <20120710125411.GC4206@sapphire.tkos.co.il>
Message-ID: <CAM1vXnbQ8PFkT7rDvhC5kVEUv4Nxserx8CTQUFZz8TnoXh7skg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, Thomas,

I have managed to launch Qemu after clean build. Configuration file was
qemu_arm_vexpress_defconfig. There was no need to specify "rw" to avoid
filesystem being read only.

I made sure that ttyAMA0 is console output.

Qemu window is framebuffer (only Tux is there) and all console input/output
is in terminal window where I launched Qemu. I got command prompt.

However, just for testing purposes, I have launched qemu with
"console=tty1" and then I got correct output in terminal window, whereas in
Qemu window there was Tux and outputs were finished with "Starting
network...". Probably the reason for that is discrepancy between specifying
"tty1" in Qemu invocation, and at the same time selecting "ttyAMA0" in
menuconfig

Many thanks for your suggestions.

I find Buildroot very handy, and in my future work I will continue to use
it. I'm sure there will be more questions and it's good to know that
there's somebody who can help.

Best regards,

Mihajlo

2012/7/10 Baruch Siach <baruch@tkos.co.il>

> Hi Thomas,
>
> On Tue, Jul 10, 2012 at 02:46:10PM +0200, Thomas Petazzoni wrote:
> > Le Tue, 10 Jul 2012 13:29:11 +0300,
> > Baruch Siach <baruch@tkos.co.il> a ?crit :
> >
> > > Did you make a clean build after changing the configuration? The
> Buildroot
> > > configuration system can't detect all configuration changes so
> sometimes you
> > > must start from clean. Specifically, make sure that your /etc/inittab
> has the
> > > right getty command with ttyAMA0.
> >
> > This specific part (munging the tty used for getty) is actually done as
> > a post-build process, so it's updated as per the configuration at every
> > build, without having to do a make clean.
>
> Thanks for clarifying this. However, the console output that Mihajlo has
> posted seems to indicate that something is wrong with the getty
> configuration.
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120710/7823676f/attachment.html>
