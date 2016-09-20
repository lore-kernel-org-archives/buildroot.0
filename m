From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 20:03:10 +0200
Subject: [Buildroot] [PATCH v3 2/3] package/mesa3d: provides libgl not
 only with DRI drivers
In-Reply-To: <1468772875-5090-2-git-send-email-bernd.kuhls@t-online.de>
References: <1468772875-5090-1-git-send-email-bernd.kuhls@t-online.de>
 <1468772875-5090-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160920200310.0953e686@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 18:27:54 +0200, Bernd Kuhls wrote:
> This patch is a follow-up for
> https://github.com/buildroot/buildroot/commit/999d4a263118ab8581190d3e3c8bdc471896628f
> 
> libGL.so and support files are not only available with DRI drivers but
> also with Gallium drivers, in fact mesa3d can be built without any
> driver enabled - unless X.org is disabled it will provide libGL.so.
> 
> Tested using this defconfig:
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_XORG7=y
> 
> Fixes
> http://autobuild.buildroot.net/results/d97/d97a80e6de066a7dea08b284eab24fc44b11d661/
> 
> kodi-visualisation-waveforhue detects OpenGL installed by mesa3d but the
> kodi package itself does not select libglew before because mesa3d was
> not listed as a provider for libgl in the buildroot build system.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: fixed X.org comment typo (Yann)
>     moved before the Vulkan driver patch and rebased (Yann)
> v2: never released

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
