From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 4 Nov 2015 11:25:29 +0100
Subject: [Buildroot] [PATCH v3 02/13] package/dhcp: systemd: rename
	environment file
In-Reply-To: <20151104111816.6c20529a@free-electrons.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-2-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <CAGduivynxFaA8G90N8B+E2pbSVWvMryWev80-r2_Z=gKzvjC5g@mail.gmail.com>
 <20151104111816.6c20529a@free-electrons.com>
Message-ID: <CAGduivx-MTZ=JeOkBGjkod_pd-iHG22VZ-+1RjuOKS1Mi11R=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all

On Wed, Nov 4, 2015 at 11:18 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Maxime, Beno?t, Gabe,
>
> On Wed, 4 Nov 2015 10:52:10 +0100, Maxime Hadjinlian wrote:
>
> > > diff --git a/package/dhcp/dhcpd.service b/package/dhcp/dhcpd.service
> > > index 7b265cb..5989506 100644
> > > --- a/package/dhcp/dhcpd.service
> > > +++ b/package/dhcp/dhcpd.service
> > > @@ -7,7 +7,7 @@ Type=forking
> > >  PIDFile=/run/dhcpd.pid
> > >  ExecStart=/usr/sbin/dhcpd -q -pf /run/dhcpd.pid $INTERFACES
> > >  KillSignal=SIGINT
> > > -EnvironmentFile=/etc/default/dhcpd.conf
> > > +EnvironmentFile=/etc/default/dhcpd
> > >
> > Maybe this should be:
> > EnvironmentFile-=/etc/default/dhcpd
>
> On the dropbear package, Gabe Evans said it may not be such a good idea
> to do this EnvironmentFile thing.
>
> Can we settle on a common decision ?
>
> (From my PoV, using this EnvironmentFile looked good as it would be a
> common mechanism between the systemd and Busybox/sysvinit cases to tune
> the configuration of services. But Gabe seemed to disagree.)
>
I still have to read that thread, I'll get to it in a few minutes.
The mechanism in itself is good, adding the '-' simply makes the file
optional. For me, a program must be able to start without options, or they
are not options but mandatory parameters (which is a bit contradictory)

>
> Could systemd people in Buildroot decide what to do ? :-)
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151104/e0fc767a/attachment.html>
