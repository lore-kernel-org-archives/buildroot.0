From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2014 07:56:47 +0200
Subject: [Buildroot] [PATCH v5] Add support for Congatec QMX6
In-Reply-To: <1404377182-13435-1-git-send-email-sho@relinux.de> (Stephan
 Hoffmann's message of "Thu, 3 Jul 2014 10:46:22 +0200")
References: <1404377182-13435-1-git-send-email-sho@relinux.de>
Message-ID: <87bnt13e5c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 > Add support for the iMX6 based conga-QMX6 family of Qseven modules.
 > This patch is based on Linux 3.0.35 from Congatec's kernel reporitory

 > Signed-off-by: Stephan Hoffmann <sho@relinux.de>
 > ---
 > There has been a similar patch set from
 > Lahoudere Fabien <fabien.lahoudere@openwide.fr> last year adding a patch
 > to the freescale kernel repository, but it seems more logical to me to
 > start from the board manufacturer's repo (which might not have been
 > availeable at that time).

 > Changes v1 -> v2
 >   - fix whitespace errors

 > Changes v2 -> v3
 >   Fixes according to Peter Korsgaard's review
 >   - removed unneeded boot options
 >   - fix post build script
 >   - add host uboot tools to defconfig
 >   - fix readme.txt
 >   - remove cpio from defconfig

 > Changes v3 -> v5
 >   Forgotten fix according to Peter Korsgaard's review
 >   - lock kernel version for toolchain to match kernel

 > +++ b/board/congatec/qmx6/post-build.sh
 > @@ -0,0 +1,7 @@
 > +#!/bin/sh
 > +
 > +TARGET_DIR=$1
 > +BOARD_DIR="$(dirname $0)"
 > +MKIMAGE=mkimage
 > +
 > +$MKIMAGE -A arm -O linux -T script -C none -a 0 -e 0 -n "boot script" -d $BOARD_DIR/6q_bootscript.txt $TARGET_DIR/6q_bootscript

Now that mkimage is in the path this MKIMAGE variable isn't needed (and
imho doesn't help readability), so I've dropped that and wrapped the
line.

Committed with that minor change, thanks.

-- 
Bye, Peter Korsgaard
