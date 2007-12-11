From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 10 Dec 2007 22:20:36 -0800
Subject: [Buildroot] [buildroot 0001694]: Missing argument in makefile
Message-ID: <7946fa08a0318b3cc17ceab103cb24b9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1694 
====================================================================== 
Reported By:                martinmeba
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1694
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-10-2007 20:58 PST
Last Modified:              12-10-2007 22:20 PST
====================================================================== 
Summary:                    Missing argument in makefile
Description: 
Error when executing make
SVN revision for buildroot: 20636

modinfo.c: In function ?main?:
modinfo.c:338: warning: ?infosize? may be used uninitialized in this
function
/usr/bin/gcc  -g -O2 -Wunused -Wall   -o modinfo  modinfo.o zlibsupport.o 

/usr/bin/gcc  -g -O2 -Wunused -Wall   -o insmod.static -static insmod.o  
make[1]: Leaving directory
`/home/martin/buildroot/toolchain_build_arm_nofpu/module-init-tools-3.2.2'
touch -c
/home/martin/buildroot/toolchain_build_arm_nofpu/module-init-tools-3.2.2/depmod
/usr/bin/install -D
/home/martin/buildroot/toolchain_build_arm_nofpu/module-init-tools-3.2.2/depmod
/home/martin/buildroot/build_arm/staging_dir/bin/arm-linux-depmod26
cp -dpf 
/home/martin/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.config
cp: missing destination file operand after
`/home/martin/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.config'
Try `cp --help' for more information.
make: ***
[/home/martin/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.configured]
Error 1

I followed the instructions to set the system up.  Is there no second
argument because I didn't configure something correctly or is this a bug?
====================================================================== 

---------------------------------------------------------------------- 
 hmoffatt - 12-10-07 22:20  
---------------------------------------------------------------------- 
It's because you failed to set BR2_PACKAGE_LINUX_KCONFIG to the location of
your kernel configuration file. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-10-07 20:58  martinmeba     New Issue                                    
12-10-07 20:58  martinmeba     Status                   new => assigned     
12-10-07 20:58  martinmeba     Assigned To               => buildroot       
12-10-07 22:20  hmoffatt       Note Added: 0003074                          
======================================================================
