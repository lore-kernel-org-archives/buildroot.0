From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:02 -0800
Subject: [Buildroot] [buildroot 0000956]: Patch failed! Please fix
	ncurses-100-hostccflags.patch!
Message-ID: <1fa53d5eddec440e817559963c7a2ff4@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=956 
====================================================================== 
Reported By:                bowerymarc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   956
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-16-2006 20:17 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    Patch failed!  Please fix
ncurses-100-hostccflags.patch!
Description: 
[root at localhost buildroot]# make
package/dropbear_sshd/dropbear_sshd.mk:59: warning: overriding commands
for target `/home/tools/buildroot/build_arm_nofpu/root/usr/sbin/dropbear'
package/dropbear/dropbear.mk:59: warning: ignoring old commands for target
`/home/tools/buildroot/build_arm_nofpu/root/usr/sbin/dropbear'
.//toolchain/dependencies/dependencies.sh
Checking build system dependencies:

GNU make version '3.80':            Ok
gcc version '4.0.2':                Ok
which installed:                    Ok
bison installed:                    Ok
flex installed:                     Ok
gettext installed:                  Ok
Build system dependencies:          Ok
gunzip -c /home/tools/buildroot/dl/ncurses-5.5.tar.gz | tar -C
/home/tools/buildroot/build_arm_nofpu   -xf -
tar: Read 2048 bytes from -
#use the local tic and not whatever the build system was going to find.
/home/tools/buildroot/toolchain_build_arm_nofpu/bin/sed -i -e
's~\$srcdir/shlib tic\$suffix~/usr/bin/tic~' \
        /home/tools/buildroot/build_arm_nofpu/ncurses-5.5/misc/run_tic.in
toolchain/patch-kernel.sh
/home/tools/buildroot/build_arm_nofpu/ncurses-5.5 package/ncurses/
ncurses\*.patch

Applying ncurses-100-hostccflags.patch using plaintext:
patching file ncurses/Makefile.in
Hunk http://busybox.net/bugs/view.php?id=1 FAILED at 85.
1 out of 1 hunk FAILED -- saving rejects to file ncurses/Makefile.in.rej
Patch failed!  Please fix ncurses-100-hostccflags.patch!
make: *** [/home/tools/buildroot/build_arm_nofpu/ncurses-5.5/.dist] Error
1

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 07-19-06 16:58  
---------------------------------------------------------------------- 
your repo is screwed up, that patch isnt in svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-16-06 20:17  bowerymarc     New Issue                                    
07-16-06 20:17  bowerymarc     Status                   new => assigned     
07-16-06 20:17  bowerymarc     Assigned To               => uClibc          
07-19-06 16:58  vapier         Note Added: 0001537                          
07-19-06 16:58  vapier         Status                   assigned => closed  
07-19-06 16:58  vapier         Resolution               open => unable to
reproduce
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
