From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 12:24:15 +0200
Subject: [Buildroot] [PATCH] package/connman: disable for musl toolchains
In-Reply-To: <1471556901-28691-1-git-send-email-romain.naour@gmail.com>
References: <1471556901-28691-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160819122415.6ff5899e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 23:48:21 +0200, Romain Naour wrote:
> Connman doesn't build with musl toolchains due to several "classic"
> musl issues [1] (mixes userspace and kernel headers, missing header)
> 
> Upstream received some fixes [2] but they are not yet merged.
> 
> Also, gresolv.c use res_ninit() function which is not available
> with musl. A fix from Alpinelinux is available [3] but it require
> some invasive changes.
> 
> Disable connman for musl toolchains for now, and wait for upstream
> fixes.
> 
> [1] http://wiki.musl-libc.org/wiki/FAQ
> [2] https://lists.01.org/pipermail/connman/2016-August/000880.html
>     https://lists.01.org/pipermail/connman/2016-August/000881.html
>     https://lists.01.org/pipermail/connman/2016-August/000882.html
> [3] https://github.com/openembedded/openembedded-core/commit/d08f9d7145ba14ce9fbf320719c05560be69212f
> 
> Fixes:
> http://autobuild.buildroot.net/results/e88/e88b4dbd4b79fc983b8f7d33da3287966854f8ca
> [...]
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/connman-gtk/Config.in | 6 ++++--
>  package/connman/Config.in     | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)

Applied to master, thanks. One thing that worries me a bit is one we
will remember to re-enable it for musl once musl support has landed
upstream. But oh well, this can probably wait until someone actually
needs connman on musl.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
