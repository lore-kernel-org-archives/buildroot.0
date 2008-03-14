From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 13 Mar 2008 23:30:23 -0700
Subject: [Buildroot] [buildroot 0002564]: Inconsistent placement of "/gnu/"
	in GNU mirror path
Message-ID: <628cc8f58891e554c1aee014e9dbb6c4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2564 
====================================================================== 
Reported By:                mth
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2564
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-13-2008 18:58 PDT
Last Modified:              03-13-2008 23:30 PDT
====================================================================== 
Summary:                    Inconsistent placement of "/gnu/" in GNU mirror path
Description: 
An example download path of a GNU tool looks like this
"http://ftp.nluug.nl/pub/gnu/binutils/". The problem is that some packages
expect the "/gnu/" segment to be part of BR2_GNU_MIRROR, while other
packages expect the "/gnu/" segment to be part of the package-specific
download location. As a result, it is not possible to set BR2_GNU_MIRROR
in such a way that all GNU packages can be downloaded.

I grepped the source tree and the majority of packages expects "/gnu/" in
the package-specific download location. Therefore I changed the Makefiles
of the packages that expected "/gnu/" to be part of BR2_GNU_MIRROR. A
patch containing those changes is attached to this bug report.

If the opposite approach is desired ("/gnu/" in BR2_GNU_MIRROR), let me
know and I'll create a patch for that instead.

====================================================================== 

---------------------------------------------------------------------- 
 UlfSamuelsson - 03-13-08 23:30  
---------------------------------------------------------------------- 
I'd vote for having "/gnu/" included in BR2_GNU_MIRROR 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-13-08 18:58  mth            New Issue                                    
03-13-08 18:58  mth            Status                   new => assigned     
03-13-08 18:58  mth            Assigned To               => buildroot       
03-13-08 18:58  mth            File Added: gnu-mirror-dir.diff                  
 
03-13-08 23:30  UlfSamuelsson  Note Added: 0005734                          
======================================================================
