From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:15 -0800
Subject: [Buildroot] [buildroot 0000913]: gcc-uclibc-3.x.mk has hardcoded
	ftp site
Message-ID: <75b30cdafa697d9a96647fc7aa48e75b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=913 
====================================================================== 
Reported By:                bowerymarc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   913
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-19-2006 18:29 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    gcc-uclibc-3.x.mk has hardcoded ftp site
Description: 
the file toolchain/gcc/gcc-uclibc-3.x.mk has the ibiblio ftp site hardcoded
in it (line 24) instead of using the mirror site from make menuconfig. 
That site doesn't have gcc 4.1.1.  
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 06-20-06 15:54  
---------------------------------------------------------------------- 
the mirror site in menuconfig is for sourceforge sites only

gcc is not on sourceforge so using that mirror url is incorrect 

---------------------------------------------------------------------- 
 bowerymarc - 06-20-06 16:39  
---------------------------------------------------------------------- 
fact remains, 4.1.1. isn't on the *hardcoded* site.  Perhaps it should be
at least a text input in menuconfig, it's not easy to dig up, so that one
can look for a more complete site than the .mk file author found. 

---------------------------------------------------------------------- 
 vapier - 06-20-06 16:48  
---------------------------------------------------------------------- 
add a configuration option to select a gnu mirror as many other packages
can use that mirror as well 

---------------------------------------------------------------------- 
 vapier - 06-29-06 17:25  
---------------------------------------------------------------------- 
well if you ever feel like writing a patch, re-open

otherwise ive changed the url to point to the main gcc site 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-19-06 18:29  bowerymarc     New Issue                                    
06-19-06 18:29  bowerymarc     Status                   new => assigned     
06-19-06 18:29  bowerymarc     Assigned To               => uClibc          
06-20-06 15:54  vapier         Note Added: 0001435                          
06-20-06 16:39  bowerymarc     Note Added: 0001437                          
06-20-06 16:48  vapier         Note Added: 0001438                          
06-29-06 17:25  vapier         Note Added: 0001477                          
06-29-06 17:25  vapier         Status                   assigned => closed  
06-29-06 17:25  vapier         Resolution               open => fixed       
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
