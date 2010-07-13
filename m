From: Ossy <ossy1980@gmx.net>
Date: Tue, 13 Jul 2010 22:43:28 +0200
Subject: [Buildroot] mkfs.xfs without xfs library - not possible to
 create xfsfs
In-Reply-To: <4C3A1F60.7050009@gmx.net>
References: <4C3A1F60.7050009@gmx.net>
Message-ID: <4C3CCFF0.3080407@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 11.07.2010 21:45, schrieb Ossy:
> Hi mailinglist,
>
> I tried to create an xfs filesystem. Unfortunatly there is a library
> missing. I looked around in the configuration menu, but all I found were
> the xfsprogs. Under libraries/filesystem there is no xfslib either.
>
> $ ./sbin/mkfs.xfs
> ./sbin/mkfs.xfs: can't load library 'libxfs.so.0'
>
The config.log of xfsprogs-3.0.3 includes a link to some e2fs library path:
...
configure:2544: checking for C compiler default output file name
configure:2566: 
/home/ossy/buildroot/buildroot-dev/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc 
--sysroot=/home/ossy/buildroot
/buildroot-dev/output/staging -Os -pipe -Os  -mtune=arm926ej-s 
-march=armv5te -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE 
-D_LARGEFIL
E64_SOURCE -D_FILE_OFFSET_BITS=64 
-I/home/ossy/buildroot/buildroot-dev/output/staging/usr/include 
-I/home/ossy/buildroot/buildroot-dev/outpu
t/staging/include 
-I/home/ossy/buildroot/buildroot-dev/output/build/e2fsprogs-1.41.12/lib 
-L/home/ossy/buildroot/buildroot-dev/output/build/
e2fsprogs-1.41.12/lib conftest.c  >&5
...

I do not expect an e2fs-library path in xfsprogs.config. Maybe a 
dependency to e2fs? Or is it just a bug?

I bumbed xfsprogs to 3.1.2 temporarily but this version failed to build.

Newer kernel versions and newer xfsprogs version fixes some issues for 
using xfs on arm devices.

Regards,
Marcus
