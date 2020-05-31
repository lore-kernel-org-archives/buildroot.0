From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 May 2020 23:07:47 +0200
Subject: [Buildroot] [PATCH] package/linux-tools/perf: bear the kernel
 options munging
In-Reply-To: <20200501162216.9048-1-yann.morin.1998@free.fr>
References: <20200501162216.9048-1-yann.morin.1998@free.fr>
Message-ID: <20200531230747.74bbb26d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  1 May 2020 18:22:16 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> perf by itself is not a standalone package; instead, it is part of a
> bigger package, linux-tools.
> 
> Even though perf is the only one to need kernel .config fixups, we still
> do it in a generic way, as it blends nicely in the existing variables,
> which all use a loop over all the tools.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> ---
> Changes v1 -> v2:
>   - really call PERF_LINUX_CONFIG_FIXUPS  (Thomas)
>   - expand commit log accordingly
> ---
>  linux/linux.mk                            | 2 --
>  package/linux-tools/linux-tool-perf.mk.in | 4 ++++
>  package/linux-tools/linux-tools.mk        | 7 +++++++
>  3 files changed, 11 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
