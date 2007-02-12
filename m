From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:20 -0800
Subject: [Buildroot] [buildroot 0000571]: sysfstools-1.3.0 fails to build at
	all with Linux 2.6.x headers
Message-ID: <b74c16512870c9e462a07e804552c711@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=571 
====================================================================== 
Reported By:                lord_apollyon
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   571
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-30-2005 04:27 PST
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    sysfstools-1.3.0 fails to build at all with Linux
2.6.x headers
Description: 
It looks like there's some kind of libtool or build system problem with
sysfsutils.  The following error is observed when attempting to build
sysfsutils-1.3.0 with gcc 3.4.4 or 3.3.5 against kernel 2.6.12 headers:

make -j1 -C /rootnew/buildroot/build_i686/sysfsutils-1.3.0
make[1]: Entering directory
`/rootnew/buildroot/build_i686/sysfsutils-1.3.0'
make  all-recursive
make[2]: Entering directory
`/rootnew/buildroot/build_i686/sysfsutils-1.3.0'
Making all in lib
make[3]: Entering directory
`/rootnew/buildroot/build_i686/sysfsutils-1.3.0/lib'
source='sysfs_utils.c' object='libsysfs_la-sysfs_utils.lo' libtool=yes \
depfile='.deps/libsysfs_la-sysfs_utils.Plo'
tmpdepfile='.deps/libsysfs_la-sysfs_utils.TPlo' \
depmode=gcc3 /bin/sh ../depcomp \
/bin/sh ../libtool --mode=compile
/rootnew/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I. -I.. -I../include   -Wall -W -Wshadow
-Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
-Wredundant-decls -pipe -O2 -march=pentium3 -mcpu=pentium3   -c -o
libsysfs_la-sysfs_utils.lo `test -f 'sysfs_utils.c' || echo
'./'`sysfs_utils.c
rm -f .libs/libsysfs_la-sysfs_utils.lo
/rootnew/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I. -I.. -I../include -Wall -W -Wshadow
-Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
-Wredundant-decls -pipe -O2 -march=pentium3 -mcpu=pentium3 -c
sysfs_utils.c -MT libsysfs_la-sysfs_utils.lo -MD -MP -MF
.deps/libsysfs_la-sysfs_utils.TPlo  -fPIC -DPIC
`-mcpu=' is deprecated. Use `-mtune=' or '-march=' instead.
`-mcpu=' is deprecated. Use `-mtune=' or '-march=' instead.
mv -f libsysfs_la-sysfs_utils.o .libs/libsysfs_la-sysfs_utils.lo
mv: cannot stat `libsysfs_la-sysfs_utils.o': No such file or directory
make[3]: *** [libsysfs_la-sysfs_utils.lo] Error 1
make[3]: Leaving directory
`/rootnew/buildroot/build_i686/sysfsutils-1.3.0/lib'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/rootnew/buildroot/build_i686/sysfsutils-1.3.0'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/rootnew/buildroot/build_i686/sysfsutils-1.3.0'
make: *** [/rootnew/buildroot/build_i686/sysfsutils-1.3.0/.compiled] Error
2

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-22-06 04:37  
---------------------------------------------------------------------- 
Works for me with linux-2.6.19-1 headers and gcc-4.2.
Please update and retry and let us know if this is fixed.
thanks, 

---------------------------------------------------------------------- 
 bernhardf - 01-19-07 08:18  
---------------------------------------------------------------------- 
Works with sysfsutils-2.1.0 and gcc >= 4.2, linux >= 2.6.19.2 headers,
closing. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-30-05 04:27  lord_apollyon  New Issue                                    
11-30-05 04:27  lord_apollyon  Status                   new => assigned     
11-30-05 04:27  lord_apollyon  Assigned To               => uClibc          
12-22-06 04:37  bernhardf      Note Added: 0001917                          
12-22-06 04:37  bernhardf      Status                   assigned => feedback
01-19-07 08:18  bernhardf      Status                   feedback => closed  
01-19-07 08:18  bernhardf      Note Added: 0001998                          
01-19-07 08:18  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
