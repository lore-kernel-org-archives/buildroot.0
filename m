From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2011 14:34:28 +0200
Subject: [Buildroot] [PATCH v2] package: add opencv
In-Reply-To: <1313645536-8381-1-git-send-email-s.martin49@gmail.com>
References: <1313645536-8381-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20110818143428.160f2289@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new version, looks much better.

Le Thu, 18 Aug 2011 07:32:16 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> +HOST_OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_OPENCV_BUILD_NEW_PYTHON_SUPPORT),host-python,)

Why do you need a host version of OpenCV ? I don't see where the
host-opencv package is being used.

Also, just a matter of taste, but I would prefer if you grouped
together the OPENCV_CONF_OPT += and OPENCV_DEPENDENCIES += lines
related to a given option. I.e, the lines:

+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_OPENCV_BUILD_NEW_PYTHON_SUPPORT),python,)

and

+OPENCV_CONF_OPT += -DBUILD_NEW_PYTHON_SUPPORT=$(if $(BR2_PACKAGE_OPENCV_BUILD_NEW_PYTHON_SUPPORT),ON,OFF)

should be next to each other.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
