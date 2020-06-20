From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 22:55:16 +0200
Subject: [Buildroot] [PATCH v2 3/7] package/cups: bump to version 2.3.3
In-Reply-To: <CA+_SqVa8bHa4+FZ_NjE4Gw-V1SAGNrSE_AX=fzX=eH07R=wxnA@mail.gmail.com>
References: <20200619145719.2352019-1-angelo@amarulasolutions.com>
 <20200619145719.2352019-4-angelo@amarulasolutions.com>
 <20200620223540.3ccb6371@windsurf.home>
 <CA+_SqVa8bHa4+FZ_NjE4Gw-V1SAGNrSE_AX=fzX=eH07R=wxnA@mail.gmail.com>
Message-ID: <20200620225516.59ac83ee@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Jun 2020 22:48:55 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> It's really that important to split it? No problem to do that, but this
> package installs a service and the way it is doing in the new version is
> the one proposed in the patch. The old version could have been different,
> I've not checked btw.
> Anyway, having this is required to have the service correctly installed, so
> I don't think the patch should be splitted because the bump really requires
> it.

How is this related to the bump? Is it the version bump that adds the
service file? Or did it already exist before the bump?

> > > +define CUPS_INSTALL_INIT_SYSV
> > > +     @$(RM) $(TARGET_DIR)/etc/init.d/cups  
> >
> > This should also be done in the systemd case I believe, and should not
> > have the @.
> >  
> 
> Not for systemd, cause the package installs the .service file and not the
> systemv related ones.

OK, I see: when --enable-systemd is used to build cups, it doesn't
install its own init script. Makes sense. Thanks for explaining this
aspect!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
