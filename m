From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 20 Mar 2007 10:23:11 -0700
Subject: [Buildroot] [buildroot 0001255]: mpfr compilation fails on OS X
Message-ID: <34360a5b3122921c3f225926567df8d6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1255 
====================================================================== 
Reported By:                holin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1255
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             03-03-2007 11:47 PST
Last Modified:              03-20-2007 10:23 PDT
====================================================================== 
Summary:                    mpfr compilation fails on OS X
Description: 
On OS X, mpfr fails to compile with the following linker error:
ld: common symbols not allowed with MH_DYLIB output format with the
-multi_module option
This seems to be gmp's fault and can be fixed with the attached patch.

====================================================================== 

---------------------------------------------------------------------- 
 holin - 03-04-07 02:51  
---------------------------------------------------------------------- 
The gmp autoconf scripts are also bugged and won't install shared
libraries. Attached a fairly large patch to update the scripts. The first
gmp patch might actually be unneccessary after this (not tested, though.) 

---------------------------------------------------------------------- 
 bernhardf - 03-20-07 10:23  
---------------------------------------------------------------------- 
Please fix this upstream instead. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-03-07 11:47  holin          New Issue                                    
03-03-07 11:47  holin          Status                   new => assigned     
03-03-07 11:47  holin          Assigned To               => buildroot       
03-03-07 11:47  holin          File Added: buildroot-070303-gmp-osxbuild.patch  
                 
03-04-07 02:49  holin          File Added:
buildroot-070304-gmp-osxautoconf.patch.gz                    
03-04-07 02:51  holin          Note Added: 0002201                          
03-20-07 10:23  bernhardf      Status                   assigned => closed  
03-20-07 10:23  bernhardf      Note Added: 0002249                          
======================================================================
