From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 16:44:11 +0100
Subject: [Buildroot] [PATCH for-next 3/3] package/ogre: new package
In-Reply-To: <20190529151655.7098-3-romain.naour@gmail.com>
References: <20190529151655.7098-1-romain.naour@gmail.com>
 <20190529151655.7098-3-romain.naour@gmail.com>
Message-ID: <20191027164411.511c5d5b@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 29 May 2019 17:16:55 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> +comment "ogre needs X11 and an OpenGL provider"
> +	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
> +	depends on BR2_TOOLCHAIN_HAS_THREADS \&& BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \

                                             ^^^^ spurious backslash here

> +OGRE_LICENSE = MIT with exceptions (main library), MIT (DeferredShadingMedia samples), Public Domain (samples and plugins), Zlib (tinyxml)

So as we discussed, the main library doesn't have MIT with exceptions,
but just MIT, so I fixed.

Applied, with those changes!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
