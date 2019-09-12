From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Sep 2019 19:09:38 +0200
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: extract current
 commit id, not master
In-Reply-To: <20190829072233.29988-1-thomas.petazzoni@bootlin.com>
References: <20190829072233.29988-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190912190938.33cdd445@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 29 Aug 2019 09:22:33 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> pkg-stats extracts the Buildroot commit id from which the package
> information was collected. However, when doing so, it always assumes
> we're using the master branch, by running "git log master".
> 
> But in fact, pkg-stats can be run from any branch/tag, so it makes a
> lot more sense to use "git log HEAD".
> 
> Cc: victor.huesca at bootlin.com
> Cc: Baruch Siach <baruch@tkos.co.il>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> As was discussed with Baruch and others, the page at
> http://autobuild.buildroot.net/stats/ now shows the results
> corresponding to the next branch when such a branch exists. However,
> the commit ID currently shown at the bottom of the page is incorrect,
> as it shows the one of the master branch at the time the page was
> generated.
> ---
>  support/scripts/pkg-stats | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
