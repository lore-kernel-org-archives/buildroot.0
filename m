From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 28 Oct 2007 02:56:16 -0700
Subject: [Buildroot] [buildroot 0001558]: make saveconfig rewrite .conf file
	incorrect
Message-ID: <33c94023e10a18640068512b4a78f238@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2007 02:56 PDT
Last Modified:              10-28-2007 02:56 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-07 02:56  mata           New Issue                                    
10-28-07 02:56  mata           Status                   new => assigned     
10-28-07 02:56  mata           Assigned To               => buildroot       
10-28-07 02:56  mata           File Added: project.diff                     
======================================================================
