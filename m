From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 17 Feb 2007 14:10:59 -0800
Subject: [Buildroot] [buildroot 0001227]: PATCH: Unresolved symbols in
	libXfixes.so.3.0 with RTLD_NOW
Message-ID: <8b03a685e604a56f756ad7f3fd694007@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1227 
====================================================================== 
Reported By:                foogod
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1227
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-17-2007 14:10 PST
Last Modified:              02-17-2007 14:10 PST
====================================================================== 
Summary:                    PATCH: Unresolved symbols in libXfixes.so.3.0 with
RTLD_NOW
Description: 
libXfixes.so is missing a couple of library references in its link command.
 This is not usually a problem for programs which link against it because
they typically also link against the other X libraries which are needed,
and the lazy function binding will find and resolve them, but when
libXfixes (or something which uses libXfixes) is loaded using dlopen()
with the RTLD_NOW flag, the dynamic linker is unable to resolve the
function references and the operation fails.

(I can provide a test case if desired)

The attached patch adds the required library dependencies to libXfixes.so
to fix this issue.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-17-07 14:10  foogod         New Issue                                    
02-17-07 14:10  foogod         Status                   new => assigned     
02-17-07 14:10  foogod         Assigned To               => buildroot       
02-17-07 14:10  foogod         File Added:
buildroot.17919.xorg_xfixes_libs.patch                    
======================================================================
