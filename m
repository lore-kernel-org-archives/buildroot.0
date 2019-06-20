From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jun 2019 23:27:43 +0200
Subject: [Buildroot] [PATCH 4/4] package: remove non-conventional
 prefix/suffix from tarball-fetched packages
In-Reply-To: <20190612064209.23619-5-victor.huesca@bootlin.com>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612064209.23619-5-victor.huesca@bootlin.com>
Message-ID: <bd1eaae7-ec31-18c3-afd8-7674a2c375aa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/06/2019 08:42, Victor Huesca wrote:
> While most projects name their tarball <name>-<version>, where
> <version> is just the version number, some other projects add some
> prefix and/or suffix to their version number.
> 
> In Buildroot, we currently encode the full version (with its
> prefix/suffix) in the <pkg>_VERSION variable. However, that doesn't
> work well to match version numbers with the release-monitoring.org
> website, which filters such prefixes/suffixes.
> 
> This commit therefore removes the prefix/suffix from tarball-fetched
> packages (and the special spidev case, which downloads just one
> file). The name of the files being downloaded does not change.

 spidev is not actually touched by this patch. So I removed that and applied to
master, thanks.

 Regards,
 Arnout

> 
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
