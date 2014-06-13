From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 13 Jun 2014 17:50:34 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140613170726.4db5e1cf@free-electrons.com>
References: <20140613063010.B26041011DE@stock.ovh.net>
 <20140613111216.1fdae121@free-electrons.com>
 <20140613145515.GA15237@rmm-p1267483>
 <20140613170726.4db5e1cf@free-electrons.com>
Message-ID: <20140613155033.GC15237@rmm-p1267483>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 13, 2014 at 05:07:26PM +0200, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Fri, 13 Jun 2014 16:55:17 +0200, Eric Le Bihan wrote:
>
> > > Will be fixed by http://patchwork.ozlabs.org/patch/358913/.
> > This patch will only fix http://autobuild.buildroot.net/results/4b00d517c17cfcd29359e63423f15ac5331096b2/.
> >
> > The error in http://autobuild.buildroot.net/results/33e1447949d13bccc4076b69f902432e2131cc1c/ is:
> >
> >   src/libsystemd/sd-rtnl/rtnl-types.c:70:10: error: 'IFLA_VLAN_PROTOCOL'
> >   undeclared here (not in a function)
> >            [IFLA_VLAN_PROTOCOL]    = { .type = NLA_U16 },
> >
> > IFLA_VLAN_PROTOCOL was introduced in Linux 3.10. I'll post a patch updating
> > the kernel headers needs for systemd.
>
> Ah, yes, right. Crazy that kernel headers as recent as 3.10 are needed
> to build systemd...
Systemd clearly misses some #ifdef's in some places to keep decent
build requirements...

Best regards,
ELB
