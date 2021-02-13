From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Feb 2021 22:46:52 +0100
Subject: [Buildroot] [PATCH 1/1] support/testing: TestATFAllwinner needs
 python3 for u-boot
In-Reply-To: <20210213182230.601340-1-geomatsi@gmail.com>
References: <20210213182230.601340-1-geomatsi@gmail.com>
Message-ID: <20210213214652.GC2740149@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergey, All,

On 2021-02-13 21:22 +0300, Sergey Matyukevich spake thusly:
> New U-Boot version needs Python 3.x for pylibfdt.
> 
> Fixes:
> - https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385909
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/boot/test_atf.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
> index c23b9d8aba..e6c11aa742 100644
> --- a/support/testing/tests/boot/test_atf.py
> +++ b/support/testing/tests/boot/test_atf.py
> @@ -44,6 +44,7 @@ class TestATFAllwinner(infra.basetest.BRTest):
>          BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
>          BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
>          BR2_TARGET_UBOOT_NEEDS_DTC=y
> +        BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>          BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>          BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>          BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> -- 
> 2.30.1
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
