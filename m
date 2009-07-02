From: Neil Cherry <ncherry@linuxha.com>
Date: Thu, 02 Jul 2009 14:04:59 -0400
Subject: [Buildroot] Following direction, but failing to compile
Message-ID: <4A4CF6CB.40201@linuxha.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been having a few problems getting BuildRoot to work. So I
decided to fall back, read and follow the directions. But this
too has failed.

What I've done is:

tar jxvf buildroot-2009.05.tar.bz2
cd buildroot-2009.05
make menuconfig
make

When I'm compiling all goes well until I hit this:

	:
  DEPMOD  2.6.29.4-test
make[1]: Leaving directory
`/home/njc/stuff/buildroot-2009.05/project_build_i586/LORHA/linux-2.6.29.4'
+ rm -f
/home/njc/stuff/buildroot-2009.05/project_build_i586/LORHA/root/lib/modules/2.6.29.4/build
/home/njc/stuff/buildroot-2009.05/project_build_i586/LORHA/root/lib/modules/2.6.29.4/source
+ /home/njc/stuff/buildroot-2009.05/build_i586/staging_dir/bin/i586-linux-depmod26 -b
/home/njc/stuff/buildroot-2009.05/project_build_i586/LORHA/root 2.6.29.4
WARNING: Couldn't open directory
/home/njc/stuff/buildroot-2009.05/project_build_i586/LORHA/root/lib/modules/2.6.29.4: No
such file or directory
FATAL: Could not open
/home/njc/stuff/buildroot-2009.05/project_build_i586/LORHA/root/lib/modules/2.6.29.4/modules.dep.temp
for writing: No such file or directory
make: ***
[/home/njc/stuff/buildroot-2009.05/project_build_i586/LORHA/root/lib/modules/2.6.29.4/modules.dep]
Error 1

I'm having trouble finding where the sequence of commands are
executed so I can figure out why the directory is not being created.

I can go into the linux-2.6.29.4 directory and manually compile
the kernel with no errors.

Any pointers would be appreciated.

Thanks

-- 
Linux Home Automation         Neil Cherry       ncherry at linuxha.com
http://www.linuxha.com/                         Main site
http://linuxha.blogspot.com/                    My HA Blog
Author of:    	Linux Smart Homes For Dummies
