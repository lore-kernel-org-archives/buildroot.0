From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Nov 2017 17:27:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/dtc: qemu system build need
 libfdt.
In-Reply-To: <1509624873-16240-1-git-send-email-ren_guo@c-sky.com>
References: <1509624873-16240-1-git-send-email-ren_guo@c-sky.com>
Message-ID: <20171102162708.GB3238@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guo Ren, All,

On 2017-11-02 20:14 +0800, Guo Ren spake thusly:
> The "install-bin" just install dtc's programs to host/bin without
> libfdt, but qemu system compile need libfdt.
> 
> see: https://gitlab.com/c-sky/buildroot/-/jobs/38654503
> 
> So we need install libfdt to satisfy qemu system compile.
> 
> Change-Id: I85748479ac11e1c6452d3f79d04f02666218774a

What's this Change-Id tag? We do not want to carry per-project specific
tags. If you want/need to point to some related reference, just add an
URL pointing to it.

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>  package/dtc/dtc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> index dd0f30d..1bcee29 100644
> --- a/package/dtc/dtc.mk
> +++ b/package/dtc/dtc.mk
> @@ -51,7 +51,7 @@ define HOST_DTC_BUILD_CMDS
>  endef
>  
>  define HOST_DTC_INSTALL_CMDS
> -	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-bin
> +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
