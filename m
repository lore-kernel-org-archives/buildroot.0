From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:43 -0800
Subject: [Buildroot] [buildroot 0001185]: 17669 won't compile Busybox
Message-ID: <f1db097846e4f871635cc297e8f021af@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1185 
====================================================================== 
Reported By:                jcoppens
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1185
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-30-2007 12:32 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    17669 won't compile Busybox
Description: 
I downloaded SVN 17669, before applying the patch from

http://busybox.net/bugs/view.php?id=1182

This is surely unrelated, but now I cannot finish compilation of
Busybox. I'm not sure this is before or after the above patch.

John
====================================================================== 

---------------------------------------------------------------------- 
 bagland - 01-30-07 13:11  
---------------------------------------------------------------------- 
I had the same error when I updated to 17677, I had to change the
configuration file for busybox to package/busybox/busybox-1.2.2.1.config

Rgds,
Benjamin 

---------------------------------------------------------------------- 
 jcoppens - 01-30-07 14:55  
---------------------------------------------------------------------- 
Great! Thanks. Just to be clear, maybe someone else hits the same
problem. The file to edit is .config:

# BR2_BUSYBOX_VERSION_1_0_1 is not set
# BR2_BUSYBOX_VERSION_1_1_3 is not set
BR2_BUSYBOX_VERSION_1_2_2_1=y
# BR2_BUSYBOX_VERSION_1_4_0 is not set
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
BR2_PACKAGE_BUSYBOX_CONFIG="target/device/x86/i386/busybox.config"

And the last line to be changed to

BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.2.2.1.config"

Thanks, Benjamin.
(I suppose this should've happened automatically?) 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 08:40  
---------------------------------------------------------------------- 
This was fixed last week. Thanks for the report. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-30-07 12:32  jcoppens       New Issue                                    
01-30-07 12:32  jcoppens       Status                   new => assigned     
01-30-07 12:32  jcoppens       Assigned To               => uClibc          
01-30-07 13:11  bagland        Note Added: 0002078                          
01-30-07 14:55  jcoppens       Note Added: 0002079                          
02-04-07 08:40  bernhardf      Status                   assigned => closed  
02-04-07 08:40  bernhardf      Note Added: 0002098                          
02-04-07 08:40  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
