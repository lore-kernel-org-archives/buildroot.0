From: Mylene Josserand <mylene.josserand@free-electrons.com>
Date: Mon, 25 Apr 2016 10:57:15 +0200
Subject: [Buildroot] [help] Nitrogen6X with Vivante : restart on Qt5 examples
Message-ID: <571DDBEB.7070100@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


I am currently trying OpenGL with Vivante driver on a Nitrogen6X using 
Buildroot.

Previously, I got an segfault error while starting X.
"Segmentation fault at address 0xe0"

Thanks to Gary Bisson (in cc), using the galcore module from Buildroot 
(BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV=y) and not the kernel one + 
updating the kernel to 3.14.28, solved the issue.

With the galcore driver loaded using insmod, the Vivante is, now, working.

I compiled Qt5 examples (BR2_PACKAGE_QT5BASE_EXAMPLES=y) and I tested 
some openGL examples :
    - "qopenglwindow" : This example is working fine
    - "textures" example : in many case, the board restarts when the 
application is launched.
    - "hellogl" : I see the Qt logo from the example but when I try to 
move the object, the board restarts.

Here is my Xorg.log, in case it could help : 
http://paste.debian.net/hidden/609ae872/

Each time the board reboots, I get an "POR" reset cause in UBoot.


Maybe, I have a misconfiguration or I am doing something wrong.
Any help would be great !


Thank you in advance,

Best regards

-- 
Myl?ne Josserand, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
