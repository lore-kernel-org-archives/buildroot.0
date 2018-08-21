From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 12:14:58 +0200
Subject: [Buildroot] [PATCH] support/scripts/check-uniq-files: run with
 Python 2.6
In-Reply-To: <33f2f5c9d9cdbb320e52.1532112144@cveaol6qa08.wv.mentorg.com>
References: <33f2f5c9d9cdbb320e52.1532112144@cveaol6qa08.wv.mentorg.com>
Message-ID: <20180821121458.69683413@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Hollis,

On Fri, 20 Jul 2018 11:42:24 -0700, Hollis Blanchard wrote:
> Support Python 2.6 by switching from argparse (introduced in Python 2.7) to
> optparse. Python 2.6 is the version of Python in RHEL6.5.
> 
> optparse was deprecated in 2.7, but is still usable, so the script now runs in
> more environments.
> 
> Backports of argparse to 2.6 are available, but can be impractical to require
> on all hosts (e.g. hosts belonging to end-users who are unfamiliar with Python
> package management, corporate-managed build hosts where installing packages is
> difficult or impossible).
> 
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>

We had a bit of discussion about this on IRC today, and both Yann's
feeling and mine is that optparse is long deprecated (since Python
2.7), so it is really annoying to keep using it just for the sake of
Python 2.6 users.

Python 2.6 users can simply install the argparse module as a third
party module, and use Buildroot. I think it's a reasonable trade-off
between using modern APIs and keeping compatibility with older build
systems.

So I've marked this patch as Rejected in patchwork. Sorry :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
