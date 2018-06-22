From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 22 Jun 2018 12:45:04 +0200
Subject: [Buildroot] sun8i-h3: sunxi-mali-mainline package with
 linux-next
In-Reply-To: <CAMty3ZDZucZpr-4M=CCc9nLM=XTKGr5qySDe4Zq5O7t_xov+Jg@mail.gmail.com>
References: <CAMty3ZDZucZpr-4M=CCc9nLM=XTKGr5qySDe4Zq5O7t_xov+Jg@mail.gmail.com>
Message-ID: <a3dc995f-c1a7-6cc9-e1c9-cefdf590a659@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Resend, I was not subscribed to ML sorry.

Hi Jagan,

Il 21/06/2018 19:22, Jagan Teki ha scritto:
> Hi,
> 
> I'm trying to use sunxi-mali-mainline with linux-next for H3 platform.
> 
> Since Mali dt support is already added on linux-next, So I've directly
> used buildroot and enabled necessary options.

I would suggest you to use master branch or at least 4.17 version 
instead of linux-next.
But I'm not sure this is the root-cause.
Maybe give it a try if you can.

> 
> Look like Mali initialization seems failing. I've not investigated
> further but just to post if anyone found this already and seeking for
> help.
> 
> Log:
> # modprobe -a mali
> [   43.364438] mali: loading out-of-tree module taints kernel.
> [   43.379577] Allwinner sunXi mali glue initialized
> [   43.568791] Mali: ERR:
> /home/jagan/work/code/buildroot/output/build/sunxi-mali-mainline-driver-52ef1c5e133cc5fd791ca636239dc5e7b19c26d5/r6p2/src/devicedrv/mali/common/mali_pp.c
> [   43.584511]            mali_pp_reset_wait() 269
> [   43.584511]
> [   43.584516] Mali PP: Failed to reset core Mali_PP0, rawstat: 0x00000000
> [   43.598088]
> [   43.599585] Mali: ERR:
> /home/jagan/work/code/buildroot/output/build/sunxi-mali-mainline-driver-52ef1c5e133cc5fd791ca636239dc5e7b19c26d5/r6p2/src/devicedrv/mali/common/mali_kernec
> [   43.616079]            mali_parse_product_info() 174
> [   43.616079]
> [   43.616091] Failed to create initial PP object
> [   43.627935]
> [   43.629486] Mali: ERR:
> /home/jagan/work/code/buildroot/output/build/sunxi-mali-mainline-driver-52ef1c5e133cc5fd791ca636239dc5e7b19c26d5/r6p2/src/devicedrv/mali/linux/mali_kernelc
> [   43.645995]            mali_probe() 606
> [   43.645995]
> [   43.645998] mali_probe(): Failed to initialize Mali device driver.
> [   43.652267]
> [   43.659966] mali-utgard: probe of mali-utgard.0 failed with error -14
> [   43.666447] Mali:
> [   43.666449] Mali device driver loaded

IMHO this is very specific to driver more than buildroot package and
I suggest you to open an issue on https://github.com/mripard/sunxi-mali
So everything dealing with driver is treated there and maybe it's a 
better place to find help and keep trace for the others
(hope it's the right way, this is my first package maintained in 
Buildroot, so I don't know if I'm doing good, please let me know Peter, 
Maxime, Thomas and others, thanks).

Kind regards
Giulio
