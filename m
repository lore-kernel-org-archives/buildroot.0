From: Lars Dunemark <ladu@hms.se>
Date: Tue, 16 Apr 2013 11:16:28 +0000
Subject: [Buildroot] Problem with external toolchain sysroot and eclipse
References: <6119D107D82B0940B389FAED3F2DDE66158823C4@Ansuz.hms.se>
 <20130416093325.57cfc00e@skate> 
Message-ID: <6119D107D82B0940B389FAED3F2DDE6615882483@Ansuz.hms.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > What is /media/build/source/toolchain/ ? How did you install things in there ?
> 
> The toolchain I'm using is created with crosstool-ng outside of buildroot.

I have tried this with 
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_PREFIX="arm-none-linux-gnueabi"

And get same problem with paths.

Eg absolute path works:
$ ./output/host/usr/bin/arm-none-linux-gnueabi-gcc
arm-none-linux-gnueabi-gcc: fatal error: no input files

and using PATH failes:
$ pwd
/media/build/source/buildroot
$ arm-none-linux-gnueabi-gcc
/media/build/opt/ext-toolchain/bin/arm-none-linux-gnueabi-gcc: No such file or directory

Best regards
Lars Dunemark
