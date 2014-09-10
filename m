From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Sep 2014 15:19:10 +0200
Subject: [Buildroot] [PATCH] arc: Fix warning if atomics are selected
In-Reply-To: <1410353187-16974-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <1410353187-16974-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <20140910151910.2e29889e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Wed, 10 Sep 2014 16:46:27 +0400, Anton Kolesov wrote:

> If atomic instructions were selected for ARC, there was a warning, like:
> "(BR2_ARC_ATOMIC_EXT) selects BR2_ARCH_HAS_ATOMICS which has unmet direct
> dependencies". This patch removes the reason of this warning by adding a
> respective configuration entry.
> 
> Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
> ---
>  arch/Config.in.arc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index 8a7f290..d2ccf09 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -1,3 +1,6 @@
> +config  BR2_ARCH_HAS_ATOMICS
> +	bool

No. This option is already defined in arch/Config.in. There's no point
in redefining it anywhere else.

Can you give me a .config that shows the warning you had?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
