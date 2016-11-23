From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:12:28 +0100
Subject: [Buildroot] [PATCH/next] makedevs: remove target package
In-Reply-To: <20161123141404.23389-1-arnout@mind.be>
References: <20161123141404.23389-1-arnout@mind.be>
Message-ID: <20161123231228.3ce8c863@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 15:14:04 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The makedevs package is a fork of the makedevs tool from busybox. It is
> part of the Buildroot infrastructure, not something that should be used
> on the target. It something like this is needed on the target, upstream
> busybox should be used. And if one of the Buildroot-specific features
> is needed, then that feature should be upstreamed to busybox.
> 
> Besides, there were already two things wrong with the target package:
> - it didn't take into account the overlap with busybox (no depends on
>   BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, no dependency on busybox);
> - it didn't take into account the libcap feature.
> 
> The target package was introduced more or less accidentally in 81cd9d45
> where the intention was to make it more similar to other packages.
> 
> So, kill it with fire.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> No biggy for me, I just noticed "Hey, this is weird...".
> ---
>  Config.in.legacy             |  7 +++++++
>  package/Config.in            |  1 -
>  package/makedevs/Config.in   |  5 -----
>  package/makedevs/makedevs.mk | 10 ----------
>  4 files changed, 7 insertions(+), 16 deletions(-)
>  delete mode 100644 package/makedevs/Config.in

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
