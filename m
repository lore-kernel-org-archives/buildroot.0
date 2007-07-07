From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 7 Jul 2007 14:39:54 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <00c301c7c091$e5f925d0$dcc4af0a@atmel.com>
References: <20070707073437.22ECBA682B@busybox.net>
	<20070707093316.GK4096@aon.at>
	<00c301c7c091$e5f925d0$dcc4af0a@atmel.com>
Message-ID: <20070707123954.GT4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 07, 2007 at 01:55:24PM +0200, Ulf Samuelsson wrote:
>>> # Strip the host binaries
>>> ifeq ($(GCC_STRIP_HOST_BINARIES),true)
>>>- -strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/*
>>>+ if [ -e $(STAGING_DIR)/usr/bin/*-gccbug ] ; then \
>> 
>> testing for existance doesn't work on all solaris test(1).
>
>
>What will happen on a Solaris host then if this is found?
>Will [ -a <file> ] work?

KISS.
-f FILE
-x FILE

This place doesn't need anything but checking by one of the above.

>> What you really want is perhaps something like ifneq $((..$(wildcard..)),)
>> 
>
>I believe ifneq is read in stage 1 of the Makefile, so this wont work either, right?

Could be that it doesn't work, yes. Didn't try since i regard it as
completely unimportant there.

We don't bail out on failures from strip, and if you are not interrested
in errors, then redirect stderr to /dev/null instead of needlessly
stat()ing around, IMO.
