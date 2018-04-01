From: daggs <daggs@gmx.com>
Date: Sun, 1 Apr 2018 14:25:11 +0200
Subject: [Buildroot] [PATCH 1/4] package/kodi: remove libamcodec support
In-Reply-To: <45t6pexo6d.ln2@ID-313208.user.individual.net>
References: <20180401070337.18301-1-bernd.kuhls@t-online.de>
 <trinity-60c51855-aef6-4353-90a8-2e1f048863e2-1522567079284@3c-app-mailcom-bs16>
 <trinity-8edc1929-b40d-4afa-85a8-e152cef642fb-1522567556973@3c-app-mailcom-bs16>
 <1je6pexo6d.ln2@ID-313208.user.individual.net>
 <trinity-550783d4-570b-41d5-937b-f66aa367d27f-1522568580265@3c-app-mailcom-bs16>
 <4sf6pexo6d.ln2@ID-313208.user.individual.net>
 <trinity-8096f0c8-32ae-4d0a-ad74-d40b12f0f8ff-1522569777353@3c-app-mailcom-bs16>
 <e4h6pexo6d.ln2@ID-313208.user.individual.net>
 <trinity-6f4e61bd-29a2-4eda-99e3-7f78e881ab04-1522571242948@3c-app-mailcom-bs16>
 <45t6pexo6d.ln2@ID-313208.user.individual.net>
Message-ID: <trinity-22e97573-5741-4217-9e6c-d668449e004b-1522585511151@3c-app-mailcom-bs11>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Bernd,

> Sent: Sunday, April 01, 2018 at 2:41 PM
> From: "Bernd Kuhls" <bernd.kuhls@t-online.de>
> To: buildroot at uclibc.org
> Subject: Re: [Buildroot] [PATCH 1/4] package/kodi: remove libamcodec support
>
> Am Sun, 01 Apr 2018 10:27:22 +0200 schrieb daggs:
> 
> > as said by Thomas in another mail, there shouldn't be any dependency,
> > what is the exact issue? compilation failure? what kodi version are you
> > using?
> 
> Hi daggs,
> 
> the following builds were all made with unpatched buildroot master branch.
> 
> The only successful kodi build including libamcodec was made with odroid-
> mali using this defconfig:
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_ODROID_MALI=y
> BR2_PACKAGE_PYTHON=y
> BR2_PACKAGE_PYTHON_PY_ONLY=y
> BR2_PACKAGE_LIBAMCODEC=y
> 
> -- Found OpenGLES: /home/buildroot/br2/output/host/aarch64-buildroot-
> linux-gnu/sysroot/usr/lib/libGLESv2.so  
> -- Found EGL: /home/buildroot/br2/output/host/aarch64-buildroot-linux-gnu/
> sysroot/usr/lib/libEGL.so (found version "r4p0") 
> -- Found AML: /home/buildroot/br2/output/host/aarch64-buildroot-linux-gnu/
> sysroot/usr/include/amcodec  
> 
> -- OPENGL enabled: No
> -- OPENGLES enabled: Yes
> -- X enabled: No
> -- LIBDRM enabled: No
> -- AML enabled: Yes
> 
> Then I tried two builds with mesa3d & libamcodec, one where mesa3d 
> provides opengl, in the second build mesa3d provides opengles, both 
> failed:
> 
> ------------------------------------------------------------------
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_PYTHON=y
> BR2_PACKAGE_PYTHON_PY_ONLY=y
> BR2_PACKAGE_LIBAMCODEC=y
> 
> -- Found OpenGl: /home/buildroot/br2/output/host/aarch64-buildroot-linux-
> uclibc/sysroot/usr/lib/libGL.so  
> -- Found X: /home/buildroot/br2/output/host/aarch64-buildroot-linux-
> uclibc/sysroot/usr/lib/libX11.so (found version "1.6.5") 
> -- Found LibDRM: /home/buildroot/br2/output/host/aarch64-buildroot-linux-
> uclibc/sysroot/usr/lib/libdrm.so (found version "2.4.91") 
> -- Found XRandR: /home/buildroot/br2/output/host/aarch64-buildroot-linux-
> uclibc/sysroot/usr/lib/libXrandr.so (found version "1.5.1") 
> -- Found EGL: /home/buildroot/br2/output/host/aarch64-buildroot-linux-
> uclibc/sysroot/usr/lib/libEGL.so (found version "18.0.0") 
> -- Found AML: /home/buildroot/br2/output/host/aarch64-buildroot-linux-
> uclibc/sysroot/usr/include/amcodec  
> 
> -- OPENGL enabled: Yes
> -- X enabled: Yes
> -- LIBDRM enabled: Yes
> -- XRANDR enabled: Yes
> -- AML enabled: Yes
> 
> [ 94%] Building CXX object build/cores/VideoPlayer/videorenderers/
> CMakeFiles/videorenderers.dir/RenderManager.cpp.o
> /home/bernd/buildroot/br2/output/build/kodi-17.6-Krypton/xbmc/cores/
> VideoPlayer/VideoRenderers/RenderManager.cpp: In member function 'void 
> CRenderManager::CreateRenderer()':
> /home/bernd/buildroot/br2/output/build/kodi-17.6-Krypton/xbmc/cores/
> VideoPlayer/VideoRenderers/RenderManager.cpp:582:25: error: 
> 'CRendererAML' does not name a type
>        m_pRenderer = new CRendererAML;
>                          ^~~~~~~~~~~~
> ------------------------------------------------------------------
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_PYTHON=y
> BR2_PACKAGE_PYTHON_PY_ONLY=y
> BR2_PACKAGE_LIBAMCODEC=y
> 
> -- Found OpenGLES: /home/buildroot/br2/output/host/aarch64-buildroot-
> linux-uclibc/sysroot/usr/lib/libGLESv2.so  
> -- Found EGL: /home/buildroot/br2/output/host/aarch64-buildroot-linux-
> uclibc/sysroot/usr/lib/libEGL.so (found version "18.0.0") 
> -- Found AML: /home/buildroot/br2/output/host/aarch64-buildroot-linux-
> uclibc/sysroot/usr/include/amcodec  
> 
> -- OPENGL enabled: No
> -- OPENGLES enabled: Yes
> -- X enabled: No
> -- LIBDRM enabled: No
> -- AML enabled: Yes
> 
> /bin/grep: /usr/lib/libgbm.la: No such file or directory
> /bin/sed: can't read /usr/lib/libgbm.la: No such file or directory
> libtool:   error: '/usr/lib/libgbm.la' is not a valid libtool archive
> 
> ------------------------------------------------------------------
> 
> Buildroot should not allow to use non-working combinations and here I 
> think hardware-wise we should in some way connect libamcodec and odroid-
> mail to be used by Kodi. Besides the build errors it makes no sense to 
> have software rendering provided by mesa3d when you have vendor-provided 
> opengl libs.
> 
> What do you think?
> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

I have an idea that can address this issue but first I'd like to get confirmation from the vendor's support team especially since libreelec doesn't seems to libamlogic compiled, ok?

Dagg
