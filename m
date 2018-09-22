From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Sep 2018 14:46:18 +0200
Subject: [Buildroot] [PATCH v3 2/3] package/waffle: new package
In-Reply-To: <20180922105626.22626-2-romain.naour@gmail.com>
References: <20180922105626.22626-1-romain.naour@gmail.com>
 <20180922105626.22626-2-romain.naour@gmail.com>
Message-ID: <20180922144618.5e85cf9f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Sep 2018 12:56:25 +0200, Romain Naour wrote:

> +config BR2_PACKAGE_WAFFLE
> +	bool "waffle"
> +	depends on BR2_PACKAGE_WAFFLE_SUPPORTS_GLX || \
> +		BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND || \
> +		BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL || \
> +		BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
> +	depends on BR2_PACKAGE_HAS_LIBGLES # dlopen'ing the GLES libararies at runtime.

Are you sure that GLES support *must* be available ?

This seems very weird, because in a typical "desktop" context, with
X.org and GLX, you have full OpenGL support, but you don't have GLES
libraries available.

Is this dependency coming from actual runtime issues you have
encountered ? Could you explain it in a bit more details ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
