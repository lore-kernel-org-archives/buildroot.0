From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 May 2013 09:58:42 +0200
Subject: [Buildroot] [PATCH v6 09/10] libopenmax: Add libopenmax virtual
 package
In-Reply-To: <1368655178-19176-10-git-send-email-spenser@gillilanding.com>
References: <1368655178-19176-1-git-send-email-spenser@gillilanding.com>
 <1368655178-19176-10-git-send-email-spenser@gillilanding.com>
Message-ID: <20130516095842.78066d20@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Wed, 15 May 2013 16:59:37 -0500, Spenser Gilliland wrote:

> diff --git a/package/opengl/Config.in b/package/opengl/Config.in
> index 81616f9..1636807 100644
> --- a/package/opengl/Config.in
> +++ b/package/opengl/Config.in
> @@ -6,3 +6,6 @@ config BR2_PACKAGE_HAS_OPENGL_ES
>  
>  config BR2_PACKAGE_HAS_OPENVG
>  	bool
> +
> +config BR2_PACKAGE_HAS_OPENMAX
> +	bool

I'm starting to wonder if those virtual packages shouldn't be separated
from each other, and named virtual-<something>, i.e:

	package/virtual-opengl/
	package/virtual-openvg/
	package/virtual-egl/
	package/virtual-openmax/

but ok, that's certainly a different work. This current patch series is
already long enough.

> +ifeq ($(BR2_PACKAGE_BELLAGIO),y)
> +LIBOPENMAX_DEPENDENCIES += bellagio
> +endif

Unless I missed something, there is no bellagio package in Buildroot
for now, so this chunk should only be added once bellagio is added.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
