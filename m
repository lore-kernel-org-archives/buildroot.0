From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Apr 2019 14:57:19 +0200
Subject: [Buildroot] [PATCH] package/most: disable parallel build
In-Reply-To: <20190414100026.17122-1-arnout@mind.be>
References: <20190414100026.17122-1-arnout@mind.be>
Message-ID: <20190414145719.58ea47ed@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Apr 2019 12:00:26 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> The hand-written Makefile is not parallel-build safe: the objs directory
> is created in a separate rule, but the rules that create files in that
> directory don't depend on it.
> 
> Although this relatively simple to fix, upstream clearly doesn't care
> about parallel builds so it is likely to break again in the future.
> Since most consists of just a dozen source files, just disable parallel
> build.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c7540203a8eadad3f324f0d7e7fe66a526d4a2e9
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Sven Oliver Moll <buildroot@svol.li>
> ---
>  package/most/most.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
