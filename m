From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 12 Apr 2008 01:12:35 -0700
Subject: [Buildroot] [buildroot 0002394]: [PATCH] Use the
	BR2_TARGET_ATMEL_COPYTO for the tftpboot path of the Atmel
	bootstrap and uboot
Message-ID: <93fee2113f600845f3d0613eb2532d35@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=2394 
====================================================================== 
Reported By:                jcdr
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2394
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             03-01-2008 14:28 PST
Last Modified:              04-12-2008 01:12 PDT
====================================================================== 
Summary:                    [PATCH] Use the BR2_TARGET_ATMEL_COPYTO for the
tftpboot path of the Atmel bootstrap and uboot
Description: 
The "/tftpboot" is hard coded into the file
target/device/Atmel/at91bootstrap/at91bootstrap.mk and
target/device/Atmel/u-boot/u-boot.mk. This stop the build with a
permission error if the BR2_TARGET_ATMEL_COPYTO symbol is anything but
"/tftpboot". Sadly, the last LSB and more an more distribution use
"/var/lib/tftpboot".

The provided patch in attachment fix this.

====================================================================== 

---------------------------------------------------------------------- 
 jcdr - 03-25-08 03:51  
---------------------------------------------------------------------- 
I have attached a new version of the patch "patch-tftpboot-atmel.diff" to
be applyed to the "Tue Mar 25 08:49:38 2008 +0000" SVN head. 

---------------------------------------------------------------------- 
 jcdr - 04-03-08 01:41  
---------------------------------------------------------------------- 
New version in the file patch-tftpboot-atmel-20080403.diff to properly
apply to the SVN HEAD. 

---------------------------------------------------------------------- 
 jacmet - 04-12-08 01:12  
---------------------------------------------------------------------- 
fixed in r21712 - thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-01-08 14:28  jcdr           New Issue                                    
03-01-08 14:28  jcdr           Status                   new => assigned     
03-01-08 14:28  jcdr           Assigned To               => buildroot       
03-01-08 14:28  jcdr           File Added:
0002-Use-the-BR2_TARGET_ATMEL_COPYTO-for-the-tftpboot-pat.patch                 
  
03-25-08 03:49  jcdr           File Added: patch-tftpboot-atmel.diff            
       
03-25-08 03:51  jcdr           Note Added: 0005864                          
04-03-08 01:40  jcdr           File Added: patch-tftpboot-atmel-20080403.diff   
                
04-03-08 01:41  jcdr           Note Added: 0006354                          
04-12-08 01:12  jacmet         Status                   assigned => closed  
04-12-08 01:12  jacmet         Note Added: 0006584                          
======================================================================
