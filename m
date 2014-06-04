From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 4 Jun 2014 11:39:49 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bump to v213
In-Reply-To: <20140604085129.70751c98@free-electrons.com>
References: <1401833204-32300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140604085129.70751c98@free-electrons.com>
Message-ID: <20140604093947.GA2414@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Wed, Jun 04, 2014 at 08:51:29AM +0200, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Wed,  4 Jun 2014 00:06:44 +0200, Eric Le Bihan wrote:
> > This patch bumps systemd to v213. This new version introduces
> > systemd-timesyncd, a SNTP daemon, which requires a new user
> > systemd-timesync to be created.
> >
> > It also refreshes the patch for reverting the use of --relative option
> > when calling `ln`. Since this version, the configure script checks if
> > `ln` supports the --relative option and fails if it does not. Instead of
> > reverting commit 446883528524429283626208928b51f49f28f810, which affects
> > configure.ac, the configure script is directly patched to remove this
> > check (hence avoiding an autoreconf).
>
> The patch is nonetheless changing a Makefile.am, so it should need an
> autoreconf anyway, no?

Though a Makefile.am is changed, an autoreconf is not needed, as the configure
script features "AM_MAINTAINER_MODE([enable])", so make will rebuild the
associated Makefile.in by calling automake.

Excerpt from the build log:

[...]
make[1]: entering directory ?/home/eric/build/demo-systemd/x86/build/systemd-213 ?
 cd . && /bin/sh /home/eric/build/demo-systemd/x86/build/systemd-213/build-aux/missing automake-1.14 --foreign Makefile
 cd . && /bin/sh ./config.status Makefile depfiles
[...]

[1] https://www.gnu.org/software/automake/manual/html_node/maintainer_002dmode.html
[2] http://blogs.gnome.org/desrt/2011/09/08/am_maintainer_mode-is-not-cool/

Best regards,
ELB
