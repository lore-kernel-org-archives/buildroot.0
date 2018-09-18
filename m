From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 09:31:10 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/waffle: new package
In-Reply-To: <207cc677-6028-81a1-f338-22711d152bc1@smile.fr>
References: <20180211162136.15605-1-romain.naour@gmail.com>
 <20180211162136.15605-2-romain.naour@gmail.com>
 <20180916233058.53cc7eec@windsurf>
 <207cc677-6028-81a1-f338-22711d152bc1@smile.fr>
Message-ID: <20180918093110.4dd932d1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Sep 2018 21:59:46 +0200, Romain Naour wrote:

> > config BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
> > 	bool
> > 	# mesa3d is for now the only GBM provider, and it is enabled
> > 	# together with its EGL support
> > 	default y if BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_MESA3D_OPENGL_EGL && BR2_PACKAGE_HAS_UDEV  
> 
> I believe this comment will be not correct as soon as the libgbm virtual package
> will be merged.

Indeed, but I wrote this example code for the current master, i.e
without the libgbm virtual package merged. Once it is merged, it is not
only the comment that will be wrong, but also the
BR2_PACKAGE_MESA3D_OPENGL_EGL dependency that will have to be replaced
by BR2_PACKAGE_HAS_LIBGBM.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
