From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Sep 2014 09:41:45 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <540BD5BE.7020801@gmail.com>
References: <20140906063010.93F60101336@stock.ovh.net>
 <20140906203640.09c6d8be@free-electrons.com>
 <540BD5BE.7020801@gmail.com>
Message-ID: <20140907094145.1da8f175@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathaniel Roach,

On Sun, 07 Sep 2014 11:49:18 +0800, Nathaniel Roach wrote:

> I don't have it installed purely because this chroot is *just* for the
> autobuilder.
> 
> I'm leaning towards host-ncurses because it seems to be the cleaner way
> to do it, but assuming that the host has it installed is probably a
> fairly safe assumption.
> 
> Only issue is that some people might have a build server they upload the
> config to, but even then installing ncurses-dev shouldn't really be a
> big deal.

See the discussion going with Peter, and the decision we need to take
on this.

> The offending tarballs have been moved out. I've checked them with file,
> gzip and even opened them in file-roller and I can't see an issue. They
> are up at http://nroach44.info/misc/br/ if you want to take a look.

Ok, strange.

> I have a suspicion that they may have been redownloaded, but I'm not
> sure if buildroot does wget -c or similar size checking logic by default.

We don't do size checking nor 'wget -c'. However, the autobuild-run
script deletes 5 random tarballs at the end of each build, in order to
make sure we regularly re-download the upstream tarballs. This is a way
to detect no longer available upstream sites, tarballs that have
changed and other similar things. Maybe you were lucky and the two
offending tarballs had been deleted and re-downloaded?

I guess we'll see over time what happens. Thanks for checking!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
