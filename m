From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 4 Sep 2008 14:30:20 -0700
Subject: [Buildroot] [buildroot 0004804]: lzo1x.h not found
Message-ID: <d7e8c0514912531c2c361c92af806cd2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4804 
====================================================================== 
Reported By:                iceman_im
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4804
Category:                   Other
Reproducibility:            have not tried
Severity:                   crash
Priority:                   normal
Status:                     feedback
====================================================================== 
Date Submitted:             09-03-2008 08:43 PDT
Last Modified:              09-04-2008 14:30 PDT
====================================================================== 
Summary:                    lzo1x.h not found
Description: 
I try to make a compilation for arm architecutre for an AT91sam9260EK board
and I have a compilation error in mtd_orig...

Looks like lzo1x.h could not be found but :

# find -name lzo1x.h
./build_arm_wchar/lzo-2.03/include/lzo/lzo1x.h
./build_arm_wchar/staging_dir/usr/include/lzo/lzo1x.h

====================================================================== 

---------------------------------------------------------------------- 
 hmoffatt - 09-03-08 18:40  
---------------------------------------------------------------------- 
Fixed in r23315.. thanks

Please consider sending compile error logs in English (eg set LANG=C
before compiling). Thanks 

---------------------------------------------------------------------- 
 iceman_im - 09-04-08 08:25  
---------------------------------------------------------------------- 
Sorry for the french error log, next time it will be in english.
Thanks for the fix but I allready have the same problem...

In fact the build works find for an ext2 file system but crashed for a
jffs2 one... 

---------------------------------------------------------------------- 
 vintonc - 09-04-08 14:30  
---------------------------------------------------------------------- 
I have the same issue.  I have verified that lzo and lzo-devel are
installed on the host system, they were suggested as possible causes of
the issue elsewhere. It will build for ext2 only just fine. I am currently
trying to build for jffs2 only.  I am running R23324, newer than the fixed
note indicates.

/home/vintonc/buildroot/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
-I. -I./include
-I/home/vintonc/buildroot/buildroot/toolchain_build_arm/linux/include
-I/home/vintonc/buildroot/buildroot/build_arm/staging_dir/usr/include -Os 
-I/home/vintonc/buildroot/buildroot/build_arm/staging_dir/usr/include
-I/home/vintonc/buildroot/buildroot/build_arm/staging_dir/include
--sysroot=/home/vintonc/buildroot/buildroot/build_arm/staging_dir/
-isysroot /home/vintonc/buildroot/buildroot/build_arm/staging_dir
-mtune=arm920t -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -g -c -o
/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/compr_lzo.o
compr_lzo.c -g
-Wp,-MD,/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/.compr_lzo.c.dep
compr_lzo.c:29:19: error: lzo1x.h: No such file or directory
compr_lzo.c: In function 'jffs2_lzo_cmpr':
compr_lzo.c:56: error: 'LZO_E_OK' undeclared (first use in this function)
compr_lzo.c:56: error: (Each undeclared identifier is reported only once
compr_lzo.c:56: error: for each function it appears in.)
compr_lzo.c: In function 'jffs2_lzo_decompress':
compr_lzo.c:76: error: 'LZO_E_OK' undeclared (first use in this function)
compr_lzo.c: In function 'jffs2_lzo_init':
compr_lzo.c:95: error: 'LZO1X_999_MEM_COMPRESS' undeclared (first use in
this function)
make[1]: ***
[/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/compr_lzo.o] Error
1
rm /home/vintonc/buildroot/buildroot/build_arm/mtd_orig/ftl_check.o
/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/mkfs.jffs.o
/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/doc_loadbios.o
/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/flash_erase.o
/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/ftl_format.o
/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/nanddump.o
make[1]: Leaving directory
`/home/vintonc/buildroot/buildroot/build_arm/mtd_orig'
make: ***
[/home/vintonc/buildroot/buildroot/build_arm/mtd_orig/flash_erase] Error
2
[vintonc at discovery buildroot]$ svn info
Path: .
URL: svn://uclibc.org/trunk/buildroot
Repository Root: svn://uclibc.org
Repository UUID: 69ca8d6d-28ef-0310-b511-8ec308f3f277
Revision: 23324
Node Kind: directory
Schedule: normal
Last Changed Author: hamish
Last Changed Rev: 23319
Last Changed Date: 2008-09-04 01:50:31 -0400 (Thu, 04 Sep 2008) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-03-08 08:43  iceman_im      New Issue                                    
09-03-08 08:43  iceman_im      Status                   new => assigned     
09-03-08 08:43  iceman_im      Assigned To               => buildroot       
09-03-08 18:40  hmoffatt       Status                   assigned => closed  
09-03-08 18:40  hmoffatt       Note Added: 0010974                          
09-03-08 18:40  hmoffatt       Resolution               open => fixed       
09-04-08 08:21  iceman_im      Issue Monitored: iceman_im                    
09-04-08 08:22  iceman_im      Issue End Monitor: iceman_im                    
09-04-08 08:25  iceman_im      Status                   closed => feedback  
09-04-08 08:25  iceman_im      Resolution               fixed => reopened   
09-04-08 08:25  iceman_im      Note Added: 0011004                          
09-04-08 14:30  vintonc        Note Added: 0011054                          
======================================================================
