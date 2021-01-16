From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2021 16:37:55 +0100
Subject: [Buildroot] [PATCH 3/4] configs/snps_archs38_hsdk_defconfig:
 switch to glibc hard-float
In-Reply-To: <20210115200319.4139041-4-vgupta@synopsys.com>
References: <20210115200319.4139041-1-vgupta@synopsys.com>
 <20210115200319.4139041-4-vgupta@synopsys.com>
Message-ID: <20210116153755.GL2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vineet, All,

On 2021-01-15 12:03 -0800, Vineet Gupta spake thusly:
> We are no longer actively working on uClibc and hard-float support is
> pretty stable, so make that default for HSDK boards
> 
> The hard-float setting is a bit convulated since current ARC gcc lacks
> --with-fpu - so this is done with BR2_TARGET_OPTIMIZATION
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

I split that patch in two:
  - one commit to switch to glibc,
  - one commit to enable hard-float

Since the hard-float, as you noticed, is using a non-conventional way to
passit, so if it truns out to be causing issues, it is easier to revert
if it is in a commit of its own.

Regards,
Yann E. MORIN.

> ---
>  configs/snps_archs38_hsdk_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
> index b8fd35636000..69d0b1936b3a 100644
> --- a/configs/snps_archs38_hsdk_defconfig
> +++ b/configs/snps_archs38_hsdk_defconfig
> @@ -1,6 +1,9 @@
>  BR2_arcle=y
>  BR2_archs38_full=y
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
> +BR2_PACKAGE_GLIBC_UTILS=y
> +BR2_TARGET_OPTIMIZATION="-mfpu=fpud_all"
>  BR2_TARGET_GENERIC_HOSTNAME="hsdk"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to the HSDK Platform"
>  BR2_SYSTEM_DHCP="eth0"
> -- 
> 2.25.1
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
