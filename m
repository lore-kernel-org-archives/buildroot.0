From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 18:29:51 +0200
Subject: [Buildroot] [PATCH] boot/uboot: switch to host-python3
In-Reply-To: <20200426140330.6498-1-francois.perrad@gadz.org>
References: <20200426140330.6498-1-francois.perrad@gadz.org>
Message-ID: <20200426162951.GB28666@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2020-04-26 16:03 +0200, Francois Perrad spake thusly:
> that fixes the following build failures with olimex_a20_olinuxino_lime*_defconfig:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/526035680
> https://gitlab.com/buildroot.org/buildroot/-/jobs/526035682
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  boot/uboot/uboot.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 2bfa50779..688cc17cc 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -160,7 +160,7 @@ UBOOT_DEPENDENCIES += host-dtc
>  endif
>  
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
> -UBOOT_DEPENDENCIES += host-python host-swig
> +UBOOT_DEPENDENCIES += host-python3 host-swig

This is not correct, because it is possible to use older versions of
uboot that still require python2, and this chagne would break them, as
well as our 33 other defconfigs that are still using such an older
uboot.

Another discussion was started on that topic:

    http://lists.busybox.net/pipermail/buildroot/2020-April/281309.html

Regards,
Yann E. MORIN.

>  endif
>  
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS),y)
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
