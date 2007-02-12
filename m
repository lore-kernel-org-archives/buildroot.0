From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:51 -0800
Subject: [Buildroot] [buildroot 0000865]: target GRUB and grub splashimage
	doesn't depend on ISO9660; KERNEL variable isn't defined;
	"po4a" program needed for fakeroot
Message-ID: <1e6375e019e5e26411d089194742e82b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=865 
====================================================================== 
Reported By:                ksyu
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   865
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-04-2006 12:50 PDT
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    target GRUB and grub splashimage doesn't depend on
ISO9660; KERNEL variable isn't defined; "po4a" program needed for fakeroot
Description: 
target/iso9660/Config.in :
-"select BR2_PACKAGE_GRUB"
+"select BR2_TARGET_GRUB"
(coz GRUB specified as _package_, not _target_) there's no way for grub to
be built, also possible is for grub to be PACKAGE in grub/Config.in;

menu.lst:
+"splashimage /boot/grub/splashimage.xpm.gz"
splashimage handling;

iso9660.mk:
-"cp $(LINUX_KERNEL) $(ISO9660_TARGET_DIR)/kernel"
+"cp $(SOMEPATH)/vmlinux $(ISO9660_TARGET_DIR)/kernel"
+"cp $(SOMEPATH)/splash.xpm.gz $(ISO9660_TARGET_DIR)/boot/grub/"
you will need to specify kernel path yourself(LINUX_KERNEL variable isn't
defined in my box), i'm not _buildroot_ developer, cannot make decisions
by myself;

fakeroot patch:
Makefile:
-"SUBDIRS scripts doc test"
+"SUBDIRS scripts test"
sorry, i don't have full po4a program env :) this program depends on some
Perl .pm i don't have
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 11-28-06 02:11  
---------------------------------------------------------------------- 
Please retest with current svn.
I believe that some of these issues are already fixed.

I shall close this issue unless i hear anything back within two weeks.
Thanks, 

---------------------------------------------------------------------- 
 bernhardf - 01-21-07 09:32  
---------------------------------------------------------------------- 
I assume that this works fine now, closing. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-04-06 12:50  ksyu           New Issue                                    
05-04-06 12:50  ksyu           Status                   new => assigned     
05-04-06 12:50  ksyu           Assigned To               => uClibc          
11-28-06 02:11  bernhardf      Note Added: 0001825                          
11-28-06 02:11  bernhardf      Status                   assigned => feedback
01-21-07 09:32  bernhardf      Status                   feedback => closed  
01-21-07 09:32  bernhardf      Note Added: 0002027                          
01-21-07 09:32  bernhardf      Resolution               open => no change
required
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
