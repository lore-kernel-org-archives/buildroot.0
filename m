From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 13 May 2007 17:42:19 -0700
Subject: [Buildroot] [buildroot 0001345]: uClibc fails to mmap shared
	libraries with CONFIG_PAGE_SIZE_16KB set in kernel
Message-ID: <be1a5ccb52a910fec9017148901686e6@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1345 
====================================================================== 
Reported By:                redhatter
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1345
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-13-2007 17:40 PDT
Last Modified:              05-13-2007 17:42 PDT
====================================================================== 
Summary:                    uClibc fails to mmap shared libraries with
CONFIG_PAGE_SIZE_16KB set in kernel
Description: 
Hi...

Recently I started building some uClibc userland environments for a mipsel
target.  My build host is a Lemote Fulong miniPC running a Loongson2E
processor (subset MIPS-3), and I've also been doing testing with a Cobalt
Qube2 (MIPS-4).

Everything builds fine, however, when I try to chroot in on the Loongson,
I get told uClibc "can't map" the libraries.  However, when I rsync this
chroot across to the Qube2, everything works fine.

It would appear that uClibc's ld.so assumes the kernel uses a page size of
4KB (0x1000).  When it specifies an offset of 0x3000, this works fine on a
kernel with a 4KB page size, since 3?1000h=3000h.  However, this fails
when the kernel has a 16KB page size (0x4000), since 0x3000 is not a
multiple of 0x4000.  Presumably it'll fail when 64KB pages are in use too.
====================================================================== 

---------------------------------------------------------------------- 
 redhatter - 05-13-07 17:42  
---------------------------------------------------------------------- 
Whoops, this was _meant_ for the uClibc project, not buildroot.  Can this
be reassigned please? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-13-07 17:40  redhatter      New Issue                                    
05-13-07 17:40  redhatter      Status                   new => assigned     
05-13-07 17:40  redhatter      Assigned To               => buildroot       
05-13-07 17:42  redhatter      Note Added: 0002354                          
======================================================================
