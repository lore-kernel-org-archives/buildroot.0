From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 30 Dec 2020 16:18:29 +0100
Subject: [Buildroot] [PATCH v1 2/3] package/opengl/libvulkan: new
 virtual package
In-Reply-To: <20200209134408.10534-2-tuzakli.refik@gmail.com>
References: <20200209134408.10534-1-tuzakli.refik@gmail.com>
 <20200209134408.10534-2-tuzakli.refik@gmail.com>
Message-ID: <20201230161829.5e243c92@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Refik,

On Sun,  9 Feb 2020 16:44:07 +0300, Refik Tuzakli <tuzakli.refik@gmail.com> wrote:

> Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
> ---
>  DEVELOPERS                         | 1 +
>  package/opengl/Config.in           | 1 +
>  package/opengl/libvulkan/Config.in | 6 ++++++
>  3 files changed, 8 insertions(+)
>  create mode 100644 package/opengl/libvulkan/Config.in
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index fa9043b0c4..7703d5fa3e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2077,6 +2077,7 @@ F:	package/ustream-ssl/
>  
>  N:	Refik Tuzakli <tuzakli.refik@gmail.com>
>  F:	package/opengl/libopenvx
> +F:	package/opengl/libvulkan/
>  F:	package/paho-mqtt-cpp/
>  
>  N:	R?mi R?rolle <remi.rerolle@gmail.com>
> diff --git a/package/opengl/Config.in b/package/opengl/Config.in
> index 10bdefdb39..af34fb6a46 100644
> --- a/package/opengl/Config.in
> +++ b/package/opengl/Config.in
> @@ -5,3 +5,4 @@ source "package/opengl/libopencl/Config.in"
>  source "package/opengl/libopenvg/Config.in"
>  source "package/opengl/libopenmax/Config.in"
>  source "package/opengl/libopenvx/Config.in"
> +source "package/opengl/libvuulkan/Config.in"

s/libvuulkan/libvulkan/ ?

Regards,
Peter

> diff --git a/package/opengl/libvulkan/Config.in b/package/opengl/libvulkan/Config.in
> new file mode 100644
> index 0000000000..c0cae4681b
> --- /dev/null
> +++ b/package/opengl/libvulkan/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HAS_LIBVULKAN
> +	bool
> +
> +config BR2_PACKAGE_PROVIDES_LIBVULKAN
> +	string
> +	depends on BR2_PACKAGE_HAS_LIBVULKAN
