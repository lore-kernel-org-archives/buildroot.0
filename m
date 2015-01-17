From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Jan 2015 17:43:03 +0100
Subject: [Buildroot] [PATCH 2/2] mesa3d add option for Radeon
	r300/r600/radeonsi gallium drivers
References: <1413040999-3426-1-git-send-email-micro1183@gmail.com>
 <1413040999-3426-2-git-send-email-micro1183@gmail.com>
Message-ID: <XnsA425B43B6C1E1berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lf <micro1183@gmail.com> wrote in
news:1413040999-3426-2-git-send-email-micro1183 at gmail.com: 

> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300)     +=
> r300 
[...]
> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) +=
> radeonsi 

Hi,

this will not work because buildroot does not contain llvm:

Quote from mesa3d configure log:

checking for RADEON... yes
configure: error: LLVM is required to build Gallium R300 on x86 and x86_64
[...]
configure: error: LLVM 3.4.2 or newer is required for radeonsi

From your patch only the r600 gallium driver can be built using buildroot.

Regards, Bernd
