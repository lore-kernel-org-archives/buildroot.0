From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 23:16:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/{mesa3d,
 mesa3d-headers}: bump version to 17.1.2
In-Reply-To: <20170610115347.27948-1-bernd.kuhls@t-online.de>
References: <20170610115347.27948-1-bernd.kuhls@t-online.de>
Message-ID: <20170615231613.01cac207@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Jun 2017 13:53:46 +0200, Bernd Kuhls wrote:
> From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Patch 0005 tweaked to apply on this release.
> 
> Patch 0006 already included in this release:
>   https://cgit.freedesktop.org/mesa/mesa/commit/?id=e75001811e3b66986b4ede165a0fdde703d4f05b
> 
> zlib is now a mandatory dependency.
> https://cgit.freedesktop.org/mesa/mesa/commit/?h=17.1&id=85a9b1b562b6a73b9494b3fad25172da3dc90fc2
> 
> [Bernd: added in v2]
> - bump to mesa3d version 17.1.2
> - squashed mesa3d-headers bump for bisectability
> - renumbered patch 0007
> - added zlib link in patch message
> - Vulkan Intel driver does not depend on the i965 dri driver anymore
>   https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=17.1&id=9aebdb5d082ec640fe8a14704201952bddb50a88
> - Gallium vc4 driver depends on NEON support
>   https://cgit.freedesktop.org/mesa/mesa/commit/?h=17.1&id=4d30024238efa829cabc72c1601beeee18c3dbf2
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
>  ...ac-invert-order-for-wayland-scanner-check.patch | 17 ++++++-----
>  ...ct-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch} |  0
>  ...naviv-Cannot-render-to-rb-swapped-formats.patch | 35 ----------------------
>  package/mesa3d/Config.in                           |  4 +--
>  package/mesa3d/mesa3d.hash                         | 10 +++----
>  package/mesa3d/mesa3d.mk                           |  5 ++--
>  7 files changed, 21 insertions(+), 52 deletions(-)
>  rename package/mesa3d/{0007-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch => 0006-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch} (100%)
>  delete mode 100644 package/mesa3d/0006-Revert-etnaviv-Cannot-render-to-rb-swapped-formats.patch

Quite a few apparently new build failures with this bump:

configure: error: Package requirements (x11-xcb xcb xcb-dri2 >= 1.8 xcb-xfixes) were not met:

 example: http://autobuild.buildroot.net/results/a48/a48543f28c8aee93f182fbdaf096878fd696c2b9/build-end.log


util/u_debug_stack.c: In function 'debug_backtrace_capture':
util/u_debug_stack.c:114:4: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'asm'
    unw_getcontext(&context);

 example: http://autobuild.buildroot.net/results/3ef/3efe156b6494e4392b6c31de447ee2c72acc1a53/build-end.log

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
