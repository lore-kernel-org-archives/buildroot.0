From: Jens Kleinhans <Jens.Kleinhans@gmx.de>
Date: Thu, 03 Dec 2009 12:36:49 +0100
Subject: [Buildroot] make uImage
Message-ID: <20091203113649.297300@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I crosscompiled the kernel 2.6.20 and now I want to make a uImage out of the zImage. I found the following command for making uImage. But when I type only options are shown. How can I build the uImage the right way?

root at benjamin-laptop:/usr/src/linux/arch/arm/boot# ls
bootp  compressed  Image  install.sh  Makefile  zImage
root at benjamin-laptop:/usr/src/linux/arch/arm/boot# mkimage -A arm -O linux -C none -T kernel -a 20008000 -e 20008000 -n linux-2.6 -d arch/arm/boot/zImage uImage
mkimage [OPTIONS]

 Options:
 -f <MD5 name>       Specify an input MD5 file. MD5s must be in jigdo's
                     pseudo-base64 format
 -j <jigdo name>     Specify the input jigdo file
 -t <template name>  Specify the input template file
 -m <item=path>      Map <item> to <path> to find the files in the mirror
 -M <missing name>   Rather than try to build the image, just check that
                     all the needed files are available. If any are missing,
                     list them in this file.
 -v                  Make the output logging more verbose
 -l <logfile>        Specify a logfile to append to.
                     If not specified, will log to stderr
 -o <outfile>        Specify a file to write the ISO image to.
                     If not specified, will write to stdout
 -q                  Quick mode. Don't check MD5sums. Dangerous!
 -s <bytenum>        Start byte number; will start at 0 if not specified
 -e <bytenum>        End byte number; will end at EOF if not specified
 -z                  Don't attempt to rebuild the image; simply print its
                     size in bytes

-- 
Sarah Kreuz, die DSDS-Siegerin der Herzen, mit ihrem eindrucksvollen           
Deb?talbum "One Moment in Time". http://portal.gmx.net/de/go/musik

-- 
Sarah Kreuz, die DSDS-Siegerin der Herzen, mit ihrem eindrucksvollen           
Deb?talbum "One Moment in Time". http://portal.gmx.net/de/go/musik
