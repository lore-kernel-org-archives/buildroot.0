From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 25 Mar 2008 03:52:22 -0700
Subject: [Buildroot] [buildroot 0002384]: [PATCH] Use the BR2_LINUX_COPYTO
	symbol for the tftpboot path of the kernel
Message-ID: <25b157cba6c24d29376af03657e6fac6@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              03-25-2008 03:52 PDT
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

---------------------------------------------------------------------- 
 jcdr - 03-25-08 03:52  
---------------------------------------------------------------------- 
I have attached a new version of the patch "patch-tftpboot-kernel.diff" to
be applyed to the "Tue Mar 25 08:49:38 2008 +0000" SVN head. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-01-08 14:22  jcdr           New Issue                                    
03-01-08 14:22  jcdr           Status                   new => assigned     
03-01-08 14:22  jcdr           Assigned To               => buildroot       
03-01-08 14:22  jcdr           File Added:
0001-Use-the-BR2_LINUX_COPYTO-symbol-for-the-tftpboot-pat.patch                 
  
03-25-08 03:51  jcdr           File Added: patch-tftpboot-kernel.diff           
        
03-25-08 03:52  jcdr           Note Added: 0005874                          
======================================================================
