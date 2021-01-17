From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 17:19:47 +0100
Subject: [Buildroot] [PATCH] package/ipmitool: set IPMITOOL_CPE_ID_VALID
In-Reply-To: <20210117143329.27231-1-heiko.thiery@gmail.com>
References: <20210117143329.27231-1-heiko.thiery@gmail.com>
Message-ID: <20210117161947.GS2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2021-01-17 15:33 +0100, Heiko Thiery spake thusly:
> cpe:2.3:a:ipmitool_project:ipmitool is a valid CPE identifier for this
> package:
> 
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=ipmitool
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/ipmitool/ipmitool.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
> index 123dd274f4..facd97a0b8 100644
> --- a/package/ipmitool/ipmitool.mk
> +++ b/package/ipmitool/ipmitool.mk
> @@ -9,6 +9,7 @@ IPMITOOL_SOURCE = ipmitool-$(IPMITOOL_VERSION).tar.bz2
>  IPMITOOL_SITE = http://downloads.sourceforge.net/project/ipmitool/ipmitool/$(IPMITOOL_VERSION)
>  IPMITOOL_LICENSE = BSD-3-Clause
>  IPMITOOL_LICENSE_FILES = COPYING
> +IPMITOOL_CPE_ID_VENDOR = ipmitool_project

This is the default value when _CPE_ID_VALID is set to YES, so I
switched to that. Also, by the looksof the commit log, it looks like
that's what you indeed wanted to do, hopefully... ;-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  # 0008-fru-Fix-buffer-overflow-vulnerabilities.patch
>  # 0009-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
