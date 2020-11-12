From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 12 Nov 2020 20:04:55 +0100
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BPATCH_2/2=5D_package/perf=3A_if_zs?=
 =?iso-8859-1?q?td_is_enabled=2C_depend_on_it?=
In-Reply-To: <20201111160008.2010373-2-sir.venceslas@gmail.com>
References: <20201111160008.2010373-1-sir.venceslas@gmail.com>
 <20201111160008.2010373-2-sir.venceslas@gmail.com>
Message-ID: <563b42d1-ec08-41be-bf94-29853e7e2cd3@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On st?eda 11. listopadu 2020 17:00:08 CET, V?clav Kubern?t wrote:
> Enables the "-z" flag.
>
> Signed-off-by: V?clav Kubern?t <sir.venceslas@gmail.com>

This makes sense when you have limited space in your tmpfs which happens to 
be the only writable space.

Reviewed-by: Jan Kundr?t <jan.kundrat@cesnet.cz>

(disclaimer: I'm Vaclav's co-worker)

> ---
>  package/linux-tools/linux-tool-perf.mk.in | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/linux-tools/linux-tool-perf.mk.in 
> b/package/linux-tools/linux-tool-perf.mk.in
> index e54f019888..efa747cf8d 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -69,6 +69,10 @@ else
>  PERF_MAKE_FLAGS += NO_LIBAUDIT=1
>  endif
>  
> +ifeq ($(BR2_PACKAGE_ZSTD),y)
> +PERF_DEPENDENCIES += zstd
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
>  PERF_DEPENDENCIES += libunwind
>  else
