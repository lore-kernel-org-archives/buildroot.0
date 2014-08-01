From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 1 Aug 2014 06:56:04 +0300
Subject: [Buildroot] configure HOSTAPD build to enable nl80211 driver
 support
In-Reply-To: <CABzetm30JEY817UW64kSBwD1eaYr5JF5aErYwYzm0Wbtc1j87g@mail.gmail.com>
References: <CABzetm3JrRH7f4R8ErDqd96XKUBEH=9ARqsQdm86UDfU89D4aw@mail.gmail.com>
 <53D9AC46.9000704@zacarias.com.ar>
 <CABzetm16jMzxh9PjgrA_CA1_8y1a4Lj5pCn2B+Wqmpfoq7eV0A@mail.gmail.com>
 <20140731035151.GG2480@tarshish>
 <CABzetm2uARm_yNv8P3vuW7VvMSKk-WFSg4WcZhf-vy3DnznYQA@mail.gmail.com>
 <20140731041325.GH2480@tarshish>
 <CABzetm30JEY817UW64kSBwD1eaYr5JF5aErYwYzm0Wbtc1j87g@mail.gmail.com>
Message-ID: <20140801035604.GO2480@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rohit,

On Thu, Jul 31, 2014 at 01:16:57PM +0900, Rohit Kumar wrote:
> On Thu, Jul 31, 2014 at 1:13 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Thu, Jul 31, 2014 at 01:07:08PM +0900, Rohit Kumar wrote:
> > > but "CONFIG_DRIVER_WEXT" parameter does not exist in the file.
> > > how do i do it?
> >
> > You can just add it. Not all driver options appear in this file.
>
> i will try it
> do i need "make clean" after changes or i can just do "make" ?

I'm not sure about that. Just try out.

> > > i also have the source for wifi driver which i am using, can i change
> > > something in driver to make it support new API?
> >
> > As far as I know this is not a trivial change, but you should better ask at
> > the linux-wireless mailing list.
> >
> > What hardware do you use? Maybe your device already has a nl80211 driver.
> > Most
> > commercially available devices have.
>
> i am using IPtime USB wifi  dongle it uses realtek 8188 chipset

You are out of luck, it seems. There is a driver for this chipset in the 
staging area of the kernel but its TODO file (drivers/staging/rtl8188eu/TODO) 
contains:

- switch to use LIB80211
- switch to use MAC80211

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
