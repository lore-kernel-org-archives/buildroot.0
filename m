From: Fatih =?UTF-8?Q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Mon, 16 Sep 2013 16:08:40 +0300
Subject: [Buildroot] Building Qt5 Declarative on nitrogen6x with
 buildroot 2013.08
In-Reply-To: <CA+csPL43ygbFLgBgqfHyU7JP10x7=cejdaQGKdBDNAUXcBDoDQ@mail.gmail.com>
References: <CA+csPL6BGsmEFAag7uXsUxo73Bv5KcqCjLhLJifV_t4M6Oy8WQ@mail.gmail.com>
 <CA+csPL43ygbFLgBgqfHyU7JP10x7=cejdaQGKdBDNAUXcBDoDQ@mail.gmail.com>
Message-ID: <1379336920.4275.13.camel@viko>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> I see a challenge here in that the linux-buildroot-g++-"device" that
> buildroot "generates" must have some platform dependent stuff in it.
> How this is done in buildroot, I do not know, but two things must into
> the qmake.conf file of linux-buildroot-g++:
> 
> 
> - the EGL and GAL libraries (in the imx6-file it is:
> QMAKE_LIBS_OPENGL_ES2  += -lEGL -lGAL)
> 
> - the symbol EGL_API_FB must be defined (in the imx6-file it is:
> IMX6_CFLAGS             = -DEGL_API_FB=1) 
> 
> I understand that it cannot be put into the patch-file, since the EGL
> and GAL libraries are interesting for imx6 only.
> 
qt5 packages use pkg-config to get EGL flags. See
rpi-userland/rpi-userland-add-pkgconfig-files.patch.

A similar patch is probably needed for the package providing EGL
libraries to nitrogen6x.
