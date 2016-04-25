From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 25 Apr 2016 11:18:50 +0200
Subject: [Buildroot] [help] Nitrogen6X with Vivante : restart on Qt5
	examples
In-Reply-To: <571DDBEB.7070100@free-electrons.com>
References: <571DDBEB.7070100@free-electrons.com>
Message-ID: <CAAMH-yvb3G6gp+N9yGFAK7GNPAxy9m25Zjn5-QqHko-aMeJmSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mylene, All,

On Mon, Apr 25, 2016 at 10:57 AM, Mylene Josserand
<mylene.josserand@free-electrons.com> wrote:
> Hi,
>
>
> I am currently trying OpenGL with Vivante driver on a Nitrogen6X using
> Buildroot.

Can you specify which version of Buildroot? v2016.02 or master or older?

This will help a lot to know the version of Qt, X11 etc...

> Previously, I got an segfault error while starting X.
> "Segmentation fault at address 0xe0"
>
> Thanks to Gary Bisson (in cc), using the galcore module from Buildroot
> (BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV=y) and not the kernel one + updating
> the kernel to 3.14.28, solved the issue.
>
> With the galcore driver loaded using insmod, the Vivante is, now, working.

Same here, please specify the exact Vivante libraries version
(5.0.11p6.3 or 7.1).

> I compiled Qt5 examples (BR2_PACKAGE_QT5BASE_EXAMPLES=y) and I tested some
> openGL examples :
>    - "qopenglwindow" : This example is working fine
>    - "textures" example : in many case, the board restarts when the
> application is launched.
>    - "hellogl" : I see the Qt logo from the example but when I try to move
> the object, the board restarts.
>
> Here is my Xorg.log, in case it could help :
> http://paste.debian.net/hidden/609ae872/

Can you share you xorg.conf? Also specify your setup, how many
displays connected, which port (HDMI, LVDS, RGB etc..).

> Each time the board reboots, I get an "POR" reset cause in UBoot.

Well then it's a feature, the Qt app appears to be restarting the
board properly ;-)

> Maybe, I have a misconfiguration or I am doing something wrong.
> Any help would be great !

This might sound strange, but please also provide the U-Boot version
you are using. The reason is that we offer a wide range of displays,
since we want customers to have a plug and play experience we've added
something for kernel >=3.14 where U-Boot is in charge of modifying the
device tree on the fly to setup the displays properly.

Finally, can you upload your image for me to try?

Thanks,
Gary
