From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 26 Oct 2008 02:16:43 -0700
Subject: [Buildroot] [buildroot 0003794]: HAL won't compile for i686 host
	(Build is fedora 8 on i686)
Message-ID: <148e8b1f36160ef8d7db55eeee8691c6@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3794 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3794
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-16-2008 00:43 PDT
Last Modified:              10-26-2008 02:16 PDT
====================================================================== 
Summary:                    HAL won't compile for i686 host (Build is fedora 8
on i686)
Description: 
The compilation fails with lots of messages, probably caused by some mess
in -I options. A transcript from compilation of HAL is attached.
====================================================================== 

---------------------------------------------------------------------- 
 pepe - 10-26-08 02:16  
---------------------------------------------------------------------- 
'hal_libs.patch' will correct some library paths and fix the errors
reported in 'hal-log'

The build now breaks claiming INT_MAX is undefined in
hald/linux/addon/addon-storage.c. Dont know how to fix this.

'addon-storage' can be removed from the Makefile however.
In that case, the build breaks some time later with:


/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
-Os -I/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include
-I/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/include
--sysroot=/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/
-isysroot /home/pepe/svn/buildroot/buildroot/build_i686/staging_dir
-mtune=i686 -march=i686 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I../..
-DPACKAGE_SYSCONF_DIR=\"/etc\" -DPACKAGE_DATA_DIR=\"/usr/share\"
-DPACKAGE_BIN_DIR=\"/usr/bin\" -DPACKAGE_LOCALE_DIR=\"/usr/share/locale\"
-DPACKAGE_LOCALSTATEDIR=\"/var\" -I../.. -I..
-I/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include/glib-2.0
-I/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/lib/glib/include
-I/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include/dbus-1.0
-I/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/lib/dbus-1.0/include
-Os -I/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include
-I/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/include
--sysroot=/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/
-isysroot /home/pepe/svn/buildroot/buildroot/build_i686/staging_dir
-mtune=i686 -march=i686 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/lib/glib-2.0/include
-Wall -Wchar-subscripts -Wmissing-declarations -Wnested-externs
-Wpointer-arith -Wcast-align -Wsign-compare -MT classdev.lo -MD -MP -MF
.deps/classdev.Tpo -c classdev.c  -fPIC -DPIC -o .libs/classdev.o
In file included from
/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include/linux/netdevice.h:28,
                 from
/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include/linux/if_arp.h:26,
                 from classdev.c:35:
/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include/linux/if.h:166:
error: field 'ifru_addr' has incomplete type
/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include/linux/if.h:167:
error: field 'ifru_dstaddr' has incomplete type
/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include/linux/if.h:168:
error: field 'ifru_broadaddr' has incomplete type
/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include/linux/if.h:169:
error: field 'ifru_netmask' has incomplete type
/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include/linux/if.h:170:
error: field 'ifru_hwaddr' has incomplete type
In file included from classdev.c:35:
/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include/linux/if_arp.h:105:
error: field 'arp_pa' has incomplete type
/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include/linux/if_arp.h:106:
error: field 'arp_ha' has incomplete type
/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include/linux/if_arp.h:108:
error: field 'arp_netmask' has incomplete type
/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include/linux/if_arp.h:113:
error: field 'arp_pa' has incomplete type
/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include/linux/if_arp.h:114:
error: field 'arp_ha' has incomplete type
/home/pepe/svn/buildroot/buildroot/build_i686/staging_dir/usr/include/linux/if_arp.h:116:
error: field 'arp_netmask' has incomplete type 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-16-08 00:43  KHAksnes       New Issue                                    
06-16-08 00:43  KHAksnes       Status                   new => assigned     
06-16-08 00:43  KHAksnes       Assigned To               => buildroot       
06-16-08 00:43  KHAksnes       File Added: hal-log                          
10-26-08 02:07  pepe           Issue Monitored: pepe                        
10-26-08 02:13  pepe           File Added: hal_libs.patch                    
10-26-08 02:16  pepe           Note Added: 0014184                          
======================================================================
