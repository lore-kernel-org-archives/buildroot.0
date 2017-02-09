From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 23:19:09 +0100
Subject: [Buildroot] [PATCH v2] package/efl: enable Wayland support if
 available
In-Reply-To: <20170206162437.12748-1-romain.naour@gmail.com>
References: <20170206162437.12748-1-romain.naour@gmail.com>
Message-ID: <20170209231909.025f4312@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Feb 2017 17:24:37 +0100, Romain Naour wrote:
> If all the dependencies are present to select the efl wayland
> support, enable it by default.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: rebase on master
> ---
>  package/efl/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 5e89af6..a8f9d41 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -180,6 +180,7 @@ config BR2_PACKAGE_EFL_WAYLAND
>  	depends on BR2_PACKAGE_EFL_EEZE # efl drm
>  	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
>  	select BR2_PACKAGE_EFL_DRM
> +	default y

Why would we do this? For the X.org support, we also have a "depends
on" and the option is not "default y". I don't see why the X.org and
Wayland cases should be handled differently. If there is a reason, it
should be explained in the commit log IMO.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
