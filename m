From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 08:31:10 +0200
Subject: [Buildroot] [PATCH 1/4] package: remove 'v' prefix from
 github-fetched packages
In-Reply-To: <35a7118e-cdf1-b29e-bceb-6c02ecef187e@mind.be>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612064209.23619-2-victor.huesca@bootlin.com>
 <35a7118e-cdf1-b29e-bceb-6c02ecef187e@mind.be>
Message-ID: <20190620083110.4986e5fa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Jun 2019 22:50:01 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Note: I double-checked: apparently, release-monitoring really *never* has a v
> in front of the version. There are a few other things though, e.g. DIRECTFB_

I'm not sure what you referring to regarding DIRECTFB_.

However, release-monitoring doesn't overall has something that enforces
keeping or not keeping a version prefix. It is the definition of each
package on release-monitoring that details how to extract the version,
typically stripping any prefix. Because this is the norm on
release-monitoring (stripping the prefix), any package definition that
does not comply with this should probably be fixed on
release-monitoring.

My point is that if there is a bogus package definition on
release-monitoring, we should not work it around in Buildroot, but fix
it on release-monitoring itself.

>  It would also be nice if we had some formal way of checking that new packages
> do this correctly. Actually, it would be good if pkg-stats could generate a
> report in a human-readable format so it could be used as part of the review flow
> to check if the mapping with release-monitoring is OK (plus all the other things
> pkg-stats evaluates).

Hm, yes, could be an interesting idea. Just a new pkg-stats option ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
