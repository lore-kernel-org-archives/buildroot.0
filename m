From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:40 -0800
Subject: [Buildroot] [buildroot 0000997]: system mounted on /dev/root
Message-ID: <718b7e74c07235153194a852fd3d4cfa@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=997 
====================================================================== 
Reported By:                amja
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   997
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-16-2006 13:10 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    system mounted on /dev/root
Description: 
I'm playing about with buildroot at the moment. I've no real need for 
embedded linux but was interested in seeing how minimal a system I 
could use. When I try to boot into the system the root filesystem is 
/dev/root and mounted read-only.

I tried build root a few months ago and don't recall this being a 
problem. Google turns up nothing that appears to be relevant.

If I am booting with a 2.4 kernel (vmlinuz-ide-2.4.31 from slackware 
10.2) I can mount /dev/hda on /mnt and then use pivot_root to get a new 
root. If I boot a 2.6 kernel (vmlinuz-2.4.12-24mdk from mandriva 2006) I 
get a device busy message if I try the above.

====================================================================== 

---------------------------------------------------------------------- 
 amja - 08-17-06 09:18  
---------------------------------------------------------------------- 
I've tried a busybox snapshot (20060817) which seems to solve the problem.
I'm still experiemntimg with various combinations of uClibc, busybox and
buildroot. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-16-06 13:10  amja           New Issue                                    
08-16-06 13:10  amja           Status                   new => assigned     
08-16-06 13:10  amja           Assigned To               => uClibc          
08-17-06 09:18  amja           Note Added: 0001569                          
12-01-06 10:08  bernhardf      Status                   assigned => closed  
12-01-06 10:08  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
