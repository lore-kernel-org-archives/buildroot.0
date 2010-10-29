From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Oct 2010 21:06:14 +0200
Subject: [Buildroot] CFLAGS_FOR_BUILD compiler flags
In-Reply-To: <AANLkTim12PLkFLjAZw08vJTM5VjUWCDYPSHXM9u8cOWY@mail.gmail.com>
	(Will Newton's message of "Fri, 29 Oct 2010 14:18:27 +0100")
References: <AANLkTim12PLkFLjAZw08vJTM5VjUWCDYPSHXM9u8cOWY@mail.gmail.com>
Message-ID: <877hh0ddjt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> Hi all,
 Will> It looks like something changed with the flags passed when building
 Will> toolchains. In older buildroots it seems we passed "-g -O2"
 Will> explicitly:

 Will> $ grep CFLAGS_FOR_BUILD toolchain/gcc/gcc-uclibc-3.x.mk
 Will> CFLAGS_FOR_BUILD="-g -O2 $(HOST_CFLAGS)" \
 Will> CFLAGS_FOR_BUILD="-g -O2 $(HOST_CFLAGS)" \
 Will> CFLAGS_FOR_BUILD="-g -O2 $(HOST_CFLAGS)" \

 Will> Now we use TARGET_CONFIGURE_OPTS, which sets CFLAGS_FOR_BUILD for us:

 Will> $ grep CFLAGS_FOR_BUILD package/Makefile.in
 Will> CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 Will> FCFLAGS_FOR_BUILD="$(HOST_FCFLAGS)" \

 Will> But without the -g -O2 being added. This results in the toolchain
 Will> being built without optimisations, which makes it a bit slower than it
 Will> otherwise would be (although I expect it makes building the toolchain
 Will> faster!).

 Will> CFLAGS_FOR_BUILD is currently defaulted in the top-level Makefile but
 Will> then not used. Perhaps a patch like the below would be the right thing
 Will> to do? Comments?

You're completely right. I prefer to get rid of CFLAGS_FOR_BUILD though
as it's only used by sstrip, so I've committed a slightly different patch.

-- 
Bye, Peter Korsgaard
