From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 30 Oct 2007 14:45:00 -0700
Subject: [Buildroot] [buildroot 0001558]: make saveconfig rewrite .conf file
	incorrect
Message-ID: <0895fafe762dd2a5a61eca296ac5be84@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1558 
====================================================================== 
Reported By:                mata
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1558
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             10-28-2007 02:56 PDT
Last Modified:              10-30-2007 14:45 PDT
====================================================================== 
Summary:                    make saveconfig rewrite .conf file incorrect
Description: 
When do `make saveconfig`, config files will be copied to local/proj/, and
at main .config file uClibc,buildroot,kernel config location are
overrided.
But when check with `make menuconfig`, those config file location are
erased. I chased this process. At finally, I found `saveconfig`
modification are not for mconf format.
This patch is for override mconf acceptable format at saveconfig.
====================================================================== 

---------------------------------------------------------------------- 
 UlfSamuelsson - 10-30-07 13:14  
---------------------------------------------------------------------- 
Patch applied in rev 20335 

---------------------------------------------------------------------- 
 UlfSamuelsson - 10-30-07 14:45  
---------------------------------------------------------------------- 
Fixed 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-07 02:56  mata           New Issue                                    
10-28-07 02:56  mata           Status                   new => assigned     
10-28-07 02:56  mata           Assigned To               => buildroot       
10-28-07 02:56  mata           File Added: project.diff                     
10-30-07 13:14  UlfSamuelsson  Status                   assigned => resolved
10-30-07 13:14  UlfSamuelsson  Resolution               open => fixed       
10-30-07 13:14  UlfSamuelsson  Note Added: 0002878                          
10-30-07 14:44  UlfSamuelsson  Status                   resolved => closed  
10-30-07 14:45  UlfSamuelsson  Note Added: 0002882                          
======================================================================
