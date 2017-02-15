From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Feb 2017 17:11:59 +0100
Subject: [Buildroot] [PATCH 1/2] mesa3d-headers: fix installation of
	dri.pc
In-Reply-To: <1487172648-5292-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1487172648-5292-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170215161159.GA3425@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-15 16:30 +0100, Thomas Petazzoni spake thusly:
> /usr/lib/pkg-config/ is not the correct installation path for .pc files,
> it should be in /usr/lib/pkgconfig/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index 2c62c48..7ae5966 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -47,7 +47,7 @@ define MESA3D_HEADERS_INSTALL_DRI_PC
>  	$(INSTALL) -D -m 0644 $(@D)/include/GL/internal/dri_interface.h \
>  		$(STAGING_DIR)/usr/include/GL/internal/dri_interface.h
>  	$(INSTALL) -D -m 0644 $(@D)/src/mesa/drivers/dri/dri.pc \
> -		$(STAGING_DIR)/usr/lib/pkg-config/dri.pc
> +		$(STAGING_DIR)/usr/lib/pkgconfig/dri.pc
>  endef
>  
>  endif # Xorg
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
