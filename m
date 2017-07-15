From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 21:43:37 +0200
Subject: [Buildroot] [PATCH v3 1/3] package/kodi: broken with sunxi mali
 package
In-Reply-To: <20170715155633.16705-1-bernd.kuhls@t-online.de>
References: <20170715155633.16705-1-bernd.kuhls@t-online.de>
Message-ID: <20170715214337.404951ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Jul 2017 17:56:31 +0200, Bernd Kuhls wrote:
> Building this defconfig
> 
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_ARM_INSTRUCTIONS_THUMB2=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_SUNXI_MALI=y
> BR2_PACKAGE_PYTHON=y
> BR2_PACKAGE_PYTHON_PY_ONLY=y
> 
> ends up with this build error:
> 
> [ 98%] Building CXX object build/windowing/egl/CMakeFiles/windowing_egl.dir/EGLWrapper.cpp.o
> /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In function ?bool {anonymous}::CorrectGuess(CEGLNativeType*, const string&)?:
> /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:63:13: error: invalid use of incomplete type ?class CEGLNativeType?
>      if(guess->CheckCompatibility())

I already replied to the v2 of this patch series that I wasn't really
happy with this solution, at least not until we have an explanation
other than "it doesn't work, let's disable it".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
