From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Fri, 13 Dec 2013 18:51:45 +0100
Subject: [Buildroot] [PATCH] Rename netkitbase and netkittelnet
In-Reply-To: <20131203100121.1c785df4@skate>
References: <1382604917-7742-1-git-send-email-arnaud.aujon@gmail.com>
 <20131024153442.56a9157d@skate>
 <CACjG4BKEx1pGoWhDhYhV3ib+gz27rUZpMUwO8VhkOYh0+weROw@mail.gmail.com>
 <CACjG4BK7us2HXea_yR4wHy=CHTB8uaUro9MKjXY_0dw7DkfMUQ@mail.gmail.com>
 <20131203100121.1c785df4@skate>
Message-ID: <CACjG4B+HvDwZ-SQ8QE0oSH2zd7tZF73=T=4ayYHqg-GW4GMDKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, so netkitbase provides 2 binaries : inetd which can be replaced by
xinetd and ping that is provided by busybox (is there another package
providing it ?)
For netkittelnet, again busybox provides a telnet client.
So Config.in.legacy should be updated by something like that :

config BR2_PACKAGE_NETKITBASE
    bool "netkitbase has been removed"
    select BR2_LEGACY
    help
      The 'netkitbase' package has been removed, since it
      has been deprecated since 2012.11. This package provided  'inetd'
which
      is replaced by 'xinet' and 'ping' which is replaced by 'busybox' or
'fping'.

config BR2_PACKAGE_NETKITTELNET
    bool "netkittelnet has been removed"
    select BR2_LEGACY
    help
      The 'netkittelnet' package has been removed, since it
      has been deprecated since 2012.11. 'busybox' provides a telnet client
and
      should be used instead.

But should we automatically select a replacement or let the user decide
what to do ?




2013/12/3 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Dear arnaud aujon,
>
> On Tue, 3 Dec 2013 09:47:08 +0100, arnaud aujon wrote:
> > Hi,
> >
> > 2013/10/24 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > >
> > >> Both of these packages have been marked deprecated since almost a year
> > >> (November 2013). See 442765fe3d8767956eb26d4bcbaa62ce1e1782ca and
> > >> 5a457ff6cc3129af97f2fdcaa5f88bd5ff02b500.
> > >>
> > >> So many it's simpler better to remove them completely?
> > >
> > >
> > Now that 2013.11 is out, what about removing these packages ?
> > Peter, what do you think ?
>
> Both of these packages are marked as deprecated since 2012.11, so I
> think we can safely remove them. In the Config.in.legacy entries that
> will replace the two Config.in options of those packages, it would be
> important to mention what are the replacement for those packages.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131213/6e2a3f48/attachment-0001.html>
