From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Apr 2018 09:53:39 +0200
Subject: [Buildroot] [PATCH 1/1] tcf-agent: bump to version 1.7.0
In-Reply-To: <CADYdroOdnrNUCvq+Yd95rkwO0BCioby19QGGb0cU++Ja8Nc3gA@mail.gmail.com>
References: <20180412151310.15252-1-eugene@largest.net>
 <20180412234935.3ae48694@windsurf>
 <ece5ee53-47f3-f446-f0b8-ce3b6cfc2975@largest.net>
 <CADYdroOdnrNUCvq+Yd95rkwO0BCioby19QGGb0cU++Ja8Nc3gA@mail.gmail.com>
Message-ID: <20180413095339.405a1a30@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Apr 2018 09:50:35 +0200, Norbert Lange wrote:

> @Thomas: Part of the discussion resides in
> https://bugs.eclipse.org/bugs/show_bug.cgi?id=529417,
> Eugene is the the maintainer of tcf-agent and I advised him to put his
> mail in DEVELOPERS,
> as otherwise I have to piggyback issues and fixes around projects.
> Also there are apparently multiple (closed source) projects using
> tcf-agent, so a my fixes for linux
> might break other stuff.

OK.

> I switched from CMake to regular Makefiles for the same reason, the
> later is better supported upstream,
> and support detecting headers/functions/libraries from the system.
> Getting CMake to parity would be alot
> work.

That is rather odd. A build system like CMake normally helps a lot
resolve cross-compilation issues.

> @Eugene: buildroot allows static linking, which can come handy for
> stuff like initial ramdisks which only need a
> small set of tools (eg. only busybox without any libraries)
> 
> I will try to respond to Thomas' requests for the patch this weekend,
> but can you look at the empty ranlib call?
> My solution would be to set the makerule to
> 
> $(BINDIR)/libtcf$(EXTLIB) : $(OFILES)
>     $(AR) $(AR_FLAGS) $(AR_OUT_F)$@ $^
>     $(RANLIB) $@
> 
> (and fixup the variable definitions in Makefile.inc)

What about sticking to the CMake build system, and fixing whatever
issues you have ? This seems like a much more sensible approach than
using hand-written Makefiles.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
