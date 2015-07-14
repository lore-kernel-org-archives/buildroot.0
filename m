From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Jul 2015 18:42:30 +0300
Subject: [Buildroot] [PATCH v4 2/3] toolchain-external: add OSELAS
 2014.12.0 Cortex-M3 toolchain
In-Reply-To: <1436886664-3206-3-git-send-email-guido@vanguardiasur.com.ar>
References: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
 <1436886664-3206-1-git-send-email-guido@vanguardiasur.com.ar>
 <1436886664-3206-3-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150714154230.GC2332@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guido,

On Tue, Jul 14, 2015 at 12:11:03PM -0300, Guido Mart?nez wrote:
> +config BR2_TOOLCHAIN_EXTERNAL_OSELAS_ARM_CORTEX_M3_201412
> +	bool "OSELAS ARM Cortex-M3 2014.12"
> +	depends on BR2_cortex_m3
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
> +	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
> +	select BR2_LARGEFILE
> +	select BR2_INET_IPV6

These two symbols were removed recently. All toolchains should now support LFS 
and IPv6.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
