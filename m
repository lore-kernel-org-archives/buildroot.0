From: Christian Stewart <christian@paral.in>
Date: Mon, 15 Mar 2021 13:49:02 -0700
Subject: [Buildroot] [PATCH v1 2/2] package/batman-adv: enable
 B.A.T.M.A.N. V protocol by default
In-Reply-To: <20210315195900.GS2737665@scaer>
References: <20210314223207.13460-1-ps.report@gmx.net>
 <20210314223207.13460-2-ps.report@gmx.net>
 <20210315195900.GS2737665@scaer>
Message-ID: <CA+h8R2oE3gsaPrgKaB4EDAuXG=phCmL+Q7Y=Q5+tro2QzQvsXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, Mar 15, 2021 at 12:59 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >  config BR2_PACKAGE_BATMAN_ADV_BATMAN_V
> > -     bool "enable B.A.T.M.A.N. V protocol (experimental)"
> > +     bool "enable B.A.T.M.A.N. V protocol"
>
> Upstream seems to still consider this to be experimental [0].
>
> > +     default y
>
> What we talked about earlier [1], was to always enable it, not to change
> the default.
>
> Now, people that have a defconfig file with BATMAN-V disabled (i.e.
> there would be nothing in the defconfig as 'is not set' is the default),
> will have it enabled now.
>
> So, if upstream recommends to not disable it (do you have a ref?), then
> we should just drop our option, and to always enable it.
>
> Thoughts?
>
> [0] https://git.open-mesh.org/batman-adv.git/blob/HEAD:/Makefile#l7
> [1] http://lists.busybox.net/pipermail/buildroot/2021-March/305811.html

What would the advantage be for removing the ability to disable the
CONFIG_BATMAN_ADV_BATMAN_V option from the Buildroot config?

I guess if someone doesn't need it it could still be good to remove to
simplify things.

Best,
Christian
