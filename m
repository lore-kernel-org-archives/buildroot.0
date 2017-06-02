From: David Picard <davepiq@yahoo.fr>
Date: Fri, 2 Jun 2017 15:27:06 +0200
Subject: [Buildroot] Beaglebone Black : tweaking the device tree
Message-ID: <d1331942-3474-94b7-8746-99c6f1b342a0@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I need to enable the CAN bus on the Beaglebone Black. To do so, I need 
to play with the device tree.

Thanks to the example I found [1] and some other references, I can 
picture roughly what to write in some dts file.

But still, I wonder what is the proper way to modify a device tree in 
Buildroot ?


- Are device tree overlays supported in Buildroot ?
- If not, should I patch or include 
arch/arm/boot/dts/arm335x-boneblack.dts ?
- What is the purpose of BR2_TARGET_UBOOT_CUSTOM_DTS_PATH ?
- Where should I save my .dts (I'm building out of tree).


David.


[1] Example :
-------------
I successfully enabled the CAN bus on Debian installed by default on the 
eMMC using this guide (uses device a tree overlay):
http://www.embedded-things.com/bbb/enable-canbus-on-the-beaglebone-black/


My config :
-----------
Buildroot 2017.05, beaglebone_qt5_defconfig, kernel v4.1, plus this patch :
https://patchwork.ozlabs.org/patch/762346/
