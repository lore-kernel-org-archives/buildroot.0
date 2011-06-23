From: Dominic Newton <dominic.newton@in-2-technology.co.uk>
Date: Thu, 23 Jun 2011 18:49:13 +0100
Subject: [Buildroot] Compiling problem with NPTL threads on x86
Message-ID: <4E037C99.2030308@in-2-technology.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm fairly new to buildroot and have run into a problem that I have 
partially fixed - but I could use a few pointers.

I've built several systems using buildroot that run perfectly OK. 
However I would like to use NPTL library rather than linuxthreads.

I've had the same problem with buildroot-2011.02 and .05 using the 
recent rc2 and rc3 of uclibc0.9....

Compiling with NPTL throws up some errors involving 'pthread.h not 
found/does not exist'. I've compiled a linuxthreads version OK.

A bit of digging has found that while linuxthreads puts pthread.h, 
semaphore.h and bits/ptheadtypes.h into the include directories, when 
configuring NPTL, they get forgotten. The uclibc libpthread/nptl has 
semaphore.h and pthread.h, but no pthreadtypes. I symlinked them into 
the the include directory in the output/toolchain/uclicbc... and the 
output/host/usr.....sysroot directories and this seems to have cludged 
it together (using pthreadtypes from linuxthreads).

So I think I'm on the right track. My question is where do I find the 
script/makefile(s) that unpacks the uclibc archive, parses the buildroot 
config and attempts to create the includes. I'd like to make sure the 
appropriate files are copied over in as amny cases as possible.

Any help gratefull received, once properly sorted I'll feed it back in - 
assuming I'm not doing something idiotic or a fix already exists.

-- 
Dominic Newton
