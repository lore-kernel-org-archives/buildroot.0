From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 21 Jun 2018 22:52:15 +0530
Subject: [Buildroot] sun8i-h3: sunxi-mali-mainline package with linux-next
Message-ID: <CAMty3ZDZucZpr-4M=CCc9nLM=XTKGr5qySDe4Zq5O7t_xov+Jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to use sunxi-mali-mainline with linux-next for H3 platform.

Since Mali dt support is already added on linux-next, So I've directly
used buildroot and enabled necessary options.

Look like Mali initialization seems failing. I've not investigated
further but just to post if anyone found this already and seeking for
help.

Log:
# modprobe -a mali
[   43.364438] mali: loading out-of-tree module taints kernel.
[   43.379577] Allwinner sunXi mali glue initialized
[   43.568791] Mali: ERR:
/home/jagan/work/code/buildroot/output/build/sunxi-mali-mainline-driver-52ef1c5e133cc5fd791ca636239dc5e7b19c26d5/r6p2/src/devicedrv/mali/common/mali_pp.c
[   43.584511]            mali_pp_reset_wait() 269
[   43.584511]
[   43.584516] Mali PP: Failed to reset core Mali_PP0, rawstat: 0x00000000
[   43.598088]
[   43.599585] Mali: ERR:
/home/jagan/work/code/buildroot/output/build/sunxi-mali-mainline-driver-52ef1c5e133cc5fd791ca636239dc5e7b19c26d5/r6p2/src/devicedrv/mali/common/mali_kernec
[   43.616079]            mali_parse_product_info() 174
[   43.616079]
[   43.616091] Failed to create initial PP object
[   43.627935]
[   43.629486] Mali: ERR:
/home/jagan/work/code/buildroot/output/build/sunxi-mali-mainline-driver-52ef1c5e133cc5fd791ca636239dc5e7b19c26d5/r6p2/src/devicedrv/mali/linux/mali_kernelc
[   43.645995]            mali_probe() 606
[   43.645995]
[   43.645998] mali_probe(): Failed to initialize Mali device driver.
[   43.652267]
[   43.659966] mali-utgard: probe of mali-utgard.0 failed with error -14
[   43.666447] Mali:
[   43.666449] Mali device driver loaded
# /usr/lib/qt/examples/opengl/hellowindow/hellowindow
QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-root'
QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-root'
Could not initialize egl display
Aborted


Jagan.

-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
