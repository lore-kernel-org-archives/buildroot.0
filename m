From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 May 2021 21:37:47 +0200
Subject: [Buildroot] [PATCH v2 1/3]
 testing/tests/package/test_openjdk.py: bump kernel version to 5.10.34
In-Reply-To: <20210504210026.1916260-1-aduskett@gmail.com>
References: <20210504210026.1916260-1-aduskett@gmail.com>
Message-ID: <20210505193747.GU2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2021-05-04 14:00 -0700, Adam Duskett spake thusly:
> Kernel 4.16.7 is old enough to produce the "multiple definition of `yylloc'"
> error which is fixed in newer versions.
> 
> Bump the test kernel version from 4.16.7 to 5.10.34 to prevent this error wwhen
> building the test image.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/test_openjdk.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_openjdk.py b/support/testing/tests/package/test_openjdk.py
> index 3a1d1a9b09..26b7f9ee92 100644
> --- a/support/testing/tests/package/test_openjdk.py
> +++ b/support/testing/tests/package/test_openjdk.py
> @@ -12,7 +12,7 @@ class TestOpenJdk(infra.basetest.BRTest):
>          BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>          BR2_LINUX_KERNEL=y
>          BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.34"
>          BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>          BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>          BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> -- 
> 2.31.1
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
