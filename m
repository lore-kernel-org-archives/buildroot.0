From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 10 Jun 2012 16:41:37 +0200
Subject: [Buildroot] [PATCH v3 6/6] opencv: bump to version 2.4.1
In-Reply-To: <1339328813-6269-9-git-send-email-s.martin49@gmail.com>
References: <1339328813-6269-1-git-send-email-s.martin49@gmail.com>
 <1339328813-6269-9-git-send-email-s.martin49@gmail.com>
Message-ID: <CAHXCMMKRQWday+9AX+izz6o1XmQvcSKEVSqyVeRiy+ZUPJJzVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/6/10 Samuel Martin <s.martin49@gmail.com>:
[...]
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index ec94715..e258bf5 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -3,50 +3,98 @@
> ?# OpenCV (Open Source Computer Vision)
> ?#
> ?#############################################################
> -OPENCV_VERSION = 2.3.1a
> -OPENCV_SITE ? ?= http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/opencvlibrary/opencv-unix/2.3.1
> +OPENCV_VERSION = 2.4.1
> +OPENCV_SITE ? ?= http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
> ?OPENCV_SOURCE ?= OpenCV-$(OPENCV_VERSION).tar.bz2
> ?OPENCV_INSTALL_STAGING = YES
>
> ?OPENCV_CONF_OPT = \
> - ? ? ? -DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release) \
[...]
> + ? ? ? -DENABLE_PRECOMPILED_HEADERS=OFF ? ? ? ?\
> + ? ? ? -DENABLE_PROFILING=OFF ? ? ? ? ? ? ? ? ?\
> + ? ? ? -DENABLE_SOLUTION_FOLDERS=OFF ? ? ? ? ? \
> + ? ? ? -DENABLE_POWERPC=$(if $(BR2_POWERPC_CPU_G3),ON,OFF) ?\
Note that I'm not sure about this configure options...
Indeed, looking at the sources, setting ENABLE_POWERPC=ON adds
'-mcpu=G3 -mtune=G5' to the cflags...

I'm not sure how these may conflict with those set by Buildroot.
Any inputs about this are welcome.

> + ? ? ? -DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF) ? ? \
> + ? ? ? -DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF) ? \
> + ? ? ? -DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) ? \
[...]


Cheers,

-- 
Sam
