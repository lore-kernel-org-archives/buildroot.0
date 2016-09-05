From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 21:48:18 +0200
Subject: [Buildroot] [PATCH v2] package/binutils: Disable -Os for ARM
 cortex-M cpus
In-Reply-To: <1472998440-7543-1-git-send-email-romain.naour@gmail.com>
References: <1472998440-7543-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160905214818.5a7fd3fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Sep 2016 16:14:00 +0200, Romain Naour wrote:
> ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
> ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
> 2 bad relocscollect2: error: ld returned 1 exit status
> 
> Binutils build fine with -O1, -O2 or -O3.
> 
> Reported upstream:
> https://sourceware.org/bugzilla/show_bug.cgi?id=20552
> 
> Fixes:
> http://autobuild.buildroot.net/results/e72/e727e6e9cf361acc786acec192a88f5f5444a2f6
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> v2: fix condition (ThomasP)
>     report the issue upstream (ThomasP)
>     use O2 instead of O1 (Baruch)
> ---
>  package/binutils/binutils.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks. Of course, once we get the feedback from
Nicholas Walton, we might re-adjust this fix.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
