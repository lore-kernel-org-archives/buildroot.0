From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 15:24:30 +0200
Subject: [Buildroot] [PATCH] uclibc: build uclibc unstripped by default
In-Reply-To: <1413119739-4977-1-git-send-email-abrodkin@synopsys.com>
References: <1413119739-4977-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20141012152430.130a77a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Sun, 12 Oct 2014 15:15:39 +0200, Alexey Brodkin wrote:
> uClibc could be build stripped (implemented as link-time option in uClibc).
> This could be useful for those who build root fs manually.
> 
> In Buildroot there's it's own strip stage wich strips most of shared libs
> in "target" folder (well except kernel modules known to not work properly being
> stripped and libpthread required to be non-stripped for correct debugging with
> gdb of multi-threaded apps).
> 
> So there're few problems with current implementation:
>  1. uClibc is being stripped 2 times (first on its build stage, second on
>     global Buildroot strip stage)
>  2. uClibc libs in "staging" folder are also always stripped except if
>     "no strip" (BR2_STRIP_none) is explicitly is selected in Buildroot config.
>     That makes it possible to remote debug uClibc libs on target only if target
>     rootfs was not stripped (which might not be possible due to huge libs
>     like Qt)
> 
> This patch disables embedded strip in uClibc (still users may modify uClibc
> config and explicitly set "DOSTRIP=yes" if really needed).
> 
> Interesting that DOSTRIP was not only selected in uClibc config but also was
> force set with Buildroot on uClibc configuration step with UCLIBC_STRIP_CONFIG.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks, it's good to see this fixed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
