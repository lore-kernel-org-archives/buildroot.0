From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 25 Mar 2008 03:51:11 -0700
Subject: [Buildroot] [buildroot 0002394]: [PATCH] Use the
	BR2_TARGET_ATMEL_COPYTO for the tftpboot path of the Atmel
	bootstrap and uboot
Message-ID: <e9c6f21bbfe104c6377a7869f17f8c88@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             03-01-2008 14:28 PST
Last Modified:              03-25-2008 03:51 PDT
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
======================================================================
