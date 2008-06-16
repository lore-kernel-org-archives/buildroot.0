From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 16 Jun 2008 08:26:06 -0700
Subject: [Buildroot] [buildroot 0003814]: libogg & libvorbis instalation
	fails
Message-ID: <a1fdd4450b18ad254d93a4368cb4f292@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been REOPENED. 
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
Status:                     feedback
====================================================================== 
Date Submitted:             06-16-2008 04:14 PDT
Last Modified:              06-16-2008 08:26 PDT
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
 tklas - 06-16-08 08:26  
---------------------------------------------------------------------- 
No, on my system fails installation of library file libogg.a:

<PRE>
cp -dpf
/shared-archiv/touchCUE/src/Common/buildroot-20080616-iMX31-423P/build_arm/libogg-1.1.3/lib/libogg.a
/shared-archiv/touchCUE/src/Common/buildroot-20080616-iMX31-423P/project_build_arm/uclibc/root/usr/lib/
cp: cannot stat
`/shared-archiv/touchCUE/src/Common/buildroot-20080616-iMX31-423P/build_arm/libogg-1.1.3/lib/libogg.a':
No such file or directory
make: ***
[/shared-archiv/touchCUE/src/Common/buildroot-20080616-iMX31-423P/project_build_arm/uclibc/root/usr/lib/libogg.a]
Error 1
</PRE>

After libogg fixup, libvorbis fails at the similar point. 

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
======================================================================
