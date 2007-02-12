From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:46 -0800
Subject: [Buildroot] [buildroot 0000182]: Multi-configuration support
Message-ID: <7fb349902806c4e4ffd91c0703a26b21@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=182 
====================================================================== 
Reported By:                david_bachelart
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   182
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-22-2005 14:06 PST
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    Multi-configuration support
Description: 
This patch allows to manage many configuration files (I use buildroot for
many platforms).

You can store your config files in configs/, for example :
configs/foo_defconfig
configs/bar_defconfig

I moved .defconfig in configs/br2_defonfig, it looks coherent...

You can configure your buildroot with a "make foo_defconfig" or a "make
bar_defconfig"

Thanks, and keep up the good work !
====================================================================== 

---------------------------------------------------------------------- 
 sjhill - 06-21-06 19:26  
---------------------------------------------------------------------- 
Updated patch committed in revision 15475. The top-level Makefile looks for
all files with name 'XXX_defconfig' when any target of 'XXX_defconfig' is
invoked. Tested with two different PowerPC platforms, but will definitely
work for all targets. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-22-05 14:06  david_bachelartNew Issue                                    
03-22-05 14:06  david_bachelartFile Added: multiconfigs.patch                   

02-10-06 11:39  prpplague      Status                   assigned => closed  
02-10-06 11:39  prpplague      Resolution               open => won't fix   
02-10-06 11:39  prpplague      Additional Information Updated                   

06-21-06 19:26  sjhill         Status                   closed => resolved  
06-21-06 19:26  sjhill         Resolution               won't fix => fixed  
06-21-06 19:26  sjhill         Note Added: 0001442                          
09-30-06 14:18  bernhardf      Status                   resolved => closed  
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
