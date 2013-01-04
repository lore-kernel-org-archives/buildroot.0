From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jan 2013 19:02:19 +0100
Subject: [Buildroot] [PATCH] gnuplot : new package
In-Reply-To: <50E714EF.4090102@relinux.de>
References: <1357311193-31887-1-git-send-email-viallard@syscom-instruments.com>
 <50E6F604.4000401@relinux.de> <20130104172643.72321640@skate>
 <50E714EF.4090102@relinux.de>
Message-ID: <20130104190219.2ff62738@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stephan Hoffmann,

On Fri, 04 Jan 2013 18:44:15 +0100, Stephan Hoffmann wrote:

> maybe my question was not clear enough. I just wanted to know if this
> option is really required.
> > Instead, we prefer having small packages that only support the features
> > that have been tested by the submitter, and that carefully disables all
> > the unsupported features. And then, as features are needed by other
> > people, they can submit additional patches to make those additional
> > features work.
> O.K., I didn't realize that even when configure finds out that no X11 is
> present --without-x is needed for this reason.
> 
> For the records: I made a quick test without X11 and it fails to compile
> without this option.

Generally, it's quite good to have explicit --disable-<feature> or
--without-<feature>. It avoids the configure script from
potentially mis-detecting host libraries. Like gnuplot configure script
could say "hey, your build machine has X, let's build X support".
Passing --without-x avoids that.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
