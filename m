From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 19 Sep 2007 07:18:02 -0700
Subject: [Buildroot] [buildroot 0001445]: openssh-3.9p1 fails to compile
Message-ID: <dd6b7a5a12920c6d5ffd19a255582575@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1445 
====================================================================== 
Reported By:                alanszlosek
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1445
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             07-26-2007 05:50 PDT
Last Modified:              09-19-2007 07:18 PDT
====================================================================== 
Summary:                    openssh-3.9p1 fails to compile
Description: 
When buildroot tries to compile openssh it fails. I'm using buildroot
revision 19264, uclibc-0.9.29, busybox-1.6.1, gcc-4.2.0.

What follows is the output of the compilation:

/home/alan/downloads/buildroot/pentium/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-g -O2 -Wall -Wpointer-arith -Wno-uninitialized -I. -I.  -DSSHDIR=\"/etc\"
-D_PATH_SSH_PROGRAM=\"/usr/bin/ssh\"
-D_PATH_SSH_ASKPASS_DEFAULT=\"/usr/sbin/ssh-askpass\"
-D_PATH_SFTP_SERVER=\"/usr/sbin/sftp-server\"
-D_PATH_SSH_KEY_SIGN=\"/usr/sbin/ssh-keysign\"
-D_PATH_SSH_PIDDIR=\"/var/run\" -D_PATH_PRIVSEP_CHROOT_DIR=\"/var/empty\"
-DSSH_RAND_HELPER=\"/usr/sbin/ssh-rand-helper\" -DHAVE_CONFIG_H -c scp.c
/home/alan/downloads/buildroot/pentium/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/alan/downloads/buildroot/pentium/build_i586/staging_dir/lib
-L/home/alan/downloads/buildroot/pentium/build_i586/staging_dir/usr/lib -o
scp scp.o progressmeter.o -L. -Lopenbsd-compat/  -lssh -lopenbsd-compat
-lcrypto -lutil -lz  -lcrypt -lresolv -lresolv
/home/alan/downloads/buildroot/pentium/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld:
warning: cannot find entry symbol _start; defaulting to 08049170
scp.o: In function `bwlimit':
/home/alan/downloads/buildroot/pentium/build_i586/openssh-3.9p1/scp.c:680:
undefined reference to `__fixunsdfdi'
/home/alan/downloads/buildroot/pentium/build_i586/openssh-3.9p1/scp.c:682:
undefined reference to `__udivdi3'
/home/alan/downloads/buildroot/pentium/build_i586/openssh-3.9p1/scp.c:683:
undefined reference to `__umoddi3'
make[1]: *** [scp] Error 1
make[1]: Leaving directory
`/home/alan/downloads/buildroot/pentium/build_i586/openssh-3.9p1'
make: ***
[/home/alan/downloads/buildroot/pentium/build_i586/openssh-3.9p1/ssh]
Error 2

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 07-27-07 06:16  
---------------------------------------------------------------------- 
http://lists.busybox.net/lists/buildroot/2007-July/003351.html 

---------------------------------------------------------------------- 
 bernhardf - 09-19-07 07:18  
---------------------------------------------------------------------- 
ssh was updated in the meantime. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-26-07 05:50  alanszlosek    New Issue                                    
07-26-07 05:50  alanszlosek    Status                   new => assigned     
07-26-07 05:50  alanszlosek    Assigned To               => buildroot       
07-27-07 06:16  bernhardf      Note Added: 0002642                          
09-19-07 07:18  bernhardf      Status                   assigned => closed  
09-19-07 07:18  bernhardf      Note Added: 0002761                          
======================================================================
