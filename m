From: Fabrice Mousset | GEOCEPT GmbH <fabrice.mousset@geocept.com>
Date: Tue, 23 Oct 2018 06:34:39 +0000
Subject: [Buildroot] Linux driver load failure with BR 2018.05
In-Reply-To: <CAOMZO5A6mEfxx63qwzQwkGiGUfcog+Qq_-iM+ocJkTwq+n0Bfg@mail.gmail.com>
References: <AM4PR0802MB2210297D6D99BC3630A51C1BEAF40@AM4PR0802MB2210.eurprd08.prod.outlook.com>
 <CAOMZO5A6mEfxx63qwzQwkGiGUfcog+Qq_-iM+ocJkTwq+n0Bfg@mail.gmail.com>
Message-ID: <VI1PR0802MB222117E26BBCC677A6F52306EAF50@VI1PR0802MB2221.eurprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio and Arnout,

> In the latest Buildroot version we have:
> 
> configs/imx6sx-sdb_defconfig: which uses kernel mainline 4.14
> configs/freescale_imx6sxsabresd_defconfig: which uses NXP 4.9 kernel
> 
> None of them use 4.1.15, so it seems you have selected an old kernel for your
> target.
> 
> I would suggest you to use mainline kernel if you can.

Yes I know this is not an "up to date" Kernel Version, but it is the used by the board manufacturer which we are using.
I have ported a Yocto/Poky BSP to BuildRoot, to not have to use multiple build tools... and in my eyes, Yocto is too big and complex.

I have notice a strange something which looks strange to me in the kernel build command.
After the "make -j9" then is a HOSTCC="/usr/bin/gcc -02  -I/opt/crosstools/sitec-s4/include ..."

Why HOSTCC is using /usr/bin/gcc and not /opt/crosstools/sitec-s4/bin/arm-geocept-linux-gnueabihf-gcc ?

Is there something wrong in my BSP?

> This is an indication that you built the bcmdhd module with a different configuration (or maybe even different kernel version) 
> than whatever module (or core kernel) is  providing alloc_etherdev_mqs. When you do a proper kernel build, it shouldn't 
> happen though. So it looks like you didn't properly install everything to your target (e.g. you updated the modules but not the kernel).

To build and install my Linux kernel and modules, I only use "make linux". Those drivers are from the linux source tree. No external drivers are used.

Best regards

Fabrice
