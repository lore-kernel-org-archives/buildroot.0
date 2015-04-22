From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 09:14:26 +0200
Subject: [Buildroot] Reminder about your pending Buildroot patches
In-Reply-To: <CAKbGBLgnq72kw570gNB=EHFnw9UOJY3_7H0nFpebjJ9kgGx+qQ@mail.gmail.com>
References: <20150421125634.385A788D@mail.free-electrons.com>
 <CAKbGBLgnq72kw570gNB=EHFnw9UOJY3_7H0nFpebjJ9kgGx+qQ@mail.gmail.com>
Message-ID: <20150422091426.0f431551@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steven,

On Tue, 21 Apr 2015 16:58:02 -0700, Steven Noonan wrote:

> > Here is the list of patches you have submitted that are still pending:
> >
> >  - [1/7] package/perf: if slang is enabled, depend on it
> >    http://patchwork.ozlabs.org/patch/451638/
> >
> >  - [2/7] package/perf: if numactl (libnuma) is enabled, depend on it
> >    http://patchwork.ozlabs.org/patch/451636/
> >
> >  - [3/7] package/perf: if libunwind is enabled, depend on it
> >    http://patchwork.ozlabs.org/patch/451637/
> >
> >  - [5/7] package/perf: patch installation paths
> >    http://patchwork.ozlabs.org/patch/451641/
> >
> >  - [6/7] package/perf: add patch to prevent crash on empty history buffer
> >    http://patchwork.ozlabs.org/patch/451634/
> >
> >  - [7/7] package/perf: use correct definition of ARCH on x86_64
> >    http://patchwork.ozlabs.org/patch/451633/
> 
> All 7 are still relevant.

Ok. I'll have a look at those perf patches.

> >  - implement granular choice for stack protector
> >    http://patchwork.ozlabs.org/patch/451643/
> 
> Still relevant.

Do all the gcc versions support those different levels of stack
protection?

> >  - package/glibc: enable lock elision on x86_64 hosts
> >    http://patchwork.ozlabs.org/patch/451651/
> 
> Still relevant.

Is lock elision a feature always available on x86-64 ? Or only on
certain cores ? I believe it required a certain generation of hardware.
But maybe the glibc gracefully falls back to a non-elided lock
implementation when the hardware does not have the required features.

All sort of questions that should have been addressed in the commit
log... which is currently empty :-)

> >  - package: add shadow 4.2.1
> >    http://patchwork.ozlabs.org/patch/451723/
> 
> There was some followup discussion which I haven't addressed. But it
> is still relevant.

Yes, but can you address the comments?

> 
> >  - package: add mosh 1.2.4
> >    http://patchwork.ozlabs.org/patch/451726/
> 
> Still relevant.

There has been some comments. Can you address them and resend? The
comments have been made a month ago. While I agree we (Buildroot
maintainers / core developers) are not best placed to criticize about
delays, it would be good to respin patches not too long after the
comments, so that they are kept "alive and moving".

> >  - [v2] package/perf: build outside kernel tree
> >    http://patchwork.ozlabs.org/patch/451947/
> 
> Relevant but people didn't want this one -- I just didn't see an
> alternative if we were going to apply any patches to perf.

Yeah, this isn't a simple problem :-/

> >  - package/libpthsem: correctly handle --{en, dis}able-debug arguments on configure
> >    http://patchwork.ozlabs.org/patch/452271/
> 
> Still relevant.

Not really: we are going to get rid of passing --enable-debug /
--disable-debug. A patch series doing this has already been posted. I
believe it will make this patch irrelevant. Can you confirm?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
