From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2020 16:18:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/weston: add pipewire support
In-Reply-To: <20200203222305.47765-1-james.hilliard1@gmail.com>
References: <20200203222305.47765-1-james.hilliard1@gmail.com>
Message-ID: <20200204151843.GF3101@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-02-03 15:23 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/weston/weston.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index ada3f565cb..b22e685948 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -17,8 +17,7 @@ WESTON_CONF_OPTS = \
>  	-Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig \
>  	-Dbackend-headless=false \
>  	-Dcolor-management-colord=false \
> -	-Dremoting=false \
> -	-Dpipewire=false
> +	-Dremoting=false
>  
>  # Uses VIDIOC_EXPBUF, only available from 3.8+
>  ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),y)
> @@ -127,6 +126,13 @@ else
>  WESTON_CONF_OPTS += -Dtest-junit-xml=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PIPEWIRE)$(BR2_PACKAGE_WESTON_DRM),yy)
> +WESTON_CONF_OPTS += -Dpipewire=true
> +WESTON_DEPENDENCIES += pipewire
> +else
> +WESTON_CONF_OPTS += -Dpipewire=false
> +endif
> +
>  ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
>  WESTON_CONF_OPTS += -Ddemo-clients=true
>  WESTON_DEPENDENCIES += pango
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
