From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 14 Mar 2021 22:18:09 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/batman-adv: bump version to
 2021.0
In-Reply-To: <20210314124249.GW2737665@scaer>
References: <20210311210804.9616-1-ps.report@gmx.net>
 <20210311210804.9616-2-ps.report@gmx.net>
 <CA+h8R2ps1MF-NiZKYWceSTruHLXMpzLPORhzORetVKuF1PWDdA@mail.gmail.com>
 <20210312230903.18bf4a0a@gmx.net>
 <CA+h8R2r7oBE1h7FSQC+CR=q2Vr-K5bS-qkwVFO-+GT24Qb6Raw@mail.gmail.com>
 <20210314124249.GW2737665@scaer>
Message-ID: <20210314221809.618a8d72@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian, Yann,

On Sun, 14 Mar 2021 13:42:49 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Christian, Peter, All,
>
> On 2021-03-12 15:51 -0800, Christian Stewart spake thusly:
> > On Fri, Mar 12, 2021 at 2:09 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > > > On Thu, Mar 11, 2021 at 1:08 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > > > > -BATMAN_ADV_VERSION = 2019.3
> > > > > +BATMAN_ADV_VERSION = 2021.0
> > > > I get build errors against 2 different device kernels (x86_64 and pi4):
> [--SNIP--]
> > > For me the update fixed the compile for RPi4_64 ;-), can you share your
> > > defconfig(s)?
> > OK, I see what happened here. I just ran "make batman-adv" in an
> > existing tree without enabling the Kconfig options.
> >
> > The problem is when batman adv protocol version 5 is not enabled:
> >
> > BR2_PACKAGE_BATMAN_ADV=y
> > # BR2_PACKAGE_BATMAN_ADV_DEBUG is not set
> > # BR2_PACKAGE_BATMAN_ADV_NC is not set
> > # BR2_PACKAGE_BATMAN_ADV_BATMAN_V is not set
> >
> > That's causing the "batadv_v_init" undefined errors.
>
> So is this an actual issue that still needs to be addressed, or can the
> patch be applied now?

I can confirm the compile failure in case BR2_PACKAGE_BATMAN_ADV_BATMAN_V is
not enabled...., but the buildroot config still states it is 'exerpimental':


	config BR2_PACKAGE_BATMAN_ADV_BATMAN_V
        	bool "enable B.A.T.M.A.N. V protocol (experimental)"

According to [1] CONFIG_BATMAN_ADV_BATMAN_V option is enabled by default
since 2018.2 (and it seems compile without is not tested very carefully),
maybe time to drop the buildroot config option and always enable
CONFIG_BATMAN_ADV_BATMAN_V?

But will take a deeper look at the source code if the failure is fixable
(or post an upstream failure report)...

Regards,
Peter


https://git.open-mesh.org/batman-adv.git/blob/HEAD:/CHANGELOG.rst#l174

>
> Regards,
> Yann E. MORIN.
>
