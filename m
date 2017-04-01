From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:56:28 +0200
Subject: [Buildroot] [PATCH 1/5] package/mesa3d: allow to enable OpenGL
 texture float support
In-Reply-To: <20170326162853.3022-1-romain.naour@gmail.com>
References: <20170326162853.3022-1-romain.naour@gmail.com>
Message-ID: <20170401155628.1c23a945@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Mar 2017 18:28:49 +0200, Romain Naour wrote:
> While testing on a PC target with an HD6310 graphic card, the
> OpenGL support was in "compat profile" mode (i.e OpenGL 2.1).
> 
> Extended renderer info (GLX_MESA_query_renderer):
>     Vendor: X.Org (0x1002)
>     Device: AMD PALM (DRM 2.49.0 / 4.10.4) (0x9802)
>     Version: 17.0.2
>     Accelerated: yes
>     Video memory: 256MB
>     Unified memory: no
>     Preferred profile: compat (0x2)
>     Max core profile version: 0.0
>     Max compat profile version: 2.1
>     Max GLES1 profile version: 1.1
>     Max GLES[23] profile version: 2.0
> OpenGL vendor string: X.Org
> OpenGL renderer string: Gallium 0.4 on AMD PALM (DRM 2.49.0 / 4.10.4)
> OpenGL version string: 2.1 Mesa 17.0.2
> OpenGL shading language version string: 1.30
> 
> OpenGL ES profile version string: OpenGL ES 2.0 Mesa 17.0.2
> OpenGL ES profile shading language version string: OpenGL ES GLSL ES 1.0.16
> 
> It turn out that texture float support was missing...
> 
> Extended renderer info (GLX_MESA_query_renderer):
>     Vendor: X.Org (0x1002)
>     Device: AMD PALM (DRM 2.49.0 / 4.10.4) (0x9802)
>     Version: 17.0.2
>     Accelerated: yes
>     Video memory: 256MB
>     Unified memory: no
>     Preferred profile: core (0x1)
>     Max core profile version: 3.3
>     Max compat profile version: 3.0
>     Max GLES1 profile version: 1.1
>     Max GLES[23] profile version: 3.0
> OpenGL vendor string: X.Org
> OpenGL renderer string: Gallium 0.4 on AMD PALM (DRM 2.49.0 / 4.10.4)
> OpenGL core profile version string: 3.3 (Core Profile) Mesa 17.0.2
> OpenGL core profile shading language version string: 3.30
> OpenGL core profile context flags: (none)
> OpenGL core profile profile mask: core profile
> 
> OpenGL version string: 3.0 Mesa 17.0.2
> OpenGL shading language version string: 1.30
> OpenGL context flags: (none)
> 
> Add a new option to let the user disable this feature if
> it doesn't comply to the SGI license.
> Add docs/patents.txt to MESA3D_LICENSE_FILES
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> NOTE: --enable-texture-float is always enabled in the masa package
> in Fedora:
> http://pkgs.fedoraproject.org/cgit/rpms/mesa.git/tree/mesa.spec?h=f25#n418
> ---
>  package/mesa3d/Config.in | 18 ++++++++++++++++++
>  package/mesa3d/mesa3d.mk |  7 +++++++
>  2 files changed, 25 insertions(+)

Applied to master, after:

 - Rewrapping the Config.in help text

 - Adding a note that the option doesn't affect all drivers, as per the
   discussion with Bernd.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
