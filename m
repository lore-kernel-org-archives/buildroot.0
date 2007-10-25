From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 25 Oct 2007 06:02:37 -0700
Subject: [Buildroot] [buildroot 0001556]: xorg compile errors
Message-ID: <c973808c40da135bb759e66955d3f87d@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1556 
====================================================================== 
Reported By:                carlosz19
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1556
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-25-2007 06:02 PDT
Last Modified:              10-25-2007 06:02 PDT
====================================================================== 
Summary:                    xorg compile errors
Description: 
make[6]: Betrete Verzeichnis 'buildroot/build_i386/xc/lib/X11/xlibi18n'
making all in lib/X11/xlibi18n/lc...
make[7]: Betrete Verzeichnis
'buildroot/build_i386/xc/lib/X11/xlibi18n/lc'
making all in lib/X11/xlibi18n/lc/gen...
make[8]: Betrete Verzeichnis
'buildroot/build_i386/xc/lib/X11/xlibi18n/lc/gen'
rm -f lcGenConv.o
buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc -c -Os 
-ansi -pedantic -Wall -Wpointer-arith -Wundef   -I../../..
-I../../../../.. -I../../../../../exports/include   -Dlinux -D__i386__
-D_POSIX_SOURCE                            -D_BSD_SOURCE -D_GNU_SOURCE
-DX_LOCALE  -DFUNCPROTO=15 -DNARROWPROTO -DXTHREADS  -D_REENTRANT
-DXUSE_MTSAFE_API    -DMALLOC_0_RETURNS_NULL       -fPIC lcGenConv.c
lcGenConv.c: In function 'stdc_mbstowcs':
lcGenConv.c:864: warning: implicit declaration of function 'mbtowc'
lcGenConv.c: In function 'stdc_wcstombs':
lcGenConv.c:1029: error: 'MB_CUR_MAX' undeclared (first use in this
function)
lcGenConv.c:1029: error: (Each undeclared identifier is reported only
once
lcGenConv.c:1029: error: for each function it appears in.)
lcGenConv.c:1030: warning: implicit declaration of function 'wctomb'
lcGenConv.c: In function 'stdc_wcstocts':
lcGenConv.c:1216: error: 'MB_CUR_MAX' undeclared (first use in this
function)
lcGenConv.c: In function 'stdc_ctstowcs':
lcGenConv.c:1539: error: 'MB_CUR_MAX' undeclared (first use in this
function)
lcGenConv.c: In function 'stdc_cstowcs':
lcGenConv.c:1575: error: 'MB_CUR_MAX' undeclared (first use in this
function)
lcGenConv.c: In function 'stdc_wcstostr':
lcGenConv.c:2068: error: 'MB_CUR_MAX' undeclared (first use in this
function)
lcGenConv.c: In function 'stdc_strtowcs':
lcGenConv.c:2597: error: 'MB_CUR_MAX' undeclared (first use in this
function)
make[8]: *** [lcGenConv.o] Fehler 1

i read, that this function is not included in uclibc?
i tried to add a "#define UseXwctomb YES" in the host.def, but it does not
solve the problem.
has anybody an idea?
thanks alot
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-25-07 06:02  carlosz19      New Issue                                    
10-25-07 06:02  carlosz19      Status                   new => assigned     
10-25-07 06:02  carlosz19      Assigned To               => buildroot       
======================================================================
