From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 26 Mar 2008 02:48:46 -0700
Subject: [Buildroot] [buildroot 0002564]: Inconsistent placement of "/gnu/"
	in GNU mirror path
Message-ID: <aa42b1b5ccd5c21bde0bd99590aa5bb8@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             03-13-2008 18:58 PDT
Last Modified:              03-26-2008 02:48 PDT
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
Relationships       ID      Summary
----------------------------------------------------------------------
duplicate of        0002634 path to ncurses seems to contain extra ...
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
03-25-08 20:33  hmoffatt       Relationship added       duplicate of 0002634
03-25-08 20:33  hmoffatt       Duplicate ID             0 => 2634           
03-25-08 20:33  hmoffatt       Status                   assigned => resolved
03-25-08 20:33  hmoffatt       Resolution               open => fixed       
03-26-08 02:48  hmoffatt       Status                   resolved => closed  
======================================================================
