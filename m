From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Mar 2018 17:53:15 +0100
Subject: [Buildroot] [PATCH 2/2] core/instrumentation: shave minutes off
 the build time
In-Reply-To: <1521477052.10662.140.camel@impinj.com> (Trent Piepho's message
 of "Mon, 19 Mar 2018 16:30:52 +0000")
References: <cover.1521146096.git.yann.morin.1998@free.fr>
 <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
 <1521477052.10662.140.camel@impinj.com>
Message-ID: <87sh8wknwk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

Hi,

 > After fixing s/L/l/, here are the timings for a 15 minute build:

 > configure                510.29
 > build                    166.12
 > extract                   45.53
 > other                     43.88
 > hostinstall               35.43
 > check_host_rpath          33.37
 > check_bin_arch            28.30
 > targetinstall             23.37
 > stageinstall              15.97
 > step_pkg_size              9.49

 > Without ccache, the build step would be somewhat longer.

Looks good! (well, the configure step time is horrible).

 >> Now, we also change the way we handle symlinks. Previously, we would
 >> hash the file pointed to by the symlink. Now, we only look at the mtime
 >> of the symlink itself, which still detects modifications.

 > This patch also fixes a problem the previous system had w.r.t. broken
 > symlinks.  They did not show up as owned by any packages.  Now they are
 > owned by the package that creates the link.  It also means a package
 > that replaced a file which was linked to does not also appear,
 > incorrectly, to replace all the links as well.

Ahh, ok - Good.

-- 
Bye, Peter Korsgaard
