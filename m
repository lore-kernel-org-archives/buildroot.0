From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 1 Dec 2014 20:13:54 +0200
Subject: [Buildroot] [PATCH] package/bdwgc: only enable on supported
 architectures
In-Reply-To: <1417457426-2621-1-git-send-email-yann.morin.1998@free.fr>
References: <1417457426-2621-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141201181354.GR2204@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Dec 01, 2014 at 07:10:26PM +0100, Yann E. MORIN wrote:
> diff --git a/package/bdwgc/Config.in b/package/bdwgc/Config.in
> index 9aa7c7d..277b6e4 100644
> --- a/package/bdwgc/Config.in
> +++ b/package/bdwgc/Config.in
> @@ -1,5 +1,12 @@
> +config BR2_PACKAGE_BDWGC_ARCH_SUPPORTS
> +	default y
> +	depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_i386 \
> +		|| BR2_mips || BR2_MIPSEL || BR2_powerpc || BR2_sh \

s/BR2_MIPSEL/BR2_mipsel/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
