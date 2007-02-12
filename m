From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:28 -0800
Subject: [Buildroot] [buildroot 0000696]: updated package: linux
Message-ID: <26e24d4f5ef0cece36b6eef5ce33d874@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=696 
====================================================================== 
Reported By:                janlana
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   696
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-07-2006 06:00 PST
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    updated package: linux
Description: 
Buildroot has two packages for linux kernel - toolchain/kernel-headers and
packages/linux. The patch put both to one package toolchain/linux.

After patch you have to run the script:

for V in 8 9 10 11 12;  do
        mv toolchain/kernel-headers/linux-libc-headers-2.6.${V}*
toolchain/linux/2.6.${V}/
done

rm -Rf toolchain/kernel-headers

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-07-06 06:00  janlana        New Issue                                    
02-07-06 06:00  janlana        Status                   new => assigned     
02-07-06 06:00  janlana        Assigned To               => uClibc          
02-07-06 06:00  janlana        File Added: linux.diff                       
02-10-06 11:32  prpplague      Status                   assigned => closed  
02-10-06 11:32  prpplague      Resolution               open => won't fix   
02-10-06 11:32  prpplague      Additional Information Updated                   

02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
