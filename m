From: Richard Hardy <richardh@oakleafconsultancy.com>
Date: Wed, 6 Aug 2008 14:16:05 +0100
Subject: [Buildroot] C double type problem - at91sam9263
Message-ID: <223E6519BDCAC74695BEE9D163F8E6592306FB@oakleaf10.oakleafconsultancy.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> -----Original Message-----
> From: Christopher Taylor [mailto:chtaylo3 at gmail.com]
> Sent: 05 August 2008 18:38
> To: Richard Hardy
> Cc: Ulf Samuelsson; buildroot at uclibc.org
> Subject: Re: [Buildroot] C double type problem - at91sam9263
> 
> Could this be related to how you are compiling the code, uclibc, and
> the OS as far as endian-ness ?  big vs middle vs little endian?
> 
> just a thought.  I've been burned by the middle-endianness on the
> arm9261.  Last I looked there were some defects in how buildroot took
> your parameters and implemented them in uClibc and the kernel (I seem
> to remeber there was a bug in uClibc that buildroot incorrectly worked
> around, but I wouldn't swear to it)
> 
> -Chris
> 

Thanks very much for everyone who has given me some hints so far. I
think that, as suggested, the fprintf problem is an output problem
(rather than storage). I am sort-of ignoring that for the time being.

However, the reason that I was trying to print out double values in the
first place was that I am getting lots of segmentation faults when I do
calculations involving int64_t and double values. 

I am using arm-linux-gcc v4.2.1., compiled on an intel Linux box to run
on an atmel at91sam9263. 

For example, one problem I found was that I was getting stack
corruptions when using "-Os" as a compiler option in (some) functions
that were being passed int64_t and double values. I fixed that by using
"-O0" instead. 

However, I am getting lots of other really weird segmentation faults
when I run the compiled program, which I am having to work around one by
one (I am trying to cross-compile and use ffmpeg which does lots of
complicated internal calculations for playing mpeg files).

Is it possible that gcc 4.2.1 is a very buggy compiler version? Can
anyone suggest whether I might be better to try another version (ideally
one that Buildroot supports), and if so, which one?

Thanks again,
Richard.
