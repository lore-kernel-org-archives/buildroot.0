From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 10 Jul 2012 15:54:12 +0300
Subject: [Buildroot] /dev/ttyS0 in filesystem created by Buildroot can't
 be opened in Qemu
In-Reply-To: <20120710144610.2d5599aa@skate>
References: <CAM1vXnbUXsTaCbtRnS5z8SdqKTTY-EV3=o79vcGbwnSjukYmNw@mail.gmail.com>
 <20120709084152.GJ22116@sapphire.tkos.co.il>
 <CAM1vXnZsLGimtxeVZ3k6n+K6k3OdV=VwWPVEuujAD0-ZT176Bg@mail.gmail.com>
 <20120709161602.GG3783@tarshish>
 <CAM1vXnaJ2c1NY1CRqcAwo0ZY8M-MTBwEsx_gGQzZkXRLf+gvVA@mail.gmail.com>
 <20120710102910.GA4206@sapphire.tkos.co.il>
 <20120710144610.2d5599aa@skate>
Message-ID: <20120710125411.GC4206@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 10, 2012 at 02:46:10PM +0200, Thomas Petazzoni wrote:
> Le Tue, 10 Jul 2012 13:29:11 +0300,
> Baruch Siach <baruch@tkos.co.il> a ?crit :
> 
> > Did you make a clean build after changing the configuration? The Buildroot 
> > configuration system can't detect all configuration changes so sometimes you 
> > must start from clean. Specifically, make sure that your /etc/inittab has the 
> > right getty command with ttyAMA0.
> 
> This specific part (munging the tty used for getty) is actually done as
> a post-build process, so it's updated as per the configuration at every
> build, without having to do a make clean.

Thanks for clarifying this. However, the console output that Mihajlo has 
posted seems to indicate that something is wrong with the getty configuration.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
