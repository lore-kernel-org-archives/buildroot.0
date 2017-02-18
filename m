From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 18 Feb 2017 22:26:08 +0200
Subject: [Buildroot] [PATCH] util-linux: build schedutils without
 enabling basic binaries
In-Reply-To: <1487448401-23830-1-git-send-email-casantos@datacom.ind.br>
References: <bug-9656-163-MVhQ2W5IfX@https.bugs.busybox.net/>
 <1487448401-23830-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170218202608.xzsp4m3oy5uc2rii@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On Sat, Feb 18, 2017 at 06:06:41PM -0200, Carlos Santos wrote:
> Pull a patch already sent upstream tp fix AM_CONDITIONAL parameters that
> conditioned the build of ionice, taskset an chrt to the wrong variable.
> 
> Fixes:
>   https://bugs.busybox.net/show_bug.cgi?id=9656
>   https://github.com/karelzak/util-linux/issues/415
> 
> Reported-by: Aaron Holtzman <aholtzma@gmail.com>
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  ...build-when-configured-with-disable-all-pr.patch | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/util-linux/0003-schedutils-build-when-configured-with-disable-all-pr.patch
> 
> diff --git a/package/util-linux/0003-schedutils-build-when-configured-with-disable-all-pr.patch b/package/util-linux/0003-schedutils-build-when-configured-with-disable-all-pr.patch
> new file mode 100644
> index 0000000..812927e
> --- /dev/null
> +++ b/package/util-linux/0003-schedutils-build-when-configured-with-disable-all-pr.patch
> @@ -0,0 +1,52 @@
> +From e1578c3d32cc9f817f19729b5eee21e49b639185 Mon Sep 17 00:00:00 2001
> +From: Carlos Santos <casantos@datacom.ind.br>
> +Date: Sat, 18 Feb 2017 17:23:37 -0200
> +Subject: [PATCH] schedutils: build when configured with --disable-all-programs
> +
> +Fix AM_CONDITIONAL parameters that conditioned ionice, taskset an chrt
> +to the values of build_{ionice,taskset,chrt} respectively, instead of
> +build_schedutils.
> +
> +Fixes:
> +  https://bugs.busybox.net/show_bug.cgi?id=9656
> +  https://github.com/karelzak/util-linux/issues/415
> +
> +Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> +---
> + configure.ac | 6 +++---

Please update the _AUTORECONF comment in util-linux.mk.

baruch


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
