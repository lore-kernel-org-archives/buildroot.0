From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 20 Mar 2007 11:00:55 -0700
Subject: [Buildroot] [buildroot 0001233]: Incorrect freetype-config being
	used.
Message-ID: <c4bfc4bcde9404a4da22ac919fe261b1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1233 
====================================================================== 
Reported By:                djl197
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1233
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             02-19-2007 05:58 PST
Last Modified:              03-20-2007 11:00 PDT
====================================================================== 
Summary:                    Incorrect freetype-config being used.
Description: 
The Incorrect freetype-config is being used.  This is because
freetype-config is located in $(STAGING_DIR)/usr/bin this is not included
in the target path.
This means some packages (like directfb) use freetype-config they can find
which is the Host (Build PC)
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 03-20-07 11:00  
---------------------------------------------------------------------- 
Applied as r18184.

We seem to mix target- and host- binaries in the staging dir, so i expect
these to fail in funny ways.. Also not so good.. *shrug*

Thanks for the patch. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-19-07 05:58  djl197         New Issue                                    
02-19-07 05:58  djl197         Status                   new => assigned     
02-19-07 05:58  djl197         Assigned To               => buildroot       
02-19-07 05:58  djl197         File Added: freetype-config.patch                
   
03-20-07 11:00  bernhardf      Status                   assigned => closed  
03-20-07 11:00  bernhardf      Note Added: 0002255                          
======================================================================
