From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Sun, 16 Nov 2008 10:14:04 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <873ahsfzzq.fsf@macbook.be.48ers.dk>
References: <20081111183231.E74AC3C989@busybox.net>
	<873ahsfzzq.fsf@macbook.be.48ers.dk>
Message-ID: <e4c675870811160114u5464d786q599e15b707f93cee@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/11/15 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "tpetazzoni" == tpetazzoni  <tpetazzoni@uclibc.org> writes:
>
>  tpetazzoni> Author: tpetazzoni
>  tpetazzoni> Date: 2008-11-11 10:32:31 -0800 (Tue, 11 Nov 2008)
>  tpetazzoni> New Revision: 24000
>
>  tpetazzoni> Log:
>  tpetazzoni> Fix external toolchain build
>
>  tpetazzoni> This new version fixes a problem encountered by hartleys
>  tpetazzoni> <hartleys@visionengravers.com> when building the kernel. The problem
>  tpetazzoni> was that the -Wl,--rpath-link options were added to LDFLAGS, while
>  tpetazzoni> there are options for the C compiler, not the ld linker. Moving them
>  tpetazzoni> to CFLAGS seems to fix the issue.
>
> But it makes gcc spit out a bunch of warnings, E.G. for busybox:
>
>  CC      util-linux/umount.o
> i386-linux-uclibc-gcc: --rpath-link: linker input file unused because linking not done
> i386-linux-uclibc-gcc: /tmp/br/build_i386/staging_dir/lib: linker input file unused because linking not done
> i386-linux-uclibc-gcc: --rpath-link: linker input file unused because linking not done
> i386-linux-uclibc-gcc: /tmp/br/build_i386/staging_dir/usr/lib: linker input file unused because linking not done
>
> There must be a better way ..
>

 I see there are some packages which accept CCLD variable which can be set to

 CCLD = $(CC) $(CCLDFLAGS)

 I am not sure it could be a general solution if this variable is not
a standard one.

 Ciao,
-- 
/roberto
