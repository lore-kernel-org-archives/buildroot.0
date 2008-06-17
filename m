From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 17 Jun 2008 08:04:41 -0700
Subject: [Buildroot] [buildroot 0003814]: libogg & libvorbis instalation
	fails
Message-ID: <4f77b6cc04c67150bb00917807ed32f6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been RESOLVED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3814 
====================================================================== 
Reported By:                tklas
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3814
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     resolved
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             06-16-2008 04:14 PDT
Last Modified:              06-17-2008 08:04 PDT
====================================================================== 
Summary:                    libogg & libvorbis instalation fails
Description: 
Ogg and Vorbis libraries fails to install. I changed libogg.mk and
libvorbis.mk (attached patch) and it works. But I'm not sure if it is
correct, please check it.

====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 06-16-08 04:43  
---------------------------------------------------------------------- 
Thanks, but this is already fixed in trunk (actually, the header install
targets have been removed as the global BR2_HAVE_DEVFILES option handles
it) 

---------------------------------------------------------------------- 
 tklas - 06-16-08 08:28  
---------------------------------------------------------------------- 
No, on my system fails installation of library file libogg.a:

<PRE>
cp -dpf
/src/Common/buildroot-20080616-iMX31-423P/build_arm/libogg-1.1.3/lib/libogg.a
/src/Common/buildroot-20080616-iMX31-423P/project_build_arm/uclibc/root/usr/lib/
cp: cannot stat
`/src/Common/buildroot-20080616-iMX31-423P/build_arm/libogg-1.1.3/lib/libogg.a':
No such file or directory
make: ***
[/src/Common/buildroot-20080616-iMX31-423P/project_build_arm/uclibc/root/usr/lib/libogg.a]
Error 1
</PRE>

After libogg fixup, libvorbis fails at the similar point. I tested it on
actual snapshot 20080616, with and without BR2_HAVE_DEVFILES.

 

---------------------------------------------------------------------- 
 jacmet - 06-16-08 08:41  
---------------------------------------------------------------------- 
But the code that copies libogg.a libvorbis.a is gone from svn - Are you
using latest trunk? 

---------------------------------------------------------------------- 
 tklas - 06-17-08 07:57  
---------------------------------------------------------------------- 
No, I used yesterday snapshot (20080616). It's ok in SVN and current
snapshot, thanks. 

---------------------------------------------------------------------- 
 jacmet - 06-17-08 08:04  
---------------------------------------------------------------------- 
Ok, great - closing the issue then. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-16-08 04:14  tklas          New Issue                                    
06-16-08 04:14  tklas          Status                   new => assigned     
06-16-08 04:14  tklas          Assigned To               => buildroot       
06-16-08 04:14  tklas          File Added: vorbis_install.patch                 
  
06-16-08 04:43  jacmet         Status                   assigned => resolved
06-16-08 04:43  jacmet         Resolution               open => fixed       
06-16-08 04:43  jacmet         Note Added: 0008314                          
06-16-08 08:26  tklas          Status                   resolved => feedback
06-16-08 08:26  tklas          Resolution               fixed => reopened   
06-16-08 08:26  tklas          Note Added: 0008334                          
06-16-08 08:27  tklas          Note Edited: 0008334                         
06-16-08 08:28  tklas          Note Edited: 0008334                         
06-16-08 08:41  jacmet         Note Added: 0008344                          
06-17-08 07:57  tklas          Note Added: 0008354                          
06-17-08 08:04  jacmet         Status                   feedback => resolved
06-17-08 08:04  jacmet         Resolution               reopened => fixed   
06-17-08 08:04  jacmet         Note Added: 0008364                          
======================================================================
