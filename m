From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 1 Nov 2008 16:49:45 -0700
Subject: [Buildroot] [buildroot 0005924]: Cairo compile fails: no rule to
	make target png
Message-ID: <0ddf992e3fc729fa6a51451d0fcaf93c@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5924 
====================================================================== 
Reported By:                tpk5010
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5924
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-01-2008 16:49 PDT
Last Modified:              11-01-2008 16:49 PDT
====================================================================== 
Summary:                    Cairo compile fails: no rule to make target png
Description: 
When using the latest snapshot of buildroot to compile gtk2, cairo is
pulled in as a dependency. However, cairo_dependencies requires make to
pull in the 'png' target, but such a target does not exist.

Changing line 49 buildroot/package/cairo/cairo.mk to read
CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 zlib libpng
fontconfig $(CAIRO_DEPENDENCIES_EXTRA) pixman $(XSERVER)
fixes the issue.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-01-08 16:49  tpk5010        New Issue                                    
11-01-08 16:49  tpk5010        Status                   new => assigned     
11-01-08 16:49  tpk5010        Assigned To               => buildroot       
======================================================================
