From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 28 Oct 2007 13:59:21 -0700
Subject: [Buildroot] [buildroot 0001549]:
	buildroot/build_i386/grep-2.5.1/src/dfa.c:147: undefined
	reference to `libintl_gettext'
Message-ID: <c4a0d379d88479e07d52e1c1ff3dab9c@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1549 
====================================================================== 
Reported By:                Steve Cornett
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1549
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-22-2007 14:26 PDT
Last Modified:              10-28-2007 13:59 PDT
====================================================================== 
Summary:                    buildroot/build_i386/grep-2.5.1/src/dfa.c:147:
undefined reference to `libintl_gettext'
Description: 
Configure for i386.  Build ends with:

dfa.o: In function `xmalloc':
/home/test/buildroot/build_i386/grep-2.5.1/src/dfa.c:147: undefined
reference to `libintl_gettext'

Input and log attached.
====================================================================== 

---------------------------------------------------------------------- 
 pcwalton - 10-26-07 19:33  
---------------------------------------------------------------------- 
I'm getting this too. Workaround was to copy the configure line that the
buildroot makefile spits out, add LDFLAGS="-lintl" to the front of it, and
reconfigure and make manually. 

---------------------------------------------------------------------- 
 pcwalton - 10-28-07 13:59  
---------------------------------------------------------------------- 
Attached a proposed patch. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-22-07 14:26  Steve Cornett  New Issue                                    
10-22-07 14:26  Steve Cornett  Status                   new => assigned     
10-22-07 14:26  Steve Cornett  Assigned To               => buildroot       
10-22-07 14:26  Steve Cornett  File Added: InputAndOutput.tar                   

10-26-07 19:33  pcwalton       Note Added: 0002862                          
10-28-07 13:59  pcwalton       File Added: buildroot-grep.patch                 
  
10-28-07 13:59  pcwalton       Note Added: 0002863                          
======================================================================
