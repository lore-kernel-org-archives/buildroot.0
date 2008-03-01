From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 1 Mar 2008 14:22:18 -0800
Subject: [Buildroot] [buildroot 0002384]: [PATCH] Use the BR2_LINUX_COPYTO
	symbol for the tftpboot path of the kernel
Message-ID: <e876f447b27bedae1a11ccaa748854fb@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2384 
====================================================================== 
Reported By:                jcdr
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2384
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-01-2008 14:22 PST
Last Modified:              03-01-2008 14:22 PST
====================================================================== 
Summary:                    [PATCH] Use the BR2_LINUX_COPYTO symbol for the
tftpboot path of the kernel
Description: 
The target/linux/Makefile.in.advanced use hard coded "/tftoboot" string
instead of using the already properly defined BR2_LINUX_COPYTO symbol that
define it. This stop the build with an permission error if the
BR2_LINUX_COPYTO symbol is anything but "/tftoboot". Sadly last LSB and
thus more en more distribution use "/var/lib/tftpboot" instead of
"/tftpboot".

Patch against current HEAD is provided to fix this problem. See
attachment.


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-01-08 14:22  jcdr           New Issue                                    
03-01-08 14:22  jcdr           Status                   new => assigned     
03-01-08 14:22  jcdr           Assigned To               => buildroot       
03-01-08 14:22  jcdr           File Added:
0001-Use-the-BR2_LINUX_COPYTO-symbol-for-the-tftpboot-pat.patch                 
  
======================================================================
