From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:29:46 +0100
Subject: [Buildroot] [PATCH] armadeus_apf9328_defconfig: bump kernel to
	3.18.29
In-Reply-To: <20161221204611.5889-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 21 Dec 2016 21:46:11 +0100")
References: <20161221204611.5889-1-peter@korsgaard.com>
Message-ID: <87eg0yfi5x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Which includes the gcc5+ fix for ftrace:
 > commit aeea3592a13bf12861943e44fc48f1f270941f8d
 > Author: Behan Webster <behanw@converseincode.com>
 > Date:   Wed Sep 24 01:06:46 2014 +0100

 >     ARM: 8158/1: LLVMLinux: use static inline in ARM ftrace.h

 >     With compilers which follow the C99 standard (like modern versions of gcc and
 >     clang), "extern inline" does the wrong thing (emits code for an externally
 >     linkable version of the inline function). In this case using static inline
 >     and removing the NULL version of return_address in return_address.c does
 >     the right thing.

 >     Signed-off-by: Behan Webster <behanw@converseincode.com>
 >     Reviewed-by: Mark Charlebois <charlebm@gmail.com>
 >     Acked-by: Steven Rostedt <rostedt@goodmis.org>
 >     Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

 > Otherwise, the build dies with:

 > arch/arm/kernel/return_address.c:66:7: error: redefinition of ?return_address?
 >  void *return_address(unsigned int level)
 >        ^
 > In file included from include/linux/ftrace.h:20:0,
 >                  from arch/arm/kernel/return_address.c:12:
 > ./arch/arm/include/asm/ftrace.h:48:21: note: previous definition of ?return_address? was here
 >  extern inline void *return_address(unsigned int level)
 >                      ^

 > For more details, see:
 > https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/185616889

 > notice: Only build tested as I don't have the hw, which is also why the
 > kernel is only bumped to 3.18 to make it as safe as possible.

 > CC: Julien Boibessot <julien.boibessot@armadeus.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
