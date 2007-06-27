From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 27 Jun 2007 18:20:03 +0200
Subject: [Buildroot] Problem building latest arm
In-Reply-To: <6B9D9C36F5A26347A593D6945C470AE90F4031@delta-two.prga.net>
References: <6B9D9C36F5A26347A593D6945C470AE90F3FF8@delta-two.prga.net>
	<20070626062135.GA4096@aon.at>
	<6B9D9C36F5A26347A593D6945C470AE90F4031@delta-two.prga.net>
Message-ID: <20070627162003.GA8454@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 27, 2007 at 07:45:02AM -0500, michael.miller at prga.com wrote:
>>-----Original Message-----
>>From: Bernhard Fischer [mailto:rep.dot.nop at gmail.com] 
>>Sent: Tuesday, June 26, 2007 1:22 AM
>>To: Michael D. Miller
>>Cc: buildroot at uclibc.org
>>Subject: Re: [Buildroot] Problem building latest arm
>>
>>On Mon, Jun 25, 2007 at 10:04:44PM -0500, michael.miller at prga.com
>wrote:
>>>I'm trying to build for an Xscale (ARM), EABI, NPTL with binutils 
>>>2.17.50.0.16, software floating point, and target options bash, bzip2 
>>>and diffutils.  All other options are default (gcc 4.2.0).  I'm using 
>>>the latest snapshot for uclibc, and have tried buildroot snapshots
>from 
>>>6/20, 6/21 and 6/23.
>>>
>>>If I use 6/20, 6/21 or 6/23 buildroot snapshots then the build fails
>in 
>>>pthreads because sysdep-cancel.h is not found.  Looking in the 
>>>linuxthreads/sysdeps/unix/sysv/linux directory, I see subdirectories 
>>>for i386, mips, etc. but not for arm.
>>>
>>>Searching recent mailing list archives, Bernhard says things that make
>
>>>me think this configuration should work.  He hints that helptext will
>>
>>I was talking about eabi. Threading is a different issue (but even that
>one has a nice, >IMHO descriptive help-text).
>
>I tried just building for "old" Linux threads instead of POSIX threads.
>In that case I got an error because build_arm_nofpu/staging_dir/include

this area changed recently. You may need to erase build_* toolchain_*

>didn't exist.  I manually created the directory and restarted the build.
>Things continued without further incident and completed with a tool
>chain.  A quick test seems to indicate the generated cross compiler
>works, checked with a simple "Hello world" compiled after exporting the
>staging_dir/usr/bin.
>
>So, NPTL seems broken for ARM.  I've tried using an old ecos version of

you're better off to ask the uclibc list about the state of NTPL
support.
>sysdep-cancel.h and things reach the point that during the gcc-final
>stage libgomp blows up because the pthread library can't be found.  This
>is a configure error saying that pthreads are required for libgomp.  I'd
>say I don't even want libgomp.  Is there an easy way to prevent this
>from even being attempted?  I'm thinking of some additional build flag I
>can pass in to buildroot.

See menuconfig. ()  Additional gcc options
