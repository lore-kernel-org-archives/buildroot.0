From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Wed, 9 Apr 2008 13:47:41 +0200
Subject: [Buildroot] Editing filesystem files
References: <111801c89984$f480be70$f52f9e86@LPSC0173W>
Message-ID: <11ea01c89a37$87cb1010$f52f9e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following up on this, when do the files in target/generic/target_skeleton 
get copied in project_build_powerpc/genepy/root  ?

It seems to happen the very first time in run make and then never again, no 
matter what I try (even after make clean).

The documentation says:
"So simply rebuilding the image by running make should propagate any new 
changes to the image."
but I just don't see that happening, even if I "rm -rf 
project_build_powerpc/genepy/root" (only dynamically created files get 
rebuilt there then).
-- 
Guillaume Dargaud
http://www.gdargaud.net/


----- Original Message ----- 
From: "Guillaume Dargaud" <dargaud@lpsc.in2p3.fr>
To: <buildroot@uclibc.org>
Sent: Tuesday, April 08, 2008 16:29
Subject: [Buildroot] Editing filesystem files


> Hello all,
> thanks to the support I got here, I now have a nice boot on my ml405 and I
> get to the login with no error. Which brings me to the question:
>
> - how do I login ?
> If I type 'root' it refuses without even asking for a password, so I guess
> ttyUL0 is not allowed by /etc/securetty
>
> - how do I edit the various target files (/etc/securetty, /etc/passwd,
> /etc/shadow...) _before_ creating the ramdisk ?
>
> I mean, I could unzip rootfs.powerpc.ext2.gz, mount it, edit it, rezip it
> and then proceed with the kernel 'make ARCH=ppc
> CROSS_COMPILE=powerpc-linux-uclibc- zImage.initrd' and genace, but if I 
> ever
> do 'make' in buildroot again, I'll loose all my changes.
>
> I see target/generic/target_skeleton/etc/shadow and
> target/generic/target_busybox_skeleton/etc/shadow but if I modify files in
> there and do 'make' again, the new project_build_powerpc/genepy/root/ or
> ramdisk file don't reflect the changes. Do I need to make clean or 
> something
> ?
>
> Thanks
> -- 
> Guillaume Dargaud
> http://www.gdargaud.net/
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
> 
