From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Tue, 8 Apr 2008 16:29:18 +0200
Subject: [Buildroot] Editing filesystem files
Message-ID: <111801c89984$f480be70$f52f9e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
thanks to the support I got here, I now have a nice boot on my ml405 and I 
get to the login with no error. Which brings me to the question:

- how do I login ?
If I type 'root' it refuses without even asking for a password, so I guess 
ttyUL0 is not allowed by /etc/securetty

- how do I edit the various target files (/etc/securetty, /etc/passwd, 
/etc/shadow...) _before_ creating the ramdisk ?

I mean, I could unzip rootfs.powerpc.ext2.gz, mount it, edit it, rezip it 
and then proceed with the kernel 'make ARCH=ppc 
CROSS_COMPILE=powerpc-linux-uclibc- zImage.initrd' and genace, but if I ever 
do 'make' in buildroot again, I'll loose all my changes.

I see target/generic/target_skeleton/etc/shadow and 
target/generic/target_busybox_skeleton/etc/shadow but if I modify files in 
there and do 'make' again, the new project_build_powerpc/genepy/root/ or 
ramdisk file don't reflect the changes. Do I need to make clean or something 
?

Thanks
-- 
Guillaume Dargaud
http://www.gdargaud.net/
