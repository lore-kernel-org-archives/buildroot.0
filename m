From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 18:17:02 +0100
Subject: [Buildroot] [PATCH 1/2] pkg-stats: query release-monitoring.org
 with upstream name
In-Reply-To: <20190828070251.22886-1-francois.perrad@gadz.org>
References: <20190828070251.22886-1-francois.perrad@gadz.org>
Message-ID: <20200205181702.4abbbd83@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Aug 2019 09:02:50 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> By default, this upstream name is our BR name.
> But with perl-package infrastructure, the variables *_DISTNAME
> give the CPAN name which is known by release-monitoring.org
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Since we have this information already in Buildroot, it makes sense to
use it. However, the search on release-monitoring.org is done in two
steps:

 - Using the Buildroot distribution in release-monitoring and its
   mapping concept. In this case, we really want to use the Buildroot
   package name unchanged (which is not what your patch does)

 - Then, if no result is found through the Buildroot distribution
   above, we search in the entire namespace. Here, we should search
   with _DISTNAME when available. We could also improve the logic to
   strip python- and lua- in the front of packages, to help the guess
   to work.

Would you be willing to work on this ? It's not too far from the patch
you have already implemented here.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
