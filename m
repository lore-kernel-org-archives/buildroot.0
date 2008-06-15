From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 15 Jun 2008 12:19:15 -0700
Subject: [Buildroot] [buildroot 0003774]: valgrind doesn't build for powerpc
	target
Message-ID: <2745d6cbd939a92b8c833236b7b73ba9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been RESOLVED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3774 
====================================================================== 
Reported By:                fabo
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3774
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     resolved
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             06-15-2008 03:58 PDT
Last Modified:              06-15-2008 12:19 PDT
====================================================================== 
Summary:                    valgrind doesn't build for powerpc target
Description: 
then mv -f ".deps/libcoregrind_ppc32_linux_a-readstabs.Tpo"
".deps/libcoregrind_ppc32_linux_a-readstabs.Po"; else rm -f
".deps/libcoregrind_ppc32_linux_a-readstabs.Tpo"; exit 1; fi
In file included from m_debuginfo/readstabs.c:46:
/home/test/build-area/buildroot/buildroot/build_powerpc/staging_dir/usr/include/a.out.h:4:26:
error: linux/a.out.h: No such file or directory
m_debuginfo/readstabs.c: In function
'vgModuleLocal_read_debuginfo_stabs':
m_debuginfo/readstabs.c:123: error: invalid application of 'sizeof' to
incomplete type 'struct nlist'
m_debuginfo/readstabs.c:123: warning: division by zero
m_debuginfo/readstabs.c:126: error: invalid use of undefined type 'struct
nlist'
m_debuginfo/readstabs.c:126: error: dereferencing pointer to incomplete
type
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 06-15-08 12:19  
---------------------------------------------------------------------- 
Thanks. There were 2 problems:

- valgrind didn't search kernel headers (fixed in r22355)
- linux/a.out.h wasn't exported from the kernel (fixed in r22354)

Notice that you need to use 2.6.25.x kernel headers for it to work. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-15-08 03:58  fabo           New Issue                                    
06-15-08 03:58  fabo           Status                   new => assigned     
06-15-08 03:58  fabo           Assigned To               => buildroot       
06-15-08 12:19  jacmet         Status                   assigned => resolved
06-15-08 12:19  jacmet         Resolution               open => fixed       
06-15-08 12:19  jacmet         Note Added: 0008244                          
======================================================================
