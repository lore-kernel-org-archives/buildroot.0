From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 24 Sep 2007 02:08:36 -0700
Subject: [Buildroot] [buildroot 0000878]: Update xorg to 6.9.0 and make it
	compile
Message-ID: <da1139fe28e05c86c7d4fcafad7678a1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=878 
====================================================================== 
Reported By:                mastag
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   878
Category:                   New Features
Reproducibility:            always
Severity:                   tweak
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             05-23-2006 19:25 PDT
Last Modified:              09-24-2007 02:08 PDT
====================================================================== 
Summary:                    Update xorg to 6.9.0 and make it compile
Description: 
I updated xorg to 6.9.0.
the xorg.mk file has been altered to setup a correct host.def and
cross.def envoriment.
It should pass the correct ByteOrder, HasMMXSuppoer, hasMTRRSupport and
XF86INT10_BUILD depending on what Arch you are compiling for.

I also added some patches to make it build against uclibc.

Tested it with SH4 and it works.

Sorry for my bad english.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 05-25-06 19:15  
---------------------------------------------------------------------- 
you might as well just update to the latest version instead of a version
that is already outdated 

---------------------------------------------------------------------- 
 mastag - 05-26-06 06:10  
---------------------------------------------------------------------- 
Allright,

I'll try to build xorg 7.1 then.
Then I'll post a new patch. 

---------------------------------------------------------------------- 
 deadcow - 07-06-06 07:40  
---------------------------------------------------------------------- 
I'm using Xorg 7.0 on Gentoo (so it's self-compiled) with uclibc-0.9.28 
(USE="userlocales minimal -pregen savedconfig -uclibc-compat wordexp). It
works fine as far as I can tell, but XvMC-acceleration is not working.

The kernel-drm loads, and drm as well as XvMC appears correctly in the
Xorg.log, but xine doesn't use it.

Can I do anything to help getting it to work? You need any logfiles, want
me to try anything?

BTW:
kernel 2.6.16, and kernel-drm for via chipsets.

Cheers,
  Mario

 

---------------------------------------------------------------------- 
 deadcow - 07-06-06 07:44  
---------------------------------------------------------------------- 
As of 07/06/06, using Gentoos xorg-7.1 and xine-lib-1.1.2_pre20060630-r1,
everything seems to work fine now. I haven't done much testing yet, but it
all looks ok (X starts without errors, drm gets loaded, xine detects XvMC
and plays MPEG1/2 w/ HW-acceleration). 

---------------------------------------------------------------------- 
 bernhardf - 09-24-07 02:08  
---------------------------------------------------------------------- 
an x11r7 package (with many flaws) was added to buildroot recently.
Please help fixing the problems (mainly the patch handling in
package/Makefile.autotools.in is an ugly hack) and send patches and
feedback to the mailing list.

thanks, 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-23-06 19:25  mastag         New Issue                                    
05-23-06 19:25  mastag         Status                   new => assigned     
05-23-06 19:25  mastag         Assigned To               => uClibc          
05-23-06 19:25  mastag         File Added: buildroot_xorg-6.9.0.patch           
        
05-25-06 19:15  vapier         Note Added: 0001384                          
05-26-06 06:10  mastag         Note Added: 0001386                          
06-28-06 12:46  deadcow        Issue Monitored: deadcow                     
07-05-06 11:27  deadcow        Note Added: 0001497                          
07-06-06 07:40  deadcow        Note Edited: 0001497                         
07-06-06 07:44  deadcow        Note Added: 0001499                          
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
09-24-07 02:08  bernhardf      Status                   assigned => closed  
09-24-07 02:08  bernhardf      Note Added: 0002786                          
======================================================================
