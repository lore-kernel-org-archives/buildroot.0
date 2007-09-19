From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 19 Sep 2007 07:05:15 -0700
Subject: [Buildroot] [buildroot 0001450]: DEPRECATED: copy of system header
	files fails
Message-ID: <c562cc9fb2cc667110d1d22164d2cb9d@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             07-30-2007 06:54 PDT
Last Modified:              09-19-2007 07:05 PDT
====================================================================== 
Summary:                    DEPRECATED: copy of system header files fails
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

---------------------------------------------------------------------- 
 bernhardf - 09-07-07 11:58  
---------------------------------------------------------------------- 
This works for me with gcc-4.2.1, 4.1.2, and even 3.4.6.

I shall close this bug unless you can reproduce this with one of the
versions mentioned above (the other versions are deprecated; TBH even
3.4.6 is from my POV).

thanks, 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-30-07 06:54  drm            New Issue                                    
07-30-07 06:54  drm            Status                   new => assigned     
07-30-07 06:54  drm            Assigned To               => buildroot       
09-07-07 11:58  bernhardf      Note Added: 0002732                          
09-19-07 07:04  bernhardf      Summary                  copy of system header
files fails => DEPRECATED: copy of system header files fails
09-19-07 07:05  bernhardf      Status                   assigned => closed  
======================================================================
