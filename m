From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 18 Oct 2008 15:44:50 -0700
Subject: [Buildroot] [buildroot 0005494]: Mesa should depend on C++
Message-ID: <cadc422e1aa2139c47ead6489e0eab7f@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5494 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5494
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-18-2008 06:19 PDT
Last Modified:              10-18-2008 15:44 PDT
====================================================================== 
Summary:                    Mesa should depend on C++
Description: 
Every packaged which depends on Mesa should depends on C++ compiler too,
otherwise the following crash happens:

[...]

/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-c -I../../../include -Iinclude -Iinternals -Ilibnurbs/internals
-Ilibnurbs/interface -Ilibnurbs/nurbtess -Wall -Os 
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -fPIC -m32 -D_POSIX_SOURCE
-D_POSIX_C_SOURCE=199309L -D_SVID_SOURCE -D_BSD_SOURCE -D_GNU_SOURCE
-DPTHREADS -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER
-DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS
-DHAVE_POSIX_MEMALIGN -fno-strict-aliasing -DNDEBUG -DLIBRARYBUILD
libnurbs/interface/bezierEval.cc -o libnurbs/interface/bezierEval.o
make[6]:
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++:
Command not found
make[6]: *** [libnurbs/interface/bezierEval.o] Error 127
make[6]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/Mesa-7.0.3/src/glu/sgi'
make[5]: *** [default] Error 2
make[5]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/Mesa-7.0.3/src/glu/sgi'
make[4]: *** [default] Error 2
make[4]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/Mesa-7.0.3/src/glu'
make[3]: *** [subdirs] Error 1
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/Mesa-7.0.3/src'
make[2]: *** [default] Error 1
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/Mesa-7.0.3'
make[1]: *** [linux-dri-x86] Error 2
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/Mesa-7.0.3'
make: *** [/home/roberto/gles/buildroot/build_i586/Mesa-7.0.3/.built]
Error 2
====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 10-18-08 15:44  
---------------------------------------------------------------------- 
mesa3d_select_cpp.patch2: the previous patch select CXX but compiling is
not enough because the stdlibcpp are required for the system to run. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-18-08 06:19  robang74       New Issue                                    
10-18-08 06:19  robang74       Status                   new => assigned     
10-18-08 06:19  robang74       Assigned To               => buildroot       
10-18-08 06:19  robang74       Issue Monitored: robang74                    
10-18-08 13:43  robang74       File Added: mesa3d_select_cpp.patch              
     
10-18-08 15:43  robang74       File Added: mesa3d_select_cpp.patch2             
      
10-18-08 15:44  robang74       Note Added: 0013824                          
======================================================================
