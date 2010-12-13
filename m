From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Dec 2010 17:44:44 +0100
Subject: [Buildroot] can't compile mplayer for ARM with actual buildroot
 5a6f6bfe885754955b615ca9353baa3496682c6f
In-Reply-To: <AANLkTimto_ZpVXosSAAv8YtVS6o+o94y12MU3mx5cOcj@mail.gmail.com>
References: <AANLkTimto_ZpVXosSAAv8YtVS6o+o94y12MU3mx5cOcj@mail.gmail.com>
Message-ID: <20101213174444.3b328c36@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Dec 2010 11:48:03 +0100
Belisko Marek <marek.belisko@gmail.com> wrote:

> Trying to compile mplayer for ARM produce following error:
> 
> buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
> --sysroot=/home/open-nandra/projects/buildroot/output/staging
> -I../libswscale -I../libavcodec  -DHAVE_AV_CONFIG_H -D_ISOC9X_SOURCE
> -I.. -I.. -I../libavutil -Wdisabled-optimization -Wno-pointer-sign
> -Wdeclaration-after-statement -I. -I.. -I../libavutil -pipe -Os
> -mtune=arm920t -march=armv4t -mabi=aapcs-linux -msoft-float
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -I/home/open-nandra/projects/buildroot/output/staging/usr/include
> -I/home/open-nandra/projects/buildroot/output/staging/include
> -D_REENTRANT -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
> -D_LARGEFILE64_SOURCE -DHAVE_CONFIG_H
> -I/home/open-nandra/projects/buildroot/output/staging/usr/include   -c
> -o armv4l/dsputil_arm_s.o armv4l/dsputil_arm_s.S
> armv4l/dsputil_arm_s.S: Assembler messages:
> armv4l/dsputil_arm_s.S:79: Error: selected processor does not support
> `pld [r1]' armv4l/dsputil_arm_s.S:90: Error: selected processor does
> not support `pld [r1]' armv4l/dsputil_arm_s.S:100: Error: selected
> processor does not support `pld [r1]'
> armv4l/dsputil_arm_s.S:111: Error: selected processor does not support
> `pld [r1]'

mplayer is using optimized assembly code that isn't valid for the
selected armv4t architecture.

Could you post the full mplayer build log ?

For information, I just sent yesterday a new version of the mplayer
package, that uses a very recent mplayer compared to the 1.0-rc2
currently packaged in Buildroot. You'll find the patch on the list if
you want to try.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
