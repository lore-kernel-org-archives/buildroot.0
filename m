From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon, 18 Feb 2019 22:28:10 +0100
Subject: [Buildroot] [PATCH v4 6/7] configs/qemu_armv7a_tz_virt: Armv7-A
 emulation with TrustZone services
In-Reply-To: <20190218181437.GA30645@scaer>
References: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
 <1548845249-28201-6-git-send-email-etienne.carriere@linaro.org>
 <20190217231234.321ec6e4@windsurf.home> <20190218181437.GA30645@scaer>
Message-ID: <CAN5uoS-BaiDX8y2-LAsWLjahMtqGNBTvNajW0BReA_0QDEGtCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Mon, 18 Feb 2019 at 19:14, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Thomas, Etienne, All,
>
> On 2019-02-17 23:12 +0100, Thomas Petazzoni spake thusly:
> > On Wed, 30 Jan 2019 11:47:28 +0100
> > Etienne Carriere <etienne.carriere@linaro.org> wrote:
> > > This change introduces a Qemu board for an Armv7-A target executing
> > > with OP-TEE secure world services.
> > I don't know what is the opinion of Peter, Arnout and Yann, but I think
> > this PATCH 6/7 and PATCH 7/7, instead of adding more defconfigs should
> > instead add test cases to our runtime test infrastructure in
> > support/testing/. Indeed:
> >
> >  - We probably don't want to have Qemu defconfigs for every possible
> >    feature in Buildroot
>
> However, I would not be opposed to having _one_ defconfig that can be
> used as a reference / starting-point.

Is the Qemu emulator the best candidate for such starting point.
I think it is as one can use it to experience Arm specific OP-TEE
package without needing specific HW but a standard Linux host.

I would have preferred proposing a change in the already available
Qemu Armv7 as qemu_arm_vexpress_defconfig is but I fear enabling
TrustZone support in Qemu will break other nice Qemu features ones
are used to (graphics?).

Maybe I can find a real HW for which BR can store a defconfig that
enables OP-TEE.

> >  - A runtime test case, even if it's indeed a bit less visible than a
> >    defconfig, still documents a configuration that "works" for a given
> >    feature.
> >  - A runtime test case allows to really runtime test the feature by
> >    booting Qemu.
>
> Agreed: adding a runtiem test should indeed be provided, whether we have
> a defconfig or not.
>
>
> Regards,
> Yann E. MORIN.
>
> > Etienne, would you be willing to convert those two configurations to
> > the runtime test infrastructure ?

I think I can prepare that. Or I will ask few help on the ML if I
can't find my way.

The initial intention when adding these defconfig to my patch series was to
answer a request from patch v3 (i think) review where Thomas asked for
something that could b used to check OP-TEE at least builds, if possible boots,
from a BR build. I understand that maybe you though more of such
runtime test, rather than a defconfig.

Regards,
etienne

>
> >
> > Thanks!
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
