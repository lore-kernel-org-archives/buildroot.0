From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Apr 2009 09:47:34 +0200
Subject: [Buildroot] Buildroot comments and questions
In-Reply-To: <a4413b2d0904262349m133ac037t4c42095240c1256a@mail.gmail.com>
	(Hai Shalom's message of "Mon\, 27 Apr 2009 09\:49\:52 +0300")
References: <a4413b2d0904260736j3b85599u488c9f3d28777f36@mail.gmail.com>
	<873abvkwfx.fsf@macbook.be.48ers.dk>
	<a4413b2d0904262349m133ac037t4c42095240c1256a@mail.gmail.com>
Message-ID: <87ljpmh71l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hai" == Hai Shalom <hai.shalom@gmail.com> writes:

Please keep communication on the buildroot list, thanks.

 Hai> The reason I am using uClibc 0.9.29 is because I have an NPTL
 Hai> patch over it, and it is used in the system for a long time. The
 Hai> official 29 and 30 versions do not include this patch, and
 Hai> trying to compile new linuxthreads for arm results in a missing
 Hai> header file in sysdeps (there are header files for all platforms
 Hai> except for arm). Therefore, I had to stick to my old version.

Ok. linuxthreads-old (the default) afaik works on ARM.

 Hai> Regarding the gcc patch, you are probably right. If I'll copy
 Hai> the mentioned patch file to the 4.2.4 subdirectory, does the
 Hai> Makefile automatically take all patch files in it?

Yes, all *.patch

 Hai> Regarding the find, I know I am using an older distribution, but
 Hai> in any case,?I recommend using the other alternative instead of
 Hai> -delete anyways to support all versions (it doesn't damage newer
 Hai> versions).

Agreed.

 Hai> I also tried to build with gcc 4.3.2, and halted on the same
 Hai> problem exactly in crtstuff.c.  I found a patch to workaround
 Hai> this, but then I get the emptry sections warnings from the
 Hai> linker.

Strange. gcc 4.3.x works fine here on ARM. Maybe your problems are
caused by your uclibc changes?

 Hai> I've attached this patch for your reference, although I
 Hai> don't think it is right.  ? I also attached my .config file for
 Hai> your reference and hopefully you'll find something I didn't
 Hai> configure right... Please note that I had to hack the .config to
 Hai> force using 2.6.18 headers (I don't think there is any relation
 Hai> to this because with the mentioned patch, the toolchain
 Hai> completed to build).  ? Thanks a lot, Hai.

Why would you want to use so old kernel headers? Didn't the make
headers_install target only get added to the kernel in 2.6.19?

-- 
Bye, Peter Korsgaard
