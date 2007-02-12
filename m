From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:51:04 -0800
Subject: [Buildroot] [buildroot 0000229]: readline install puts things in
	very wrong places
Message-ID: <bc03dffb39c293354c668751be88f431@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=229 
====================================================================== 
Reported By:                cac
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   229
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-19-2005 16:54 PDT
Last Modified:              02-12-2007 05:51 PST
====================================================================== 
Summary:                    readline install puts things in very wrong places
Description: 
readline install should place a number of files in $(TARGET_DIR)/include,
info, lib, man.

It is using the path $(TARGET_DIR) multiple times in the install path
construction.

This can be observed easily (e.g. if TARGET_DIR begins "/home/...", the
directory "home" will appear in ../root/

For example:
 readline-5.0/doc/Makefile
    installdirs: ....
        -$(SHELL) $(topdir)/support/mkdirs $(DESTDIR)$(infodir)  ...

   DESTDIR -> /home/cac/build/buildroot/buildroot/build_i386/root
   infodir ->
/home/cac/build/buildroot/buildroot/build_i386/staging_dir/info

These variables are set my the invoking make (readline-5.0/Makefile).

    
readline-
====================================================================== 

---------------------------------------------------------------------- 
 cac - 04-19-05 17:58  
---------------------------------------------------------------------- 
The problem seems to be readline.mk, I've uploaded a patch 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-19-05 16:54  cac            New Issue                                    
04-19-05 17:58  cac            File Added: readline.patch                    
04-19-05 17:58  cac            Note Added: 0000177                          
05-16-05 10:26  andersen       Status                   assigned => closed  
05-16-05 10:26  andersen       Resolution               open => fixed       
02-12-07 05:51  vapier         Status                   closed => assigned  
02-12-07 05:51  vapier         Assigned To              uClibc => buildroot 
======================================================================
