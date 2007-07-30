From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 30 Jul 2007 06:54:23 -0700
Subject: [Buildroot] [buildroot 0001450]: copy of system header files fails
Message-ID: <cdcda03829651f13ee68e703f66d142f@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1450 
====================================================================== 
Reported By:                drm
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1450
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-30-2007 06:54 PDT
Last Modified:              07-30-2007 06:54 PDT
====================================================================== 
Summary:                    copy of system header files fails
Description: 
The copying of the system header to the final destination fails to make
copies of all subdirectories
Specifically the command:
cp -pLR /home/../toolchain_build_arm_nofpu/linux/include/asm
/opt/arm-gcc/3.4.4/usr/include/

gives the error message:
cp: will not create hard link
`/opt/arm-gcc/3.4.4/usr/include/asm/proc-armv' to directory
`/opt/arm-gcc/3.4.4/usr/include/asm/proc'
cp: will not create hard link `/opt/arm-gcc/3.4.4/usr/include/asm/arch' to
directory `/opt/arm-gcc/3.4.4/usr/include/asm/arch-ebsa285'

The errors come from symbolic links to directories which the copy command
does not want to process.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-30-07 06:54  drm            New Issue                                    
07-30-07 06:54  drm            Status                   new => assigned     
07-30-07 06:54  drm            Assigned To               => buildroot       
======================================================================
