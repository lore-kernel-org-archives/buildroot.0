From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:36 -0800
Subject: [Buildroot] [buildroot 0001058]: unable to build root without LARGE
	FILE support
Message-ID: <c0bcc406f090b5cae77234dc57c8902e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1058 
====================================================================== 
Reported By:                marvin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1058
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-30-2006 13:31 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    unable to build root without LARGE FILE support
Description: 
when I try build latest buildroot  with my configuration in which I don't
use large file support compilig stops with erorrs.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 09-30-06 13:56  
---------------------------------------------------------------------- 
You need to provide more information. We need:
a) buildroot's .config
b) uClibc's .config
c) any "special" stuff you pass to the toplevel make
d) optionally busybox's .config in case it is the failing part. 

---------------------------------------------------------------------- 
 marvin - 09-30-06 15:16  
---------------------------------------------------------------------- 
Sorry I try to add better information compiling stops with this:
libc/misc/glob/glob.c: In function `glob_in_dir':
libc/misc/glob/glob.c:368: error: field `d64' has incomplete type
libc/misc/glob/glob.c:369: error: dereferencing pointer to incomplete
type
libc/misc/glob/glob.c:386: warning: assignment from incompatible pointer
type
libc/misc/glob/glob.c:396: error: dereferencing pointer to incomplete
type
libc/misc/glob/glob.c:401: error: dereferencing pointer to incomplete
type
libc/misc/glob/glob.c:401: error: dereferencing pointer to incomplete
type
libc/misc/glob/glob.c:401: error: dereferencing pointer to incomplete
type
libc/misc/glob/glob.c:404: error: dereferencing pointer to incomplete
type
libc/misc/glob/glob.c:410: error: dereferencing pointer to incomplete
type
libc/misc/glob/glob.c:410: error: dereferencing pointer to incomplete
type
libc/misc/glob/glob.c:416: error: dereferencing pointer to incomplete
type
make[2]: *** [libc/misc/glob/glob.os] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory
`/mnt/film2/tmp/tmp/buildroot/toolchain_build_arm/uClibc'
make: ***
[/mnt/film2/tmp/tmp/buildroot/toolchain_build_arm/uClibc/lib/libc.a] Error
2 

---------------------------------------------------------------------- 
 marvin - 09-30-06 15:18  
---------------------------------------------------------------------- 
I attach files that you want. I did't pass any special stuff. And problem
is not in bussybox. I use default config of busybox. 

---------------------------------------------------------------------- 
 yannouvh - 11-18-06 05:41  
---------------------------------------------------------------------- 
Just had the same problem. Seems it comes from uClibc/libc/misc/glob/glob.c
line 364.

I replaced 

#if !defined COMPILE_GLOB64

with

#ifdef COMPILE_GLOB64

and the problem disapeard.

Regards

Yann 

---------------------------------------------------------------------- 
 bernhardf - 11-22-06 13:39  
---------------------------------------------------------------------- 
This is a bug with uClibc, please report there.
Closing the buildroot bug. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-30-06 13:31  marvin         New Issue                                    
09-30-06 13:31  marvin         Status                   new => assigned     
09-30-06 13:31  marvin         Assigned To               => uClibc          
09-30-06 13:56  bernhardf      Note Added: 0001670                          
09-30-06 15:16  marvin         Note Added: 0001676                          
09-30-06 15:16  marvin         File Added: uClibc.config                    
09-30-06 15:16  marvin         File Added: buildroot.config                    
09-30-06 15:18  marvin         Note Added: 0001677                          
11-18-06 05:41  yannouvh       Note Added: 0001745                          
11-22-06 13:39  bernhardf      Status                   assigned => closed  
11-22-06 13:39  bernhardf      Note Added: 0001772                          
11-22-06 13:39  bernhardf      Resolution               open => no change
required
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
