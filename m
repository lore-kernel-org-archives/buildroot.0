From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Feb 2017 17:13:15 +0100
Subject: [Buildroot] [PATCH 2/2] mesa3d-headers: remove installation of
	OpenVG headers
In-Reply-To: <1487172648-5292-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1487172648-5292-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1487172648-5292-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170215161315.GB3425@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-15 16:30 +0100, Thomas Petazzoni spake thusly:
> OpenVG support has been completely removed from mesa3d in commit
> 3acd7a34ab05b87521b74f626ec637e7fdcc6595, merged in mesa-10.6.0.

Indeed.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index 7ae5966..35b1a71 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -62,10 +62,6 @@ ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
>  MESA3D_HEADERS_DIRS += GLES GLES2
>  endif
>  
> -ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
> -MESA3D_HEADERS_DIRS += VG
> -endif
> -
>  define MESA3D_HEADERS_BUILD_CMDS
>  	$(MESA3D_HEADERS_BUILD_DRI_PC)
>  endef
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
