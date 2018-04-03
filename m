From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Apr 2018 12:14:30 +0200
Subject: [Buildroot] [PATCH] skeleton-init-systemd: Work around for RO
 root /var/lib not populating
In-Reply-To: <1522693433.10662.300.camel@impinj.com>
References: <20180227221628.8283-1-tpiepho@impinj.com>
 <20180331091022.GB25161@scaer>
 <1522693433.10662.300.camel@impinj.com>
Message-ID: <20180403101430.GA2923@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trent, All,

On 2018-04-02 18:23 +0000, Trent Piepho spake thusly:
> On Sat, 2018-03-31 at 11:10 +0200, Yann E. MORIN wrote:
> > On 2018-02-27 14:16 -0800, Trent Piepho spake thusly:
> > > When using a RO root with systemd, it is intended that /var/lib should be
> > > populated at boot time by tmpfiles system mirroring it from
> > > /usr/share/factory/var/lib.
> > > 
> > > However, this will only happen if /var/lib does not already exist at the
> > > time systemd-tmpfiles runs.  If it does exist, then tmpfiles will
> > > (silently) skip it and do nothing.
> > > 
> > > It turns out /var/lib will exist, because some part of systemd creates
> > > /var/lib/systemd/catalog on boot before tmpfiles runs.
> > > 
> > > The fix used here is to also create tmpfiles entries for the contents of
> > > /var/lib/* and /var/lib/systemd/*.  This way, when those directories
> > > already exist, the entire tree is not skipped and instead the
> > > not-yet-existing contents of /var/lib and /var/lib/systemd will be still
> > > be mirrored from the factory dir.
> > > 
> > > And if /var/lib/systemd, or a prefix of that, stops getting created and
> > > does not exist, it'll still mirror properly.
> > 
> > I believe that we fixed that in another way with that commit:
> > 
> >     6e5df928539 package/skeleton-systemd: invert factory logic
> > 
> > As thus, I've marked this patch as rejected.
> > 
> > If your use-case is still not fixed, please re-send it.
> 
> This patch is already in master, do you intend to revert it?

Ah, right. It was still dangling in Patchwork, and I had forgotten it got
applied.

No, we're not gonna revert it.

Sorry for the confusion.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
