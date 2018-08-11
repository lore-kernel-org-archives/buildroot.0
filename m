From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 10 Aug 2018 19:20:47 -0500
Subject: [Buildroot] Analysis of build results for 2018-08-09
In-Reply-To: <20180811001555.0b515e22@windsurf>
References: <20180810060017.0EEFE20719@mail.bootlin.com>
 <20180811001555.0b515e22@windsurf>
Message-ID: <CANQCQpauBUYBkxNiw7CtHNOO3pOkxF0PGnjrP_HagUJ+N2q=hQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Aug 10, 2018 at 5:16 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri, 10 Aug 2018 08:00:17 +0200 (CEST), Thomas Petazzoni wrote:
>
> > Build statistics for 2018-08-09
> > ===============================
> >
> >       branch |  OK | NOK | TIM | TOT |
> >    2018.02.x |  10 |   1 |   0 |  11 |
> >    2018.05.x |  14 |   1 |   0 |  15 |
> >       master | 123 |  10 |   3 | 136 |
>
> This we've got only 10 failures on master, let's have a look at them.
> >      aarch64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/66c03506e10071ec44ca509304595f4f5150e4d9 |
> >       mipsel |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/2b41afe7841feba626fc29c9474e82d9934e6173 |
>
> Due to the use of atomic built-ins, not available in old compilers. I
> would suggest to make all packages that depend on host-libselinux to
> depend on the appropriate host gcc version.

Hollis has sent a patch suggestion to keep libselinux compatible with
older gcc.  Is there a preference on carrying the patch vs using a
host gcc version detect ?  I didn't realize we had a way to depend on
host gcc version.  I'll take a look at that but let me know which way
is preferred.

Matt
