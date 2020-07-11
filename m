From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 15:14:04 +0200
Subject: [Buildroot] [PATCH 1/3] package/systemd: add option to enable
 SysV and utmp compatibility
In-Reply-To: <CADYdroMeuavdAXpZVy40kEiSoeQfqnTav9UqzR+rpSnEVtkZtA@mail.gmail.com>
References: <20200710234150.185609-1-nolange79@gmail.com>
 <20200711125654.4fcb48d9@windsurf.home>
 <CADYdroMeuavdAXpZVy40kEiSoeQfqnTav9UqzR+rpSnEVtkZtA@mail.gmail.com>
Message-ID: <20200711151404.73f486b6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jul 2020 13:25:08 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> > > +ifeq ($(BR2_PACKAGE_SYSTEMD_SYSV),y)
> > > +SYSTEMD_CONF_OPTS += -Dsysvinit-path=/etc/init.d  
> > -Dsysvrcnd-path=/etc/rc.d
> >
> > We don't have any /etc/rc.d directory in Buildroot, and when systemd is
> > selected as the init system, we don't install init scripts in
> > /etc/init.d. So I'm wondering what is the use case for this option ?
> >  
> 
> Removing *support for unit scripts*. those scripts, as you said, don't
> exist.

Yes, but your patch also keeps support for init scripts enabled when
BR2_PACKAGE_SYSTEMD_SYSV=y, and I don't understand what is the use case.

When systemd is enabled, there will be nothing in /etc/init.d, because
Buildroot only executes the <pkg>_INIT_SYSV commands (that install init
scripts) when the init system is Busybox or SysVinit.

Or do you want to support use cases where some users may install their
own init scripts in /etc/init.d, but are using systemd ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
