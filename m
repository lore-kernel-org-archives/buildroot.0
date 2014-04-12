From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 23:27:21 +0200
Subject: [Buildroot] [PATCH 01/13] package/xdriver_xf86-video-ati:
 depends on x86
In-Reply-To: <a00b28f75409c0cd28dc6ae9f4ee3262ada481f3.1396699629.git.yann.morin.1998@free.fr>
References: <cover.1396699629.git.yann.morin.1998@free.fr>
 <a00b28f75409c0cd28dc6ae9f4ee3262ada481f3.1396699629.git.yann.morin.1998@free.fr>
Message-ID: <20140412232721.11855e16@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  5 Apr 2014 14:10:05 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> xdriver_xf86-video-ati selects BR2_PACKAGE_LIBDRM_RADEON which
> depends on x86.
> 
> This can generate "unmet direct dependencies" warnings.
> 
> Propagate the dependency from BR2_PACKAGE_LIBDRM_RADEON.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/x11r7/xdriver_xf86-video-ati/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
> index 3c0cac3..e32256c 100644
> --- a/package/x11r7/xdriver_xf86-video-ati/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
>  	bool "xf86-video-ati"
> +	depends on BR2_i386 || BR2_x86_64 # libdrm-radeon
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_LIBDRM_RADEON
>  	select BR2_PACKAGE_MESA3D

Technically speaking, libdrm is not a mandatory dependency for the ATI
driver. It seems to only be mandatory if you want to enable DRI support.

Moreover, the fact that libdrm-radeon is only available on x86 and
x86-64 is wrong. It might have been the case back when it had a
dependency on libpciaccess, but it's no longer the case, and I've just
tested: one can build libdrm-radeon for ARM without any problem:

$ file output/target/usr/lib/libdrm_radeon.so.1.0.1 
output/target/usr/lib/libdrm_radeon.so.1.0.1: ELF 32-bit LSB shared object, ARM, version 1 (SYSV), dynamically linked, stripped

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
