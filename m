From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 27 Jun 2016 22:05:05 +0200
Subject: [Buildroot] [PATCH 1/1] qt5wayland: new package
In-Reply-To: <20160627203812.4d1d6148@gmx.net>
References: <20160601033811.6031-1-akihiko.odaki.4i@stu.hosei.ac.jp>
 <20160601033811.6031-3-akihiko.odaki.4i@stu.hosei.ac.jp>
 <20160627203812.4d1d6148@gmx.net>
Message-ID: <20160627220505.7708c3f0@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Akihiko,

On Mon, 27 Jun 2016 20:38:12 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> First compile try (for imx6) bailed out with an error about missing 'wayland-egl', fixed
> by adding:
> 
> 	depends on BR2_PACKAGE_MESA3D # provides wayland-egl
> 

Tried on RPi, compiles without mesa3d. Here the test for brcm_egl succeeds...

> 
> Only compile tested the package (yet), because weston did not start up without
> errors on my test system...

Weston on RPi starts up and:

	$ ./analogclock -platform wayland
Failed to load client buffer integration: wayland-egl

But runs and shows the clock on the weston desktop...

Regards,
Peter

> 
> Regards,
> Peter
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
