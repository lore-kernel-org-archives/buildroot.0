From: Steve Bennett <sablists@earthlink.net>
Date: Mon, 10 Aug 2009 12:44:50 -0400
Subject: [Buildroot] Yaboot doesn't build
Message-ID: <94D3F226-C067-4F83-8F86-17BF467035B7@earthlink.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!

Am trying to build a PowerPC boot CD with buildroot, and YABOOT  
doesn't seem to build in the latest buildroot.  I get the following  
error:

lib/strstr.c: In function 'strstr':
lib/strstr.c:79: error: label at end of compound statement

After some research, I discovered that problem had been corrected  
quite a long time ago in the next version (1.3.14 - the current  
stable version) of YABOOT.   There appear to be a number of other  
important changes and fixes in 1.3.14, so I went into the package  
folder and changed the make file to pull in version 1.3.14 instead.

This time, it compiled, but then couldn't link because 1.3.14 no  
longer builds it's own personal copy of libext2fs - it's expecting to  
link to it from the local system.   (link parameter is -lext2fs)    
This library is part of the e2fsprogs package, so I tried adding  
that, but it's added to the target, not to the toolchain, and it  
appears yaboot is looking for it in the toolchain, so that continues  
to fail.  I'm not exactly sure how to add it to the toolchain -- it  
doesn't appear to be quite as straightforward as adding a package to  
the target.

Is that the right approach here, or am I missing something?   Anyone  
care to nudge me in the right direction as to how to accomplish this?

Thanks,
-->Steve Bennett
