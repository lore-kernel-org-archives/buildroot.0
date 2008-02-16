From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 15 Feb 2008 19:27:40 -0800
Subject: [Buildroot] [buildroot 0002164]: DirectFB Fails with
	--enable-static option because of incorrect ld location
Message-ID: <d338add7d7956fb6821db0c1b916ccea@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2164 
====================================================================== 
Reported By:                gururaj
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2164
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-15-2008 19:27 PST
Last Modified:              02-15-2008 19:27 PST
====================================================================== 
Summary:                    DirectFB Fails with --enable-static option because
of incorrect ld location
Description: 
Hi, 

Today i was trying to make arm926ejs toolchain with buildroot 4th feb
snapshot. I added --enable-static option in directfb.mk file. During build
i noticed that directfb is using root ld (/usr/bin/ld) instead of
arm-linux-ld build by buildroot toolchain. i renamed /usr/bin/ld to
/usr/bin/ld_orig and it failed with below error. 

Is there any way to make directfb makefile to consider buildroot toolchain
built ld instead of /usr/bin/ld 

<snip> 
<snip> 

Making install in fbdev 
make[3]: Entering directory
`/home/project/original/bldrt/buildroot/build_arm/DirectFB-1.0.1/systems/fbdev'

rm -f .libs/libdirectfb_fbdev.a.tmp/*.o 
if test -d .libs/libdirectfb_fbdev.a.tmp; then rmdir
.libs/libdirectfb_fbdev.a.tmp; fi 
mkdir .libs/libdirectfb_fbdev.a.tmp 
(cd .libs/libdirectfb_fbdev.a.tmp &&
/home/project/original/bldrt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ar
x ../../.libs/libdirectfb_fbdev.a) 
ld -o libdirectfb_fbdev.o -r .libs/libdirectfb_fbdev.a.tmp/*.o 
/bin/sh: ld: command not found 
make[3]: *** [libdirectfb_fbdev.o] Error 127 
make[3]: Leaving directory
`/home/project/original/bldrt/buildroot/build_arm/DirectFB-1.0.1/systems/fbdev'

make[2]: *** [install-recursive] Error 1 
make[2]: Leaving directory
`/home/project/original/bldrt/buildroot/build_arm/DirectFB-1.0.1/systems'

make[1]: *** [install-recursive] Error 1 
make[1]: Leaving directory
`/home/project/original/bldrt/buildroot/build_arm/DirectFB-1.0.1' 
make: ***
[/home/project/original/bldrt/buildroot/build_arm/staging_dir/usr/lib/libdirectfb.so]
Error 2 

root at guru_vlinux:~/project/original/bldrt/buildroot# ls -la /usr/bin/ld* 
-rwxr-xr-x 1 root root 430804 Jan  4 11:17 /usr/bin/ld_orig 
-rwxr-xr-x 1 root root   5871 Jan 12 15:21 /usr/bin/ldd_orig 

Regards 
Gururaja 
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-15-08 19:27  gururaj        New Issue                                    
02-15-08 19:27  gururaj        Status                   new => assigned     
02-15-08 19:27  gururaj        Assigned To               => buildroot       
======================================================================
