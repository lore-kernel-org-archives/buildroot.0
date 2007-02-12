From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:31 -0800
Subject: [Buildroot] [buildroot 0000967]: SEGV when running openssh
Message-ID: <647edb9219e61a906a9f16b0357845c7@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=967 
====================================================================== 
Reported By:                lerichi
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   967
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-23-2006 14:59 PDT
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    SEGV when running openssh
Description: 
I downloaded and did a standard build of the latest buildroot. Busybox
works just fine, but openssh and all its helpers just SEGV. Apart from
that, the other non-busybox proggies also die. So there must be a problem
with some library. 

Just make a standard build (gcc-3.4.2), chroot into build_ARCH/root and
call sshd. It should die :-(

Any ideas? I have a suspicion that xstrdup() might be the cause.

Regards-
Richard
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-24-07 13:04  
---------------------------------------------------------------------- 
Try to strace this and perpahs provide a simple testcase for us to
reproduce. 

---------------------------------------------------------------------- 
 gheeres - 02-01-07 13:53  
---------------------------------------------------------------------- 
Attached strace output.

Build / configuration:

uClibc-snapshost (01/26/2007)
gcc-v4.1.1
openssh-v3.9p1

Same results attempting to use openssh-v4.5p1

If strace needs to be in different format, please provide instructions for
generating. 

---------------------------------------------------------------------- 
 gheeres - 02-01-07 14:10  
---------------------------------------------------------------------- 
Older buildroot using:

uClibc-0.9.28 (non-snapshot)
gcc-v3.4.6
openssh-v3.9p1 or openssh-v4.5p1

Works correctly. 

---------------------------------------------------------------------- 
 gheeres - 02-03-07 17:31  
---------------------------------------------------------------------- 
Checked out newest uClibc build (http://busybox.net/bugs/view.php?id=#02012007),
completely rebuilt entire
toolchain and build files. SSH is no longer SEGV. 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 03:24  
---------------------------------------------------------------------- 
I consider this fixed now and shall close this issue within two weeks from
now on, unless somebody comes up to let us know that 0.9.28.1 and current
svn still has problems.

Thanks, all, for your help with testing. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-23-06 14:59  lerichi        New Issue                                    
07-23-06 14:59  lerichi        Status                   new => assigned     
07-23-06 14:59  lerichi        Assigned To               => uClibc          
07-27-06 04:58  thrakhath      Issue Monitored: thrakhath                    
01-24-07 13:04  bernhardf      Note Added: 0002041                          
02-01-07 13:50  gheeres        File Added: uClibc-snapshot-openssh-v3.9p1.strace
                   
02-01-07 13:53  gheeres        Note Added: 0002081                          
02-01-07 14:10  gheeres        Note Added: 0002082                          
02-03-07 17:31  gheeres        Note Added: 0002092                          
02-04-07 03:24  bernhardf      Note Added: 0002094                          
02-04-07 03:24  bernhardf      Status                   assigned => feedback
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
