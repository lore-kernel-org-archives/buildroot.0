From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 21:32:30 +0200
Subject: [Buildroot] [PATCH 2/8] package/glmark2: gl support also
 depends on X.org
In-Reply-To: <1461586822-1003-2-git-send-email-bernd.kuhls@t-online.de>
References: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
 <1461586822-1003-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160427213230.0ee9fe71@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Apr 2016 14:20:16 +0200, Bernd Kuhls wrote:

> diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
> index 9167fc5..10c88ee 100644
> --- a/package/glmark2/Config.in
> +++ b/package/glmark2/Config.in
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_GLMARK2_EGL_GLES
>  config BR2_PACKAGE_GLMARK2_GL
>  	bool
>  	default y
> -	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
> +	depends on BR2_PACKAGE_MESA3D_OPENGL_GL

I know that may sound like a nitpicking debate, but I'm wondering if we
shouldn't keep BR2_PACKAGE_MESA3D_OPENGL_GL as an internal mesa3d
symbol, and instead use:

	depends on BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_MESA3D

which really expresses what we want: we want an OpenGL implementation,
and this OpenGL implementation has to be mesa3d.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
