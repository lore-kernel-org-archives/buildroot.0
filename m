From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Tue, 25 Feb 2014 11:17:54 +0100
Subject: [Buildroot] Few questions external toolchain
In-Reply-To: <530B8CEA.90306@gmail.com>
References: <530B8CEA.90306@gmail.com>
Message-ID: <530C6DD2.4070605@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


After digging a bit more I found the following:

ls -l ~/dev/buildroot/output/host/usr/bin/*gcc

lrwxrwxrwx 1 marco marco     21 feb 25 11:00 arm-fsl-linux-gnueabi-gcc 
-> ext-toolchain-wrapper
-rwxr-xr-x 1 marco marco   5908 feb 25 11:00 ext-toolchain-wrapper


./arm-fsl-linux-gnueabi-gcc
arm-fsl-linux-gnueabi-gcc: fatal error: no input files

it's ok, but:

./ext-toolchain-wrapper
/home/marco/dev/fsl-linaro-toolchain/bin/ext-toolchain-wrapper: No such 
file or directory

I don't understand this behavior and I didn't find any information about 
in the documentation. Did I searched wrong?
Thanks
Marco


Il 24/02/2014 19:18, Marco Trapanese ha scritto:
> Hello,
> after reading the documentation I still have some questions.
> I want to use a Linaro toolchain for an imx6 board.
>
> The toolchain is hosted on a git repository, and I don't understand 
> how to tell this to buildroot. It seems it looks for a tar.gz file.
>
> Anyway I tried to manually git clone the toolchain and I passed the 
> directory of the local repo.
> When it tries to compile something it returns:
>
> checking for arm-buildroot-linux-gnueabi-gcc... 
> /home/marco/dev/buildroot/output/host/usr/bin/arm-fsl-linux-gnueabi-gcc
> checking whether the C compiler works... no
> configure: error: in 
> `/home/marco/dev/buildroot/output/build/alsa-lib-1.0.26':
>
> the path is correct, but why it looks for 
> "arm-buildroot-linux-gnueabi-gcc"? It seems the internal toolchain!
>
> Attached there is my .config file and the buildroot version is: 
> 2014.02-rc2
>
> Thanks!
> Marco
>
>
