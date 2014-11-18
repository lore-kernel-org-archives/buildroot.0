From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 14:04:35 +0100
Subject: [Buildroot] [PATCH V2 2/4] package/squid: enable ICAP server
 support in squid
In-Reply-To: <546B3FC5.1020008@oliseo.fr>
References: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1415808993-2394-3-git-send-email-guillaume.gardet@oliseo.fr>
 <20141116223804.04fc546b@free-electrons.com>
 <546B3FC5.1020008@oliseo.fr>
Message-ID: <20141118140435.0f58ffba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Nov 2014 13:47:01 +0100, Guillaume GARDET - Olis?o wrote:

> >   2/ Creating a directory in /var/log at build time doesn't make sense,
> >      because /var/log in Buildroot is a symbolic link to /tmp, and /tmp
> >      is mounted as a tmpfs so that the root filesystem can remain
> >      read-only. Therefore, the proper solution is to create this
> >      directory at boot time. We normally do this in the startup script
> >      provided by the package, but squid doesn't provide one.
> 
> What would be the solution then?

I guess the best solution is probably to add an init script to start
Squid at boot time.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
