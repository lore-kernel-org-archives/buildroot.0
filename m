From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Mar 2016 21:52:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: fix crash due to
 iptables 1.6.0 update
In-Reply-To: <1457112113-7709-1-git-send-email-martin@barkynet.com>
References: <1457112113-7709-1-git-send-email-martin@barkynet.com>
Message-ID: <20160304215218.324b2fbd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin,

On Fri,  4 Mar 2016 17:21:53 +0000, Martin Bark wrote:
> iptables was updated to version 1.6.0 in commit
> https://git.busybox.net/buildroot/commit/?id=35dc775 however, connman
> 1.31 crashes when iptables 1.6.0 is used.
> 
> This issues has already been fixed upstream but is not currently available
> in a release.  To fix connman include the upstream patch. See
> http://git.kernel.org/cgit/network/connman/connman.git/commit/?id=acea08a
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

Thanks for this patch. One comment below.

> diff --git a/package/connman/0002-iptables-Add-missing-function-item-of-xtables-to-match-iptables-1.6.patch b/package/connman/0002-iptables-Add-missing-function-item-of-xtables-to-match-iptables-1.6.patch
> new file mode 100644
> index 0000000..30131e6
> --- /dev/null
> +++ b/package/connman/0002-iptables-Add-missing-function-item-of-xtables-to-match-iptables-1.6.patch
> @@ -0,0 +1,36 @@
> +From acea08a0e4234a4c1a87bedc087c73ff36de0c7b Mon Sep 17 00:00:00 2001
> +From: Wu Zheng <wu.zheng@intel.com>
> +Date: Thu, 28 Jan 2016 18:04:17 +0800
> +Subject: iptables: Add missing function item of xtables to match iptables 1.6
> +
> +The struct of xtables_globals has been modified in iptables 1.6.
> +If connman runs with iptables 1.6, it can crash.
> +
> +Program received signal SIGSEGV, Segmentation fault.
> +0x00000000 in ?? ()
> +0xb7dea89c in xtables_find_target () from /usr/lib/libxtables.so.11
> +0xb7deac1c in ?? () from /usr/lib/libxtables.so.11
> +0xb7dea793 in xtables_find_target () from /usr/lib/libxtables.so.11
> +
> +The the missing function item of xtables is added to xtables_globals.

We normally require people who integrate patches in Buildroot to
Signed-off-by on the patches they have integrated. I.e, we would need
your Signed-off-by here.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
