From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 20 Oct 2007 11:12:11 -0700
Subject: [Buildroot] [buildroot 0001528]: 'make source' doesn't download
	gcc-4.2.1
Message-ID: <ea06e6db904962bd621112a861085f3e@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1528 
====================================================================== 
Reported By:                hmoffatt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1528
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             10-14-2007 21:45 PDT
Last Modified:              10-20-2007 11:12 PDT
====================================================================== 
Summary:                    'make source' doesn't download gcc-4.2.1
Description: 
'make source' didn't download gcc-4.2.1; it was downloaded later in the
build process ok.
====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 10-19-07 14:48  
---------------------------------------------------------------------- 
I made a small patch which fixes "make source"  for 4.2.1 and for 4.1.2.
Could you please verify?
Probably it's not a real fix but just a quick hack - if anyone knows
better approach just tell me. 

---------------------------------------------------------------------- 
 bernhardf - 10-19-07 14:53  
---------------------------------------------------------------------- 
$ grep HOST_SOURCE toolchain/gcc/*
toolchain/gcc/gcc-uclibc-3.x.mk:HOST_SOURCE+=gcc-source
toolchain/gcc/gcc-uclibc-4.x.mk:HOST_SOURCE+=gcc-source

This is ok. 

---------------------------------------------------------------------- 
 vanokuten - 10-20-07 11:12  
---------------------------------------------------------------------- 
fixed in 20306 svn revision 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-14-07 21:45  hmoffatt       New Issue                                    
10-14-07 21:45  hmoffatt       Status                   new => assigned     
10-14-07 21:45  hmoffatt       Assigned To               => buildroot       
10-19-07 14:47  vanokuten      File Added: make-source-gcc.patch                
   
10-19-07 14:48  vanokuten      Note Added: 0002845                          
10-19-07 14:53  bernhardf      Note Added: 0002847                          
10-20-07 11:12  vanokuten      Status                   assigned => closed  
10-20-07 11:12  vanokuten      Note Added: 0002849                          
======================================================================
