From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 21:13:09 +0100
Subject: [Buildroot] [PATCH] lldpd: new package
In-Reply-To: <CAHfJR7jVn99vE=6i+Z7D5w6wMPHYyOrYm+1aM-HTvMWq2PeG6w@mail.gmail.com>
References: <1453112084-16105-1-git-send-email-julien.floret@6wind.com>
 <20160118160450.0645b1db@free-electrons.com>
 <CAHfJR7jVn99vE=6i+Z7D5w6wMPHYyOrYm+1aM-HTvMWq2PeG6w@mail.gmail.com>
Message-ID: <20160118211309.057d1922@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julien,

On Mon, 18 Jan 2016 18:23:35 +0100, Julien Floret wrote:

> > BR2_PACKAGE_LIBEVENT has a "depends on !BR2_bfin" so you need to
> > duplicate this dependency in lldpd's Config.in file.
> 
> I don't see such dependency for libevent...
> Maybe you got mixed up with libev?

Absolutely. Blame the auto-completion, or my stupidity. libevent indeed
doesn't have any dependency, so what you did is perfectly fine.

> > Do we really need to allow the configuration of the user and group? We
> > generally don't do this for most package. Also, are _lldpd a good
> > choice? Why the leading underscore?
> >
> > If we're really talking about Unix user/group, then I would suggest to
> > just have an option to enable/disable privilege separation. And when
> > enabled, use lldpd as the user and group names.
> >
> > Also, shouldn't these user and group names be created by Buildroot in
> > the target root filesystem?
> >
> 
> _lldpd (with the leading underscore) is the default value of the user and
> group in lldpd, when privsep is enabled but user/group are not specified.
> But I agree this is not really needed.
> 
> In fact, for a first simple patch, I suggest to disable explicitely the
> privilege separation feature. We can then handle it properly in a later patch,
> with user and group names created in the target root filesystem.

Sounds good to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
