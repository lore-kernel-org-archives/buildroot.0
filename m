From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 11:18:16 +0100
Subject: [Buildroot] [PATCH v3 02/13] package/dhcp: systemd: rename
	environment file
In-Reply-To: <CAGduivynxFaA8G90N8B+E2pbSVWvMryWev80-r2_Z=gKzvjC5g@mail.gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-2-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <CAGduivynxFaA8G90N8B+E2pbSVWvMryWev80-r2_Z=gKzvjC5g@mail.gmail.com>
Message-ID: <20151104111816.6c20529a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, Beno?t, Gabe,

On Wed, 4 Nov 2015 10:52:10 +0100, Maxime Hadjinlian wrote:

> > diff --git a/package/dhcp/dhcpd.service b/package/dhcp/dhcpd.service
> > index 7b265cb..5989506 100644
> > --- a/package/dhcp/dhcpd.service
> > +++ b/package/dhcp/dhcpd.service
> > @@ -7,7 +7,7 @@ Type=forking
> >  PIDFile=/run/dhcpd.pid
> >  ExecStart=/usr/sbin/dhcpd -q -pf /run/dhcpd.pid $INTERFACES
> >  KillSignal=SIGINT
> > -EnvironmentFile=/etc/default/dhcpd.conf
> > +EnvironmentFile=/etc/default/dhcpd
> >
> Maybe this should be:
> EnvironmentFile-=/etc/default/dhcpd

On the dropbear package, Gabe Evans said it may not be such a good idea
to do this EnvironmentFile thing.

Can we settle on a common decision ?

(From my PoV, using this EnvironmentFile looked good as it would be a
common mechanism between the systemd and Busybox/sysvinit cases to tune
the configuration of services. But Gabe seemed to disagree.)

Could systemd people in Buildroot decide what to do ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
