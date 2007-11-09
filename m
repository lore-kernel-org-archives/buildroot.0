From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 9 Nov 2007 01:31:03 -0800
Subject: [Buildroot] [buildroot 0001581]: libusb configure.guess/sub doesn't
	support armeb
Message-ID: <b6a3a96605a642075cbb178217e6504a@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1581 
====================================================================== 
Reported By:                hmoffatt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1581
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-08-2007 19:00 PST
Last Modified:              11-09-2007 01:31 PST
====================================================================== 
Summary:                    libusb configure.guess/sub doesn't support armeb
Description: 
libusb's configure script doesn't support armeb.

Updating the files using $(CONFIG_UPDATE) caused all sorts of libtool hell
to break loose, so I had to run autoreconf during the build too. Thus
adding a dependency on automake, autoconf.

Patch attached fixes this for me.
====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 11-09-07 01:31  
---------------------------------------------------------------------- 
Applied, thanks. Fix in 20390 rev 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-08-07 19:00  hmoffatt       New Issue                                    
11-08-07 19:00  hmoffatt       Status                   new => assigned     
11-08-07 19:00  hmoffatt       Assigned To               => buildroot       
11-08-07 19:00  hmoffatt       File Added: br-libusb-autoconf.mk                
   
11-09-07 01:31  vanokuten      Status                   assigned => closed  
11-09-07 01:31  vanokuten      Note Added: 0002901                          
======================================================================
