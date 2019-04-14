From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 22:28:48 +0200
Subject: [Buildroot] [PATCH 1/1] boot/syslinux: fix build with binutils
 note gnu property section
In-Reply-To: <20190405064055.19030-1-christian@paral.in> (Christian Stewart's
 message of "Thu, 4 Apr 2019 23:40:55 -0700")
References: <20190405064055.19030-1-christian@paral.in>
Message-ID: <87y34cnxfj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > This fixes the following build error with newer binutils:
 >   objcopy -O binary mbr.elf mbr.bin
 >   perl /build/syslinux/src/syslinux/mbr/checksize.pl mbr.bin
 >   mbr.bin: too big (452 > 440)

 > Corresponding bug reports:

 >  - https://bugs.archlinux.org/task/60405
 >  - https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=906414

 > Strips the .note.gnu.property in the linker scripts for the MBRs.

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
