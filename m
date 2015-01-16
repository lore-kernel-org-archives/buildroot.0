From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 09:27:31 +0100
Subject: [Buildroot] support for cortex m3/m4 with newlib
In-Reply-To: <DB3PR04MB1081BE3A3017D73CFE2F7A2EA4F0@DB3PR04MB108.eurprd04.prod.outlook.com>
References: <CAOudHSX=sc7hwE0PObED1jtDp7pOs-=PPVG_Rsh6+di9iYWojA@mail.gmail.com>
 <DB3PR04MB108A30595D5D2347E0366E1EA4F0@DB3PR04MB108.eurprd04.prod.outlook.com>
 <CAOudHSVE_H85gBwZnBkf=_DAzN+XcmcHYRk9SA8s4qZ94+xXKQ@mail.gmail.com>
 <DB3PR04MB1081BE3A3017D73CFE2F7A2EA4F0@DB3PR04MB108.eurprd04.prod.outlook.com>
Message-ID: <20150116092731.0e47d15f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

A couple of mailing list best practices: please keep the messages on
the list (the reply from Cjw was only made to Fabrice), and please
avoid top posting: your replies should be *below* the text you are
replying to. Thanks.

On Fri, 16 Jan 2015 07:56:23 +0000, Fabrice Mousset | GEOCEPT GmbH
wrote:

> I didn?t know ChibiOS, it seems to be interesting, but my interest is more focused on uClinux ;-)
> I don?t have many extra time left, but perhaps I could give you some help.
> Do you have publish your work on a platform like github/sourceforge or something like that?
> What is your next step?
> I have a stm32f4 discovery board, so I could help you on this platform. I?m not an expert, but want to learn more about uClinux and buildroot. I seems to be a good opportunity.

uClinux is not really a different operating system. And in fact,
uClinux doesn't really exist anymore: it used to be a fork of the
Linux kernel to support MMU-less architectures. But this support has
now been merged back in the official Linux kernel.

So for example, on Blackfin (which is an MMU-less architecture), you
can run the official Linux kernel. You can continue to call that
uClinux if you want, but it really has nothing to do anymore with the
original uClinux project.

Buildroot already "supports" uClinux in the sense that it supports the
MMU-less Blackfin architecture, so it should be easily applicable to
other MMU-less architectures such as Cortex-M3/M4 based platforms.

I have a Cortex-M3 platform running Linux, but it has so little RAM
that even the minimal Buildroot filesystem cannot boot on it. I found
this a bit too limited and decided to not really spend more time on
this. But other Cortex-M3 platforms with more RAM are available (8 MB
and more), which should make this more feasible.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
