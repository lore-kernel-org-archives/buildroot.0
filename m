From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 29 Aug 2008 12:03:52 -0700
Subject: [Buildroot] [buildroot 0003214]: buildroot tries to download
	grub_0.97-35.diff.gz from Debian FTP, but it doesn't exist
Message-ID: <e74604432b8eeb66601ef07541d57db5@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3214 
====================================================================== 
Reported By:                Uzi
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3214
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-30-2008 06:26 PDT
Last Modified:              08-29-2008 12:03 PDT
====================================================================== 
Summary:                    buildroot tries to download grub_0.97-35.diff.gz
from Debian FTP, but it doesn't exist
Description: 
During make process, buildroot tried to download from
http://ftp.debian.org/debian/pool/main/g/grub/grub_0.97-35.diff.gz, but
this URL is invalid, so the make process stopped.
====================================================================== 

---------------------------------------------------------------------- 
 ksnieck - 07-13-08 15:41  
---------------------------------------------------------------------- 
It appears grub was updated?
You can get past this error by modifying grub.mk in target/x86/grub the
line:
GRUB_PATCH:=grub_0.97-35.diff.gz
to
GRUB_PATCH:=grub_0.97-41.diff.gz
but that causes an error with grub.400-nic_update2.patch.bz2 

---------------------------------------------------------------------- 
 jrmii - 08-29-08 12:03  
---------------------------------------------------------------------- 
Just as a workaround, setting
GRUB_PATCH:=grub_0.97-22.diff.gz
in target/x86/grub/grub.mk allows things to build properly, and grub seems
to work 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-30-08 06:26  Uzi            New Issue                                    
04-30-08 06:26  Uzi            Status                   new => assigned     
04-30-08 06:26  Uzi            Assigned To               => buildroot       
04-30-08 06:52  Uzi            Issue Monitored: Uzi                         
07-13-08 15:41  ksnieck        Note Added: 0009224                          
08-29-08 12:03  jrmii          Note Added: 0010904                          
======================================================================
