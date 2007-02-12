From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:36 -0800
Subject: [Buildroot] [buildroot 0000926]: lvm2 fails to install (DESTDIR
	issues)
Message-ID: <900aaaa00a1bed7110fac319780b223d@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=926 
====================================================================== 
Reported By:                redhatter
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   926
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-27-2006 03:59 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    lvm2 fails to install (DESTDIR issues)
Description: 
When running the `make install` stage of the LVM2 build, the install
scripts attempt to write to /etc/lvm (instead of
/path/to/staging_dir/etc/lvm), yeilding a "permission denied" when run as
a non-root user.  The supplied patch fixes this issue.
====================================================================== 

---------------------------------------------------------------------- 
 redhatter - 06-27-06 04:01  
---------------------------------------------------------------------- 
Hrmm, this seems to have wound up in the uClibc bug list... (I *swear* I
clicked Busybox)... if it's out of place, I appologise. 

---------------------------------------------------------------------- 
 bernhardf - 12-21-06 03:57  
---------------------------------------------------------------------- 
Fixed in r17026. Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-27-06 03:59  redhatter      New Issue                                    
06-27-06 03:59  redhatter      Status                   new => assigned     
06-27-06 03:59  redhatter      Assigned To               => uClibc          
06-27-06 04:00  redhatter      File Added: buildroot-lvm2-fix.diff              
     
06-27-06 04:01  redhatter      Note Added: 0001458                          
12-21-06 03:57  bernhardf      Status                   assigned => closed  
12-21-06 03:57  bernhardf      Note Added: 0001902                          
12-21-06 03:57  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
