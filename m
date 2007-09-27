From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 27 Sep 2007 05:47:48 -0700
Subject: [Buildroot] [buildroot 0001514]: building with soft-float enabled
	fails
Message-ID: <4e3d26aa1738fdfc13ac9e54e40018d5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1514 
====================================================================== 
Reported By:                mjancar
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1514
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-27-2007 05:47 PDT
Last Modified:              09-27-2007 05:47 PDT
====================================================================== 
Summary:                    building with soft-float enabled fails
Description: 
Enabling soft-float causes the build process fail with the following error.
After manualy changing to
toolchain_build_mips_nofpu/uClibc-0.9.29/libc/soft-fp, running make, and
symlinking the ../../libc directory, the build was able to continue. I
have reproduced the problem also with powerpc architecture selected, so it
doesnt seem to be architecture specific.

make[1]: Entering directory
`/home/marian/c/br/buildroot/toolchain_build_mips_nofpu/uClibc-0.9.29'
make[2]: `conf' is up to date.
ln -fs sgidefs.h ./include/
make[3]: `conf' is up to date.
ln -fs sgidefs.h ./include/
  STRIP -x -R .note -R .comment lib/libc.a
/home/marian/c/br/buildroot/build_mips/staging_dir/usr/bin/mips-linux-uclibc-strip:
'libc/soft-fp/./libc/soft-fp/adddf3.os': No such file
/home/marian/c/br/buildroot/build_mips/staging_dir/usr/bin/mips-linux-uclibc-strip:
'libc/soft-fp/./libc/soft-fp/addsf3.os': No such file
/home/marian/c/br/buildroot/build_mips/staging_dir/usr/bin/mips-linux-uclibc-strip:
'libc/soft-fp/./libc/soft-fp/addtf3.os': No such file
/home/marian/c/br/buildroot/build_mips/staging_dir/usr/bin/mips-linux-uclibc-strip:
'libc/soft-fp/./libc/soft-fp/divdf3.os': No such file
/home/marian/c/br/buildroot/build_mips/staging_dir/usr/bin/mips-linux-uclibc-strip:
'libc/soft-fp/./libc/soft-fp/divsf3.os': No such file

[snip]

/home/marian/c/br/buildroot/build_mips/staging_dir/usr/bin/mips-linux-uclibc-strip:
'libc/soft-fp/./libc/soft-fp/unorddf2.os': No such file
/home/marian/c/br/buildroot/build_mips/staging_dir/usr/bin/mips-linux-uclibc-strip:
'libc/soft-fp/./libc/soft-fp/unordsf2.os': No such file
/home/marian/c/br/buildroot/build_mips/staging_dir/usr/bin/mips-linux-uclibc-strip:
'libc/soft-fp/./libc/soft-fp/unordtf2.os': No such file
make[2]: *** [lib/libc.a] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory
`/home/marian/c/br/buildroot/toolchain_build_mips_nofpu/uClibc-0.9.29'
make: ***
[/home/marian/c/br/buildroot/toolchain_build_mips_nofpu/uClibc-0.9.29/lib/libc.a]
Error 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-27-07 05:47  mjancar        New Issue                                    
09-27-07 05:47  mjancar        Status                   new => assigned     
09-27-07 05:47  mjancar        Assigned To               => buildroot       
======================================================================
