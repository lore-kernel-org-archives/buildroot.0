From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jun 2020 22:21:33 +0200
Subject: [Buildroot] [PATCH v4 2/2] package/libcamera: add v4l2
 compatibility layer option
In-Reply-To: <20200616185951.30319-3-ps.report@gmx.net>
References: <20200616185951.30319-1-ps.report@gmx.net>
 <20200616185951.30319-3-ps.report@gmx.net>
Message-ID: <20200618202133.GR2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-06-16 20:59 +0200, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v3 -> v4:
>   - new patch
> ---
>  package/libcamera/Config.in    | 5 +++++
>  package/libcamera/libcamera.mk | 9 +++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index 56ca5aaf18..960d78b82e 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -16,6 +16,11 @@ menuconfig BR2_PACKAGE_LIBCAMERA
>  
>  if BR2_PACKAGE_LIBCAMERA
>  
> +config BR2_PACKAGE_LIBCAMERA_V4L2
> +	bool "libcamera v4l2 compatibility layer"
> +	help
> +	  libcamera v4l2 compatibility layer
> +
>  config BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
>  	bool
>  
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index c7513d2e68..1633becf04 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -15,8 +15,7 @@ LIBCAMERA_DEPENDENCIES = \
>  LIBCAMERA_CONF_OPTS = \
>  	-Dandroid=false \
>  	-Ddocumentation=false \
> -	-Dtest=false \
> -	-Dv4l2=false
> +	-Dtest=false
>  LIBCAMERA_INSTALL_STAGING = yes
>  LIBCAMERA_LICENSE = \
>  	LGPL-2.1+ (library), \
> @@ -37,6 +36,12 @@ LIBCAMERA_LICENSE_FILES = \
>  	LICENSES/CC0-1.0.txt \
>  	LICENSES/CC-BY-SA-4.0.txt
>  
> +ifeq ($(BR2_PACKAGE_LIBCAMERA_V4L2),y)
> +LIBCAMERA_CONF_OPTS = -Dv4l2=true
> +else
> +LIBCAMERA_CONF_OPTS = -Dv4l2=false
> +endif
> +
>  LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
>  ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI),y)
>  LIBCAMERA_PIPELINES-y += raspberrypi
> -- 
> 2.27.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
