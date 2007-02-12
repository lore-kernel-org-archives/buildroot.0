From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:25 -0800
Subject: [Buildroot] [buildroot 0000212]: Adds grub bootloader
Message-ID: <18a63cbf5a1771567c62f7e1b3378b60@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=212 
====================================================================== 
Reported By:                SnarlCat
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   212
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-06-2005 13:09 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    Adds grub bootloader
Description: 
This patch will add the grub bootloader to the build menu and process.

Please do go over it (especially the grub.mk file) to be sure it's
compliant with your file layout design -- this was just a quick hack to
get it with no concern for style or beauty...

Thanks!
====================================================================== 

---------------------------------------------------------------------- 
 SnarlCat - 04-07-05 07:27  
---------------------------------------------------------------------- 
Ug.. so I canned a line that I shouldn't have.. manual diff of
package/grub/grub.mk

 GRUB_SITE:=ftp://alpha.gnu.org/gnu/grub
 GRUB_DIR:=$(BUILD_DIR)/grub-$(GRUB_VER)
 GRUB_BOOT_PATH:=$(TARGET_DIR)/boot
+GRUB_CAT:=zcat
 GRUB_BINARY:=$(GRUB_DIR)/sbin/grub 

---------------------------------------------------------------------- 
 vapier - 08-28-05 01:10  
---------------------------------------------------------------------- 
grub is in buildroot now 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-06-05 13:09  SnarlCat       New Issue                                    
04-06-05 13:09  SnarlCat       File Added: buildroot-grub.patch                 
  
04-07-05 07:27  SnarlCat       Note Added: 0000135                          
08-28-05 01:10  vapier         Note Added: 0000455                          
08-28-05 01:10  vapier         Status                   assigned => closed  
08-28-05 01:10  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
