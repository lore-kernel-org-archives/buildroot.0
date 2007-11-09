From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 9 Nov 2007 01:28:14 -0800
Subject: [Buildroot] [buildroot 0001582]: libusb tries to build c++ library
	even if compiler not available
Message-ID: <d0a4c8762bf35ac7181e3d4bb3690915@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1582 
====================================================================== 
Reported By:                hmoffatt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1582
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-08-2007 19:03 PST
Last Modified:              11-09-2007 01:28 PST
====================================================================== 
Summary:                    libusb tries to build c++ library even if compiler
not available
Description: 
libusb tries to build a C++ library (libusbpp) even if cross-g++ is not
available. It actually tries to use the host compiler, then complains
about mixing objects from the host and target platforms at link time.

My fix was to disable the C++ library and also the test suite which uses
it, in the attached patch. There doesn't seem to be a configure option in
libusb to disable that more cleanly.
====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 11-09-07 01:27  
---------------------------------------------------------------------- 
Applied, thanks! in r20389 

---------------------------------------------------------------------- 
 vanokuten - 11-09-07 01:28  
---------------------------------------------------------------------- 
fixed in r20389 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-08-07 19:03  hmoffatt       New Issue                                    
11-08-07 19:03  hmoffatt       Status                   new => assigned     
11-08-07 19:03  hmoffatt       Assigned To               => buildroot       
11-08-07 19:03  hmoffatt       File Added: br-libusb-cpp.mk                    
11-09-07 01:27  vanokuten      Note Added: 0002899                          
11-09-07 01:28  vanokuten      Status                   assigned => closed  
11-09-07 01:28  vanokuten      Note Added: 0002900                          
======================================================================
