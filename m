From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Apr 2014 16:15:37 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-03
In-Reply-To: <20140404135530.GA26146@pc-eric>
References: <20140404063010.00CF61015BE@stock.ovh.net>
 <20140404135530.GA26146@pc-eric>
Message-ID: <20140404161537.6864a6f8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Fri, 4 Apr 2014 15:55:32 +0200, Eric Le Bihan wrote:

> On Fri, Apr 04, 2014 at 08:30:09AM +0200, Thomas Petazzoni wrote:
> 
> >        arm |                    systemd-212 | NOK |
> > http://autobuild.buildroot.net/results/3546c003a8fcbb36ef5ba29c00a96e473b927ecb/
> This failure is due to systemd now using the `--relative` option of
> `ln(1)` from GNU coreutils. This option was added to GNU coreutils
> 8.16, but some GNU/Linux distributions like Debian Wheezy or Ubuntu
> 12.04 ship 8.13. It looks like the Autobuild server runs one of
> these :-) . Our users may be in this situation and may not want to
> upgrade.

Indeed. That's one of the reason why the distributions we use on the
autobuilders are quite "old".

> I'll post a fix, but would Buildroot benefit from installing
> host-coreutils to avoid this kind of problem?

In general, we try to avoid building too many native dependencies. In
this specific case, if it's not really mandatory to build
host-coreutils and can be avoided using a moderately simple patch, we
prefer doing it this way. We don't want to rebuild the whole world of
native tools just to build systemd, if possible :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
