From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 7 Jul 2007 12:02:16 -0700
Subject: [Buildroot] [buildroot 0001231]: DEPRECATED: PATCH: 'make source'
	does not download kernel-headers source.
Message-ID: <288accee13e75600b38921e0ab1534bd@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been UPDATED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1231 
====================================================================== 
Reported By:                foogod
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1231
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-17-2007 16:54 PST
Last Modified:              07-07-2007 12:02 PDT
====================================================================== 
Summary:                    DEPRECATED: PATCH: 'make source' does not download
kernel-headers source.
Description: 
There is no make dependency connecting the 'source' target to the
kernel-headers-source target.  Thus, 'make source' does not download the
kernel-headers source, and it doesn't actually get downloaded until it
comes time to build it.

The attached patch fixes this issue by adding kernel-headers-source as a
dependency for uclibc-configured-source.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 03-20-07 11:08  
---------------------------------------------------------------------- 
What kernel-headers version were you seeing this with?
I cannot reproduce the alleged bug that "make source" does not download
the kernel-headers-source.

Works fine for me with linux-2.6.20.

Your proposed fix is inappropriate, IMO. Just make sure that make source
groks that your $(TARGETS) contain kernel-headers.
Thanks for the report 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-17-07 16:54  foogod         New Issue                                    
02-17-07 16:54  foogod         Status                   new => assigned     
02-17-07 16:54  foogod         Assigned To               => buildroot       
02-17-07 16:54  foogod         File Added:
buildroot.17919.kernel_headers_source.patch                    
03-20-07 11:08  bernhardf      Note Added: 0002257                          
07-07-07 12:02  bernhardf      Summary                  PATCH: 'make source'
does not download kernel-headers source. => DEPRECATED: PATCH: 'make source'
does not download kernel-headers source.
======================================================================
