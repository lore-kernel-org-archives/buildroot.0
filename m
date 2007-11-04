From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 4 Nov 2007 04:45:02 -0800
Subject: [Buildroot] [buildroot 0001573]: Clean kernel headers unpack dir
	before unpacking
Message-ID: <d0291afb700b91745aa09118084f9e71@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1573 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1573
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-04-2007 04:45 PST
Last Modified:              11-04-2007 04:45 PST
====================================================================== 
Summary:                    Clean kernel headers unpack dir before unpacking
Description: 
When unpacking the kernel headers, we rm -rf the final kernel headers dir
but we don't rm -rf the directory we unpack to.

This causes a problem since, afterwards, we apply patches and if we repeat
the unpack operation for some reason, we will try patch some files twice
(i.e. files which don't exist in the tarball and are created by the patch,
and are therefore not overwritten by the "untar-ing").
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-04-07 04:45  ikonst         New Issue                                    
11-04-07 04:45  ikonst         Status                   new => assigned     
11-04-07 04:45  ikonst         Assigned To               => buildroot       
11-04-07 04:45  ikonst         File Added: buildroot-kernel-headers-rm.patch    
               
======================================================================
