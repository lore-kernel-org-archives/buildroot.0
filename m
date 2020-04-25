From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 15:08:47 +0200
Subject: [Buildroot] [PATCH 4/8] core/show-info: report the package
 build directory
In-Reply-To: <0616032f9ff5678e32603fb1d380aa52fa4a0cf8.1586592741.git.yann.morin.1998@free.fr>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <0616032f9ff5678e32603fb1d380aa52fa4a0cf8.1586592741.git.yann.morin.1998@free.fr>
Message-ID: <20200425150847.29a29b58@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 10:12:29 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Some people want to be able to inspect the current state of the build,
> and report information about it, like:
>   - report the number of packages already built out of the total,
>   - list the packages being actually built (e.g. for TLPB)
>   - etc...
> 
> However, the location where a package is built is inherently an internal
> detail, so expose that to the user in the output of show-info. We only
> expose the location relative to the base directory (basically, either
> output/ or the user-suppiled $(O)), so that show-info does not contain
> local information (the output of show-info can be shared).
> 
> Interested parties will be able to poke in there to identify the stamp
> files and deduce the package's state.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Vadim Kochan <vadim4j@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: eeppeliteloop at gmail.com
> ---
>  package/pkg-utils.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
