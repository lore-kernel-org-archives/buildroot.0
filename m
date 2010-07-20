From: Ossy <ossy1980@gmx.net>
Date: Tue, 20 Jul 2010 23:22:42 +0200
Subject: [Buildroot] xfsprogs 3.0.3 without libxfs in rootfs
Message-ID: <4C4613A2.90006@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi mailinglist,

Since xfsprogs 3.0.3 doesn't build the required xfslib in the current 
tree. I tried to bump to the newer version.
I figured out, that that br uses the old util-linux and not 
util-linux-ng. According to the debian package info, xfsprogs 3.1.2 
needs at least util-linux-ng 2.16. So I ran a green try with the 
util-linux-ng patch I've found in the mailinglist archives:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/16587/match=util+linux+ng

Unfortunatly the build fails, because make claims about an unknown 
option "--sysroot":
/usr/bin/make -j2 \
                 -C 
/home/ossy/buildroot/buildroot-dev/output/build/util-linux-ng-2.16 \
                 ARCH=arm \
 
CC=/home/ossy/buildroot/buildroot-dev/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc 
--sysroot=/home/ossy/buildr
oot/buildroot-dev/output/staging \
                 OPT="-Os -pipe -Os  -mtune=arm926ej-s -march=armv5te 
-mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURC
E -D_FILE_OFFSET_BITS=64 
-I/home/ossy/buildroot/buildroot-dev/output/staging/usr/include 
-I/home/ossy/buildroot/buildroot-dev/output/staging
/include" \
                 HAVE_SLANG="NO"
/usr/bin/make: Unbekannte Option 
?--sysroot=/home/ossy/buildroot/buildroot-dev/output/staging?

It is the same make, used for all the other packages....

Further output complains about x64 compilation in addition:
This program built for x86_64-pc-linux-gnu
make: *** 
[/home/ossy/buildroot/buildroot-dev/output/build/util-linux-ng-2.16/misc-utils/chkdupexe] 
Fehler 2

I hardly see any differences in config.log compared to other 
successfully compiled packages.

I'm building on debian squeeze amd64 for target armv5TE.

Thanks for any hint.

Regards,
Marcus
