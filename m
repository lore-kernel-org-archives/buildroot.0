From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 6 Oct 2019 17:43:36 +0200
Subject: [Buildroot] [PATCH 10/10] package/mdevd: bump version to 0.1.1.0
In-Reply-To: <20191002192514.GI10860@scaer>
References: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
 <20190929171017.26831-11-eric.le.bihan.dev@free.fr>
 <20190930225757.44578f50@windsurf.home>
 <87wodp1npl.fsf@dell.be.48ers.dk> <20190930231441.GB11114@itchy>
 <20191001085020.43b52a31@windsurf.home>
 <e5b70991-b0ca-79f1-33a0-1eb00bf6aa88@mind.be>
 <20191002192514.GI10860@scaer>
Message-ID: <20191006154336.GC5258@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-10-02 21:25, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2019-10-01 10:35 +0200, Arnout Vandecappelle spake thusly:
> > On 01/10/2019 08:50, Thomas Petazzoni wrote:
> > > On Tue, 1 Oct 2019 01:14:41 +0200
> > > Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:
> > >
> > >> I did not know about the daemon mode of mdev, but mdevd was created to
> > >> overcome the mdev forking issue [1] and predates the daemon option [2].
> > >>
> > >> So in the end, they provide the same features, with mdevd also complying
> > >> with s6 notification mechanism [3], making it more tightly coupled with
> > >> this init system.
> > >>
> > >> Given that there is no option in menuconfig to use a s6-based init
> > >> system [4], I see no reason to add a "devtmpfs+mdevd" option ATM.
> > >
> > > But then there is nothing that prevents them from enabling
> > > devtmpfs+eudev as the /dev management system, and separately enable
> > > mdevd. That wouldn't work very well.
> > >
> > > On the other hand, if a user enables both openssh and dropbear, in
> > > their default configuration, both will try to listen on TCP port 22,
> > > which won't work as well. So perhaps we can live with having mdevd as a
> > > standalone package, with no specific handling in the /dev management
> > > choice. I'm just a bit worried about users who will enable this mdevd
> > > package, while they are looking for Busybox mdev.
> >
> >  AFAIU, the s6 tools are really an ecosystem. So I think it would make sense to
> > move all of them into a "s6 system management" menu under System tools. That
> > should make it sufficiently clear that this is not related to busybox mdev.
>
> Doesn't s6 also come with an init system of its own, too? In which case,
> it would be more akin to the systemd situation.

In a way, the s6 ecosystem is more a kit to build an init system than a
full init system stack like systemd. The author emphasizes that it
provides a mechanism and not policies. For example, some users mix the
services supervision part (s6) and OpenRC [1].

The mdevd program can be used without s6, unlike udev which is now part
of systemd (this situation lead to the creation of eudev).

[1] https://github.com/OpenRC/openrc/blob/master/s6-guide.md

Regards,

--
ELB
