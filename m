From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 May 2013 19:29:56 +0200
Subject: [Buildroot] [PATCH] qt5 libQt5OpenGL.so library installation
In-Reply-To: <CAMYPSMpf6XjCvQnt5j_qVGaojkYnhWODEOFGtG2iDR4NbdDFXg@mail.gmail.com>
References: <1368650084-24427-1-git-send-email-wojciech.slenska@gmail.com>
 <519475C3.7040407@mind.be>
 <CAMYPSMpf6XjCvQnt5j_qVGaojkYnhWODEOFGtG2iDR4NbdDFXg@mail.gmail.com>
Message-ID: <20130518192956.7b2ad0ba@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Wojciech Sle?ska,

On Fri, 17 May 2013 23:04:44 +0200, Wojciech Sle?ska wrote:

> EGLFS is working without library, but not all QT applications will be
> work. There will be problems with opengl apps (for example
> examples/opengl/hellogl_es2/) and for some QML apps.
> 
> Current behavior is little bit inconsistent because when eglfs is
> selected, qt5 is build with flag -opengl, but library are never
> installed on target. Please check line 87 in qtbase.mk file
> ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
> QT5BASE_CONFIGURE_OPTS += -opengl es2 -eglfs

Ok, this seems to make sense to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
