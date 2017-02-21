From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Feb 2017 09:40:34 +0100
Subject: [Buildroot] Enabling GLX without mesa DRI driver
In-Reply-To: <1674359.6j3vDXU7qK@sagittae>
References: <1674359.6j3vDXU7qK@sagittae>
Message-ID: <20170221094034.27409318@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Feb 2017 08:55:14 +0100, J?r?me Pouiller wrote:

> I try to clean up libGL provided by imx-gpu-viv-x11 package and I would like 
> to have your advice.
> 
> In xserver_xorg-server.mk, GLX extension is enabled only if 
> BR2_PACKAGE_MESA3D_DRI_DRIVER is enabled.
> 
> Consequently, it seems OpenGL is not available with Gallium, Nvidia and Radeon 
> or I missed something?

BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU selects
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER, and
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER selects BR2_PACKAGE_MESA3D_DRIVER, so
I think it's good, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
