From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 23:09:41 +0200
Subject: [Buildroot] [PATCH] core: add rule to dump packages' build order
In-Reply-To: <20170402130338.12542-1-yann.morin.1998@free.fr>
References: <20170402130338.12542-1-yann.morin.1998@free.fr>
Message-ID: <20170413230941.0a8cf40f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Apr 2017 15:03:38 +0200, Yann E. MORIN wrote:
> When debugging hidden dependencies, the build order is very important.
> Most notably, it is interesting to identify potential culprits.
> 
> Add a new top-level rule, show-biuld-order, that dumps all the packages
> in the order they would get built.
> 
> Note that there are a few differences with show-targets:
> 
>   - more packages are reported, becasue show-targets does not report
>     host packages that have no prompt;
> 
>   - the output is line-based, because we're using $(info $(1)); getting
>     a single output line like show-targets would require we use an
>     actual command, like printf '%s ' $(1); but that takes a lot of
>     time, while $(info $(1)) is almost instantaneous (the time to parse
>     the Makefiles);
> 
>   - rootfs targets are not reported.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Makefile               | 2 ++
>  package/pkg-generic.mk | 3 +++
>  2 files changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
