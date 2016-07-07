From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 09:15:41 +0200
Subject: [Buildroot] [PATCH 1/1] qt5base: Enable KMS and GBM if Mesa 3D
 provides EGL
In-Reply-To: <20160601033811.6031-2-akihiko.odaki.4i@stu.hosei.ac.jp>
References: <20160601033811.6031-1-akihiko.odaki.4i@stu.hosei.ac.jp>
 <20160601033811.6031-2-akihiko.odaki.4i@stu.hosei.ac.jp>
Message-ID: <20160707091541.1cdb5a72@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Jun 2016 12:38:09 +0900, Akihiko Odaki wrote:

> +# Uses libgbm from mesa3d
> +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
> +QT5BASE_CONFIGURE_OPTS += -kms -gbm
> +QT5BASE_DEPENDENCIES += mesa3d
> +else
> +QT5BASE_CONFIGURE_OPTS += -no-kms
> +endif

This is apparently causing some build issue:

  http://autobuild.buildroot.net/results/2d5/2d580f9439679fd8fe292e2c4dc768dff1ad1867/build-end.log

KMS auto-detection... ()
Project ERROR: libudev development package not found
KMS disabled.
 KMS support cannot be enabled due to functionality tests!
 Turn on verbose messaging (-v) to ./configure to see the final report.
 If you believe this message is in error you may use the continue
 switch (-continue) to ./configure to continue.

It looks like to enable KMS you also need udev support to be enabled.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
