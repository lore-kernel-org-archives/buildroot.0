From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 27 Mar 2008 08:37:07 -0700
Subject: [Buildroot] [buildroot 0002684]: Fakeroot 1.9 again
Message-ID: <46f39aaaba938c033871c5b0c2ad737c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2684 
====================================================================== 
Reported By:                Graol
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2684
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-26-2008 03:45 PDT
Last Modified:              03-27-2008 08:37 PDT
====================================================================== 
Summary:                    Fakeroot 1.9 again
Description: 
Fakeroot 1.9 has disappeared again from the official debian repository, and
the 1.9.3 version fails to compile (on architecture x86_64).
====================================================================== 

---------------------------------------------------------------------- 
 hmoffatt - 03-26-08 06:08  
---------------------------------------------------------------------- 
Please provide details of the failure, ie a log. It builds fine for me on
amd64. 

---------------------------------------------------------------------- 
 Graol - 03-26-08 06:20  
---------------------------------------------------------------------- 
The server I used to work on not available anymore (reconfigured for
release). I forgot to save the log, but it said something like "applying a
patch to fakeroot 1.9.3... Trunk failure 1 on 1 etc... ## trunk failures in
##".
Despite modifying the /etc/apt/sources.list, a make still got the fakeroot
package from the official debian repo instead of snapshot.debian.net 

---------------------------------------------------------------------- 
 hmoffatt - 03-26-08 06:25  
---------------------------------------------------------------------- 
buildroot doesn't use your /etc/apt/sources.list - it fetches the source
directly using wget. If yours didn't go to snapshot.debian.net then it
isn't up to date. 

---------------------------------------------------------------------- 
 Graol - 03-26-08 07:00  
---------------------------------------------------------------------- 
Well, I used the Buildroot snapshot from 02-11-2008. I'll try again with
the most up-to-date one and keep you informed.

 

---------------------------------------------------------------------- 
 hmoffatt - 03-26-08 14:20  
---------------------------------------------------------------------- 
That's about 6 weeks ago. The change to use snapshot.debian.net was made on
2008-03-13, exactly because of the problem you are reporting. 

---------------------------------------------------------------------- 
 Graol - 03-27-08 08:37  
---------------------------------------------------------------------- 
Ok fixed. I now have another problem with stdlib for which a report has
already been created. I added a note there. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-26-08 03:45  Graol          New Issue                                    
03-26-08 03:45  Graol          Status                   new => assigned     
03-26-08 03:45  Graol          Assigned To               => buildroot       
03-26-08 06:08  hmoffatt       Note Added: 0005994                          
03-26-08 06:20  Graol          Note Added: 0006004                          
03-26-08 06:25  hmoffatt       Note Added: 0006014                          
03-26-08 06:56  Graol          Note Added: 0006024                          
03-26-08 07:00  Graol          Note Edited: 0006024                         
03-26-08 14:20  hmoffatt       Note Added: 0006064                          
03-27-08 08:37  Graol          Note Added: 0006124                          
======================================================================
