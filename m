From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Nov 2007 17:19:05 -0800
Subject: [Buildroot] [buildroot 0001585]: [buildroot] Netkit package build
	fails
Message-ID: <36e8e3a67743697941affab0306b3022@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1585 
====================================================================== 
Reported By:                hwstar
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1585
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-11-2007 12:40 PST
Last Modified:              11-12-2007 17:19 PST
====================================================================== 
Summary:                    [buildroot] Netkit package build fails
Description: 
Netkit package does not build 

Make output in "Additional Information" field.

Buildroot config/system info:

SVN revision 20406
Host: Ubuntu 7.04 (Feisty)
Target: i386/i586


====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 11-11-07 23:50  
---------------------------------------------------------------------- 
you did not set BR2_INET_RPC=y when building your toolchain 

---------------------------------------------------------------------- 
 hwstar - 11-12-07 17:19  
---------------------------------------------------------------------- 
After turning on BR2_INET_RPC, it now fails in the linking part of the
build.


Snippet of config file:

#
# Common Toolchain Options
#
BR2_PACKAGE_SSTRIP_TARGET=y
BR2_PACKAGE_SSTRIP_HOST=y
# BR2_ENABLE_MULTILIB is not set
BR2_LARGEFILE=y
BR2_INET_IPV6=y
BR2_INET_RPC=y <<<<<<<<<<
BR2_USE_WCHAR=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y

Output from failed build:

/home/srodgers/projects/limey-linux/limey-linux-test/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
 inetd.o servtab.o builtins.o sig.o daemon.o setproctitle.o mysleep.o  -o
inetd
inetd.o: In function `unregister_rpc':
inetd.c:(.text+0x6a): undefined reference to `pmap_unset'
inetd.o: In function `register_rpc':
inetd.c:(.text+0x138): undefined reference to `pmap_unset'
inetd.c:(.text+0x154): undefined reference to `pmap_set'
servtab.o: In function `loadconfigent':
servtab.c:(.text+0xdc1): undefined reference to `getrpcbyname'
collect2: ld returned 1 exit status
make[3]: *** [inetd] Error 1
make[3]: Leaving directory
`/home/srodgers/projects/limey-linux/limey-linux-test/buildroot/build_i586/netkit-base-0.17/inetd'
make[2]: *** [inetd.build] Error 2
make[2]: Leaving directory
`/home/srodgers/projects/limey-linux/limey-linux-test/buildroot/build_i586/netkit-base-0.17'
make[1]: ***
[/home/srodgers/projects/limey-linux/limey-linux-test/buildroot/build_i586/netkit-base-0.17/inetd/inetd]
Error 2
make[1]: Leaving directory
`/home/srodgers/projects/limey-linux/limey-linux-test/buildroot'
make: *** [buildroot/binaries/limey-linux/rootfs.i586.ext2] Error 2 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-11-07 12:40  hwstar         New Issue                                    
11-11-07 12:40  hwstar         Status                   new => assigned     
11-11-07 12:40  hwstar         Assigned To               => buildroot       
11-11-07 12:44  hwstar         Issue Monitored: hwstar                      
11-11-07 23:50  vanokuten      Note Added: 0002907                          
11-12-07 17:19  hwstar         Note Added: 0002909                          
======================================================================
