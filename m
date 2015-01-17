From: Cjw X <cjwfirmware@vxmdesign.com>
Date: Fri, 16 Jan 2015 20:42:01 -0500
Subject: [Buildroot] support for cortex m3/m4 with newlib
In-Reply-To: <DB3PR04MB1081BE3A3017D73CFE2F7A2EA4F0@DB3PR04MB108.eurprd04.prod.outlook.com>
References: <CAOudHSX=sc7hwE0PObED1jtDp7pOs-=PPVG_Rsh6+di9iYWojA@mail.gmail.com>
 <DB3PR04MB108A30595D5D2347E0366E1EA4F0@DB3PR04MB108.eurprd04.prod.outlook.com>
 <CAOudHSVE_H85gBwZnBkf=_DAzN+XcmcHYRk9SA8s4qZ94+xXKQ@mail.gmail.com>
 <DB3PR04MB1081BE3A3017D73CFE2F7A2EA4F0@DB3PR04MB108.eurprd04.prod.outlook.com>
Message-ID: <CAOudHSU0Nzv6FDNeJtFRgfZ+anNV_qOLpqzbC7HMETg26Vu18g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 16, 2015 at 2:56 AM, Fabrice Mousset | GEOCEPT GmbH <
fabrice.mousset@geocept.com> wrote:

>  I didn?t know ChibiOS, it seems to be interesting, but my interest is
> more focused on uClinux ;-)
>
> I don?t have many extra time left, but perhaps I could give you some help.
>
> Do you have publish your work on a platform like github/sourceforge or
> something like that?
>
> What is your next step?
>
> I have a stm32f4 discovery board, so I could help you on this platform.
> I?m not an expert, but want to learn more about uClinux and buildroot. I
> seems to be a good opportunity.
>
>
>
> What are you next planned steps?
>
>
Well, right now I'm working on integrating OS support. Unfortunately, I
can't post the OS integration support until hardware is done and publicly
released. Then I'm guessing it will be hosted on my github account.
https://github.com/vxmdesign

I can release the toolchain part. Here is a tar of the repo which builds a
toolchain that works for the STM32F407 on the discovery board.
 http://www.vxmdesign.com/images/prjpluto.tar.gz

The defconfig is pluto_defconfig

Check it out.

-Chris


>
> Regards
>
> Fabrice
>
>
>
>
> *Von:* cjwfirmware at gmail.com [mailto:cjwfirmware at gmail.com] *Im Auftrag
> von *Cjw X
> *Gesendet:* Freitag, 16. Januar 2015 08:20
> *An:* Fabrice Mousset | GEOCEPT GmbH
> *Betreff:* Re: [Buildroot] support for cortex m3/m4 with newlib
>
>
>
> It is targeting stm32f4. Right now it is being developed against a
> discovery board, but it will eventually target my own board.
>
> So far I've looked into
>
> ChibiOS
>
> uClinux
> and Nuttx
>
>
>
> Right now it is generating the toolchain with newlib and uClibc++. It is
> doing this as target arm-none-eabi-* since I've seen a variety of packages
> assume that cross compiler. (That is what arm's launchpad creates). I will
> also probably try and figure out how to integrate libopencm3.
>
> My plan is it support the three above (eventually) for my own stuff. Right
> now I'm just feeling out if there is much community interest. There is a
> big difference in effort between "do it for me" and "do it for everyone"
> and I don't have huge amounts of extra time. I think this stuff is cool
> though, so I'm thinking other people might also.
>
> Thanks,
>
> -Chris
>
>
>
>
>
>
>
> On Fri, Jan 16, 2015 at 1:40 AM, Fabrice Mousset | GEOCEPT GmbH <
> fabrice.mousset at geocept.com> wrote:
>
>  Hi Chris,
>
>
>
> I have some boards from ST (Discovery and Disco), they are base on STM32
> processor.
>
> I was thinking about having support of those boards with buildroot, but
> never find time to check this out.
>
> I know that buildroot has support of Blackfin processors, which are also
> Cortex M3/M4 based, but don?t know what would be the extra work to port
> this uClinux support to more Cortex M3/M4 processor.
>
> What are you looking for? Do you plan to add support for uClinux,
> FreeRTOS, eCos, RTEMS or another operating system (perhaps in-house)?
>
> For which kind of Cortex M3/M4 processor have you done the port?
>
>
>
> Regards
>
>
>
> Fabrice
>
>
>
> *Von:* buildroot [mailto:buildroot-bounces at busybox.net] *Im Auftrag von *Cjw
> X
> *Gesendet:* Donnerstag, 15. Januar 2015 23:58
> *An:* buildroot at busybox.net
> *Betreff:* [Buildroot] support for cortex m3/m4 with newlib
>
>
>
> I've been working on modifying buildroot to support cortex m3/m4
> processors against the newlib library.
>
> This way I can use buildroot to build RTOS's for those processors. I've
> been using buildroot for years to build linux systems and I would like to
> expand that for the smaller processors with different operating systems.
>
> I am making some progress. The toolchain already works. I'm now starting
> to go down the road of supporting RTOS's.
>
> I'm going to keep going regardless, but I wanted to check to find out if
> this interests the community.
>
> Does this interest people?
>
> -Chris
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150116/89bffb4e/attachment.html>
