From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 2 Jun 2007 01:46:06 -0700
Subject: [Buildroot] [buildroot 0001257]: Some build targets use hard-coded
	library names, which causes forced rebuild on Mac OS X
Message-ID: <5c6eac89d00a6cc00ae8c073c035f913@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1257 
====================================================================== 
Reported By:                holin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1257
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-04-2007 05:38 PST
Last Modified:              06-02-2007 01:46 PDT
====================================================================== 
Summary:                    Some build targets use hard-coded library names,
which causes forced rebuild on Mac OS X
Description: 
Library names ending with .so should have .dylib in makefile targets on OS
X. Otherwise, the build system always thinks that the library isn't built
and tries to (re-)build it on every make invocation. Attached a patch that
adds a config option for library filename extension and fixes the packages
that seemed to suffer from this. 
====================================================================== 

---------------------------------------------------------------------- 
 holin - 06-02-07 00:14  
---------------------------------------------------------------------- 
Attached an updated patch for current SVN. Some EXEEXTs would probably be
needed in binutils.mk makerules for Windows hosts. 

---------------------------------------------------------------------- 
 bernhardf - 06-02-07 01:46  
---------------------------------------------------------------------- 
You have to use LIBTGTEXT where possible (i.e. in packages that can be
built as static or dynamic library). See the toplevel Makefile for
LIBTGTEXT.

Please update the patch accordingly.
thanks, 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-04-07 05:38  holin          New Issue                                    
03-04-07 05:38  holin          Status                   new => assigned     
03-04-07 05:38  holin          Assigned To               => buildroot       
03-04-07 05:38  holin          File Added: buildroot-070304-dlext.patch         
          
03-31-07 09:43  bendiken       Issue Monitored: bendiken                    
06-02-07 00:13  holin          File Added: buildroot-070602-dlext-v2.patch      
             
06-02-07 00:14  holin          Note Added: 0002427                          
06-02-07 01:46  bernhardf      Note Added: 0002428                          
======================================================================
