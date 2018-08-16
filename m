From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 16 Aug 2018 21:11:17 +0200
Subject: [Buildroot] [PATCH/next v3 1/1] package/qt5/qt5base: fix statx
 support with glibc >= 2.28
References: <20180813194206.24355-1-bernd.kuhls@t-online.de>
 <20180814154127.1a60cab7@windsurf>
Message-ID: <lrug4fxqji.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 14 Aug 2018 15:41:27 +0200 schrieb Thomas Petazzoni:

> Did you check if this issue also applies to Qt
> 5.6.3, which we still support ?

Hi Thomas,

because the qt5 dependency of vlc was my first ever contact with qt5 in 
buildroot I did not notice that 5.6 can also be selected while 5.11 is 
the default version. I think qt 5.6 does not need any patches for 
glibc-2.28 because I just did a successful build with the current next 
branch:

BR2_x86_64=y
BR2_x86_core_avx2=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_BINUTILS_VERSION_2_31_X=y
BR2_GCC_VERSION_8_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_SYSTEMD=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_FFMPEG=y
BR2_PACKAGE_FFMPEG_GPL=y
BR2_PACKAGE_FFMPEG_NONFREE=y
BR2_PACKAGE_FFMPEG_FFPLAY=y
BR2_PACKAGE_FFMPEG_FFPROBE=y
BR2_PACKAGE_FFMPEG_AVRESAMPLE=y
BR2_PACKAGE_FFMPEG_POSTPROC=y
BR2_PACKAGE_VLC=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5_VERSION_5_6=y
BR2_PACKAGE_QT5BASE_WIDGETS=y
BR2_PACKAGE_QT5SVG=y
BR2_PACKAGE_XORG7=y

Quotes from vlc configure log:

checking for QT... yes
[...]
vlc aliases           : cvlc rvlc qvlc

Regards, Bernd
