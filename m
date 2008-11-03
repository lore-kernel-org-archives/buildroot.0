From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 3 Nov 2008 03:01:43 -0800
Subject: [Buildroot] [buildroot 0005914]: add 915resolution and v86d
Message-ID: <24220660e358d9c60bc44928fef81fc6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5914 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5914
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-01-2008 03:23 PDT
Last Modified:              11-03-2008 03:01 PST
====================================================================== 
Summary:                    add 915resolution and v86d
Description: 
add 915resolution and v86d for supporting non standard video resolutions
====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 11-01-08 13:24  
---------------------------------------------------------------------- 
In the resolutions.patch:

s,$(INSTALL),$(INSTALL) -D,

for both the package. Thanks.

 

---------------------------------------------------------------------- 
 jacmet - 11-02-08 10:39  
---------------------------------------------------------------------- 
Isn't 915resolution only for really old Intel drivers? Shouldn't we bump
the intel driver version instead? 

---------------------------------------------------------------------- 
 robang74 - 11-03-08 02:55  
---------------------------------------------------------------------- 
AFAIK 915resolutions is a user space utility which overwrite BIOS
resolutions table in order to activate/use non standard resolutions like
800x480 in X (i.e.: in eeepc). Instead v86d is a user space helper for
uvesafb (a kernel patch) which is useful for use frame buffer at non
standard resolutions like 800x480 (i.e.: in eeepc). 

---------------------------------------------------------------------- 
 jacmet - 11-03-08 03:01  
---------------------------------------------------------------------- 
yeah, but doesn't the intel driver do it's own mode settings nowadays? I
atleast don't need 915resolution to run 1280x800 on this laptop 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-01-08 03:23  robang74       New Issue                                    
11-01-08 03:23  robang74       Status                   new => assigned     
11-01-08 03:23  robang74       Assigned To               => buildroot       
11-01-08 03:23  robang74       File Added: resolutions.patch                    
11-01-08 03:23  robang74       Issue Monitored: robang74                    
11-01-08 13:24  robang74       Note Added: 0014784                          
11-01-08 13:24  robang74       Note Edited: 0014784                         
11-02-08 10:39  jacmet         Note Added: 0014884                          
11-03-08 02:51  robang74       File Added: resolutions.patch2                   

11-03-08 02:55  robang74       Note Added: 0014914                          
11-03-08 03:01  jacmet         Note Added: 0014924                          
======================================================================
