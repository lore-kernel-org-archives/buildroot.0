From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jan 2013 17:26:43 +0100
Subject: [Buildroot] [PATCH] gnuplot : new package
In-Reply-To: <50E6F604.4000401@relinux.de>
References: <1357311193-31887-1-git-send-email-viallard@syscom-instruments.com>
 <50E6F604.4000401@relinux.de>
Message-ID: <20130104172643.72321640@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stephan Hoffmann,

On Fri, 04 Jan 2013 16:32:20 +0100, Stephan Hoffmann wrote:

> > +GNUPLOT_CONF_OPT = --without-x \
> is there a special reason for this? Why not build with x, when X11 is
> configured in buildroot?

I guess because Anthony didn't need X support. It is not because a
given software component can potentially support feature Y or Z that we
require the package submitter to support all those features Y or Z. It
would put way too much load on the initial package submitter.

Instead, we prefer having small packages that only support the features
that have been tested by the submitter, and that carefully disables all
the unsupported features. And then, as features are needed by other
people, they can submit additional patches to make those additional
features work.

Anthony: a gnuplot patch without the X support is perfectly acceptable.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
