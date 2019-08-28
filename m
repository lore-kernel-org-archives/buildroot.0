From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Aug 2019 14:43:52 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-stats: query release-monitoring.org
 with upstream name
In-Reply-To: <20190828070251.22886-1-francois.perrad@gadz.org>
References: <20190828070251.22886-1-francois.perrad@gadz.org>
Message-ID: <20190828144352.239a231d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Victor Huesca in Cc.

On Wed, 28 Aug 2019 09:02:50 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> By default, this upstream name is our BR name.
> But with perl-package infrastructure, the variables *_DISTNAME
> give the CPAN name which is known by release-monitoring.org
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Thanks for implementing this. It matches what we discussed. The only
possible issue that I can see is if a package defines FOO_DISTNAME for
some internal reason, but is not a perl-package. Then we will pick up
whatever DISTNAME contains.

Perhaps we should standardize on FOO_NAME_UPSTREAM for all package
infrastructures including perl-package, and make it a "reserved"
variable name, so that it is forbidden to use it for anything else ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
