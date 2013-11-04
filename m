From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Nov 2013 20:35:20 +0100
Subject: [Buildroot] [PATCH v2] netperf: enable demo mode.
In-Reply-To: <1383531561-5550-1-git-send-email-keguang.zhang@gmail.com>
References: <1383531561-5550-1-git-send-email-keguang.zhang@gmail.com>
Message-ID: <5277F6F8.4030500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/11/13 03:19, Kelvin Cheung wrote:
> Enable demo mode for netperf to activates a global "-D" <interval> option.
> This option will display interim results at least every time interval.
>
> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  On x86_64 with glibc, this makes a difference of 3K (<2%) on the 
netperf and netserver executables. So I think it's OK to enable it 
unconditionally.

  Regards,
  Arnout

> ---
>   package/netperf/netperf.mk |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
> index 2bd11f3..455f27e 100644
> --- a/package/netperf/netperf.mk
> +++ b/package/netperf/netperf.mk
> @@ -7,6 +7,7 @@
>   NETPERF_VERSION = 2.6.0
>   NETPERF_SITE = ftp://ftp.netperf.org/netperf
>   NETPERF_CONF_ENV = ac_cv_func_setpgrp_void=set
> +NETPERF_CONF_OPT = --enable-demo=yes
>   NETPERF_LICENSE = netperf license
>   NETPERF_LICENSE_FILES = COPYING
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
