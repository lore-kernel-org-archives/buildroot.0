From: daggs <daggs@gmx.com>
Date: Fri, 1 Jul 2016 13:04:57 +0200
Subject: [Buildroot]
	=?utf-8?q?=5BPATCH_4/4_v3=5D_kodi=3A_allow_enablement?=
	=?utf-8?q?_of_libamcodec_as=09codec_if_selected?=
In-Reply-To: <37g24dxqbs.ln2@ID-313208.user.individual.net>
References: <20160624182256.11909-1-daggs@gmx.com>
 <20160624182256.11909-4-daggs@gmx.com>,
 <37g24dxqbs.ln2@ID-313208.user.individual.net>
Message-ID: <trinity-6552df3a-288c-4396-95fb-c56acc32c4d5-1467371097197@3capp-mailcom-bs11>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
> 
> > +else ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
> > +KODI_DEPENDENCIES += libamcodec
> > +KODI_CONF_OPTS += --enable-codec=amcodec
> 
> Hi,
> 
> using this defconfig
> 
> BR2_arm=y
> BR2_cortex_a15=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_LIBAMCODEC=y
> 
> $ grep -i unsafe .config
> BR2_COMPILER_PARANOID_UNSAFE_PATH=y
> 
> compiling Kodi fails:
> 
> CPP     xbmc/cores/dvdplayer/DVDCodecs/Video/AMLCodec.o
> arm-buildroot-linux-uclibcgnueabihf-g++: ERROR: unsafe header/library path used in cross-compilation: '/usr/include/amcodec'
> 
> due to not compile-safe code used here:
> https://github.com/xbmc/xbmc/blob/Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in#L29
> 
> Regards, Bernd
> 
will take a look on this, thanks.

Dagg.
