From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 10:03:28 +0200
Subject: [Buildroot] STM32F767ZI Nucleo
In-Reply-To: <f844ef8357b0480a9d8e8cf8e1414c44@baur.at>
References: <f844ef8357b0480a9d8e8cf8e1414c44@baur.at>
Message-ID: <20180920100328.3d5ff046@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Sep 2018 07:35:09 +0000, Czybor Michael wrote:

> i'am new with Buildroot. I have some experiences with Petalinux from Xilinx. Now I will "create" a linux image for my STM32-Board.
> 
> I have a Windows 7 PC and a VMWare-Ubuntu-Machine.
> 
> 1.)    Is there a Buildroot-Config for my Board?

No, and from a quick read the STM32F767ZI Nucleo doesn't seem to have
external RAM, so only the RAM inside the MCU is available, and its size
is insufficient to run Linux. Are you sure it is possible to run Linux
on this specific board ?

We have existing configurations for two other STM32 boards, which have
external RAM, and are therefore able to run Linux:

  configs/stm32f429_disco_defconfig
  configs/stm32f469_disco_defconfig

> 2.)    I made an example image with a STM32F4-Config, in the Output directory where several files. What is the meaning of that files?

Please read the Buildroot manual and the slides at
https://bootlin.com/doc/training/buildroot/buildroot-slides.pdf.
There's plenty of documentation available that explains what's in the
output/ folder.

> 3.)    What is the right tool to "Flash" the output files to my board?

It depends on your board.

> 4.)    How can I debug and develop an app on the running linux image made with Buildroot and can I use VisualGDB for that purpose?

If you can indeed run Linux (see point 1), then you can do
remote debugging, as explained in
https://bootlin.com/doc/training/buildroot/buildroot-slides.pdf slide
275 and following.

I had never heard of VisualGDB, but I guess it's just an UI on top of
GDB, so you should be able to do remote debugging as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
