From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 17 Feb 2007 14:19:38 -0800
Subject: [Buildroot] [buildroot 0001228]: PATCH: Unresolved symbols in
	libgdk-x11-2.0.so with RTLD_NOW
Message-ID: <709781a99a5e692e3aea7ca123d45fe4@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1228 
====================================================================== 
Reported By:                foogod
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1228
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-17-2007 14:19 PST
Last Modified:              02-17-2007 14:19 PST
====================================================================== 
Summary:                    PATCH: Unresolved symbols in libgdk-x11-2.0.so with
RTLD_NOW
Description: 
libgdk-x11-2.0.so uses libintl_dgettext, but does not have -lintl in its
link command.  This is not usually a problem for programs which link
against it because libintl is included by other libraries which libgdk
does reference, so the lazy function binding will find and resolve
libintl_dgettext eventually, but when libgdk-x11-2.0.so (or something
which uses it) is loaded using dlopen() with the RTLD_NOW flag, the
dynamic linker is unable to resolve the function reference and the
operation fails.

(I can provide a test case if desired)

The attached patch adds -lintl to GDK_DEP_LIBS to fix this issue.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-17-07 14:19  foogod         New Issue                                    
02-17-07 14:19  foogod         Status                   new => assigned     
02-17-07 14:19  foogod         Assigned To               => buildroot       
02-17-07 14:19  foogod         File Added:
buildroot.17919.libgtk2_gdk_lintl.patch                    
======================================================================
