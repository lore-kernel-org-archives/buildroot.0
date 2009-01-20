From: Cyril HAENEL <chaenel@free.fr>
Date: Tue, 20 Jan 2009 14:35:42 +0100
Subject: [Buildroot] Buildroot compilation blocks on LZO package
Message-ID: <4975D32E.7020602@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I try to build a rootfs based on 
http://buildroot.uclibc.org/downloads/buildroot-2009.02-rc1.tar.gz

After unpacking, I done make menuconfig and done very small things :

- Put Target Architecture to Arm
- Put Target Architecture variant tp generic_arm
- Put Filesystem for target device to jffs2, and not ext2

After that, a make the build works well until it reach the LZO package.
The configure script blocks on this line :

checking whether we are using the GNU C++ compiler...

I must stop the build with ctrl-c because it never stops.

I looked in the configure script 
(buildroot-2009.02-rc1/build_arm/lzo-2.03/configure), and after some 
echo, I found that the script block on lines 5535/5536 :

if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
  (eval $ac_compile) 2>conftest.er1
 
Any idea ?

Regards,
Cyril HAENEL






-- 

Cyril Haenel
Registered Linux User #332632
