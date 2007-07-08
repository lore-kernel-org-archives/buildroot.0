From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 8 Jul 2007 04:13:38 -0700
Subject: [Buildroot] [buildroot 0000463]: [New package] lcdproc - interface
	to a lot of LCD displays
Message-ID: <183261b39e2f145c4a08ed4217cecfd3@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=463 
====================================================================== 
Reported By:                dinkel
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   463
Category:                   New Features
Reproducibility:            N/A
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-03-2005 16:25 PDT
Last Modified:              07-08-2007 04:13 PDT
====================================================================== 
Summary:                    [New package] lcdproc - interface to a lot of LCD
displays
Description: 
The attached patch adds the lcdproc package to the buildroot system.

In the configuration menu 'make menuconfig' you can choose what drivers
should be compiled in LCDd. The 'svgalib' driver is currently not
supported because of a lack of SVGALib in buildroot. The package is tested
to compile every other driver. but only the HD44780 driver is tested to
work correctly.

The diff was done against svn revision 11731!
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 07-08-07 04:13  
---------------------------------------------------------------------- 
Hi,

Can you please rediff against current trunk?

A few notes, though:
- zcat. This use is buggy, see other packages (the zlib decompressor is
configurable by the user, nowadays)
- please rename .source to .unpacked
- The configuration stage was changed, please update the flags involved
(see e.g. package/argus)
- in .installed, please use install -D where possible
- the clean target has to rm the stuff from the staging_dir 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-03-05 16:25  dinkel         New Issue                                    
10-03-05 16:25  dinkel         Status                   new => assigned     
10-03-05 16:25  dinkel         Assigned To               => uClibc          
10-03-05 16:25  dinkel         File Added: buildroot-lcdproc.patch              
     
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
07-08-07 04:13  bernhardf      Note Added: 0002567                          
======================================================================
