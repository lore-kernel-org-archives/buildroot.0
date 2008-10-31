From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 30 Oct 2008 20:25:35 -0700
Subject: [Buildroot] [buildroot 0005884]: zlib and pciutils build in the
	wrong order
Message-ID: <361589f9afd607c29335bcfad594e293@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5884 
====================================================================== 
Reported By:                peejay
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5884
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-30-2008 20:25 PDT
Last Modified:              10-30-2008 20:25 PDT
====================================================================== 
Summary:                    zlib and pciutils build in the wrong order
Description: 
pciutils requires zlib, but zlib seems to build after pciutils. The obvious
workaround is to disable pciutils and let zlib build, then add pciutils
back in and build again.

/home/paul.jones/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-Os  -I/home/paul.jones/buildroot/build_arm/staging_dir/usr/include
-I/home/paul.jones/buildroot/build_arm/staging_dir/include -mtune=arm920t
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W
-Wno-parentheses -Wstrict-prototypes -Wmissing-prototypes   -c -o names.o
names.c
names.c:18:18: error: zlib.h: No such file or directory
names.c:19: error: expected '=', ',', ';', 'asm' or '__attribute__' before
'pci_file'
names.c:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before
'pci_open'
names.c:187: error: expected declaration specifiers or '...' before
'pci_file'
names.c: In function 'id_parse_list':
names.c:197: warning: implicit declaration of function 'gzgets'
names.c:197: error: 'f' undeclared (first use in this function)
names.c:197: error: (Each undeclared identifier is reported only once
names.c:197: error: for each function it appears in.)
names.c:203: warning: implicit declaration of function 'gzeof'
names.c: In function 'pci_load_name_list':
names.c:321: error: 'pci_file' undeclared (first use in this function)
names.c:321: error: expected ';' before 'f'
names.c:327: error: 'f' undeclared (first use in this function)
names.c:327: warning: implicit declaration of function 'pci_open'
names.c:331: error: too many arguments to function 'id_parse_list'
names.c:332: warning: implicit declaration of function 'gzerror'
names.c:332: error: 'Z_ERRNO' undeclared (first use in this function)
names.c:332: warning: implicit declaration of function 'zError'
names.c:332: warning: assignment makes pointer from integer without a
cast
names.c:333: warning: implicit declaration of function 'gzclose'
make[2]: *** [names.o] Error 1
make[2]: Leaving directory
`/home/paul.jones/buildroot/build_arm/pciutils-2.2.10/lib'
make[1]: *** [lib/libpci.a] Error 2
make[1]: Leaving directory
`/home/paul.jones/buildroot/build_arm/pciutils-2.2.10'
make: *** [/home/paul.jones/buildroot/build_arm/pciutils-2.2.10/.compiled]
Error 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-30-08 20:25  peejay         New Issue                                    
10-30-08 20:25  peejay         Status                   new => assigned     
10-30-08 20:25  peejay         Assigned To               => buildroot       
======================================================================
