From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 22:19:24 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/kodi: broken with sunxi mali
 package
In-Reply-To: <20170705163254.15156-1-bernd.kuhls@t-online.de>
References: <20170705163254.15156-1-bernd.kuhls@t-online.de>
Message-ID: <20170705221924.79f20c24@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 18:32:52 +0200, Bernd Kuhls wrote:

> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 658670139..00e4fbaef 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -22,16 +22,21 @@ config BR2_PACKAGE_KODI_EGL_GLES
>  	depends on BR2_PACKAGE_HAS_LIBEGL
>  	depends on BR2_PACKAGE_HAS_LIBGLES
>  	depends on !BR2_PACKAGE_KODI_GL_EGL # prefer GL if available
> +	depends on !BR2_PACKAGE_SUNXI_MALI

I'm not super happy with this solution. A quick Google search for
"invalid use of incomplete type ?class CEGLNativeType?" shows up a
bunch of results, and not with sunxi-mali.

According to https://github.com/ValveSoftware/steamlink-sdk/issues/93,
it seemed to be a pkg-config issue.

Perhaps some more investigation would be useful here?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
