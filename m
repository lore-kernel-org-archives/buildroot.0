From: rscr <rafacrespiramon@gmail.com>
Date: Tue, 28 Jan 2020 01:41:07 -0600 (CST)
Subject: [Buildroot] QtWebEngine on RPI 0 W
In-Reply-To: <20200125172550.45366ce5@gmx.net>
References: <1579861270269-0.post@n4.nabble.com>
 <20200125172550.45366ce5@gmx.net>
Message-ID: <1580197267384-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi,
>
> I have built a custom image for RPI 0 W. Now I need QT with QtWebEngine.
>
> - As I am using  toolchain *arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf*, I
> have to use Qt 5.6.3 because it is supported by GCC > 4.8
>
>Why stay with this old-gcc-version toolchain?

- This toolchain is the one recommended in raspberry/tools github: 
https://github.com/raspberrypi/tools/blob/master/arm-bcm2708/arm-linux-gnueabihf
<https://github.com/raspberrypi/tools/blob/master/arm-bcm2708/arm-linux-gnueabihf>  

If there is a new version, I didn't know it. I could use, for example, these
toolchains? https://github.com/abhiTronix/raspberry-pi-cross-compilers
<https://github.com/abhiTronix/raspberry-pi-cross-compilers>  

>
> ISSUE:
>
> When trying to build the image, I got building failed. Some of the errors
> are:
>
> Running configuration tests (phase 1)...
> /home/ibercomp/rcr/projects/cp4/buildroot/output/host/bin/arm-linux-gnueabihf-g++
> -c -fvisibility=hidden fvisibility.c
> Symbol visibility control enabled.
> collect2: fatal error: cannot find 'ld'
> compilation terminated
> ...
> Makefile:192: recipe for target 'db2.o' failed
> ...
> Makefile:192: recipe for target 'ibase.o' failed
> ...
> Makefile:195: recipe for target 'icu.o' failed
> make[2]: *** [icu.o] Error 1
> ICU disabled.
> The ICU library support cannot be enabled.
>
>
> Find attached my defconfig: cp4_defconfig.cp4_defconfig
> <http://buildroot-busybox.2317881.n4.nabble.com/file/t2824/cp4_defconfig.cp4_defconfig>
>
>Important information missing, which buildroot version do you use?

I am using buildroot-2019.02.09

I will build the image again to provide the complete failure output....but
If there is any solution where I could keep using QT 5.11.3 version with a
GCC > 5 I prefer it.

Kind Regards, 

Rafa









--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
