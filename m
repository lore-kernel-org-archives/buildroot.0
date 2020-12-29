From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 19:23:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: enable CONFIG_FUSE_FS
 in kernel config
In-Reply-To: <20201223021627.1820551-1-tianyuanhao@aliyun.com>
References: <20201223021627.1820551-1-tianyuanhao@aliyun.com>
Message-ID: <20201229182325.GV1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tian, All,

On 2020-12-23 10:16 +0800, Tian Yuanhao via buildroot spake thusly:
> Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libfuse3/libfuse3.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
> index f6d8dd0ab9..0a896d8dad 100644
> --- a/package/libfuse3/libfuse3.mk
> +++ b/package/libfuse3/libfuse3.mk
> @@ -23,4 +23,8 @@ define LIBFUSE3_PERMISSIONS
>  	/usr/bin/fusermount3 f 4755 0 0 - - - - -
>  endef
>  
> +define LIBFUSE3_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_FUSE_FS)
> +endef
> +
>  $(eval $(meson-package))
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
