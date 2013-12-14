From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Dec 2013 18:32:32 +0100
Subject: [Buildroot] [PATCH] Rename netkitbase and netkittelnet
In-Reply-To: <CACjG4B+HvDwZ-SQ8QE0oSH2zd7tZF73=T=4ayYHqg-GW4GMDKg@mail.gmail.com>
References: <1382604917-7742-1-git-send-email-arnaud.aujon@gmail.com>
 <20131024153442.56a9157d@skate>
 <CACjG4BKEx1pGoWhDhYhV3ib+gz27rUZpMUwO8VhkOYh0+weROw@mail.gmail.com>
 <CACjG4BK7us2HXea_yR4wHy=CHTB8uaUro9MKjXY_0dw7DkfMUQ@mail.gmail.com>
 <20131203100121.1c785df4@skate>
 <CACjG4B+HvDwZ-SQ8QE0oSH2zd7tZF73=T=4ayYHqg-GW4GMDKg@mail.gmail.com>
Message-ID: <20131214183232.04cea60b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear arnaud aujon,

On Fri, 13 Dec 2013 18:51:45 +0100, arnaud aujon wrote:
> Ok, so netkitbase provides 2 binaries : inetd which can be replaced by
> xinetd and ping that is provided by busybox (is there another package
> providing it ?)

There is iputils, but we don't have a package for it in Buildroot (I
have one in a private branch, just haven't had the time to clean it up
to upstream it). It provides, amongst others, the full-featured ping
implementation.

> For netkittelnet, again busybox provides a telnet client.
> So Config.in.legacy should be updated by something like that :
> 
> config BR2_PACKAGE_NETKITBASE
>     bool "netkitbase has been removed"
>     select BR2_LEGACY
>     help
>       The 'netkitbase' package has been removed, since it
>       has been deprecated since 2012.11. This package provided  'inetd'
> which
>       is replaced by 'xinet' and 'ping' which is replaced by 'busybox' or
> 'fping'.
> 
> config BR2_PACKAGE_NETKITTELNET
>     bool "netkittelnet has been removed"
>     select BR2_LEGACY
>     help
>       The 'netkittelnet' package has been removed, since it
>       has been deprecated since 2012.11. 'busybox' provides a telnet client
> and
>       should be used instead.
> 
> But should we automatically select a replacement or let the user decide
> what to do ?

Normally, we select things automatically, when there is a direct match.
In this case, I believe there isn't really a direct complete match, so
I would personally suggest to not select something automatically.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
