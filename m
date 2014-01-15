From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Jan 2014 23:22:38 +0100
Subject: [Buildroot] [PATCH v5] arch: add support for "jaguar" AMD CPU
	optimisations
In-Reply-To: <1389824230-3068-1-git-send-email-adrien.beraud@savoirfairelinux.com>
 ("Adrien =?utf-8?Q?B=C3=A9raud=22's?= message of "Wed, 15 Jan 2014 17:17:10
 -0500")
References: <1389824230-3068-1-git-send-email-adrien.beraud@savoirfairelinux.com>
Message-ID: <87mwiwsx5d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrien" == Adrien B?raud <adrien.beraud@savoirfairelinux.com> writes:

 > AMD Jaguar ( https://en.wikipedia.org/wiki/Jaguar_%28microarchitecture%29 ) is
 > suddenly a popular architecture since it is used in the PS4 and the XBox One.
 > Many embedded systems are also likely to use it in the next years.

 > This patch adds support for GCC architecture-specific optimisations and
 > tuning for these CPUs.
 > These optimizations are available with GCC 4.8+.

 > Signed-off-by: Adrien Beraud <adrien.beraud@savoirfairelinux.com>
 > ---
 >  arch/Config.in.x86                     | 10 ++++++++++
 >  package/gcc/Config.in.host             | 10 +++++-----
 >  toolchain/toolchain-external/Config.in |  3 +++
 >  3 files changed, 18 insertions(+), 5 deletions(-)

 > diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
 > index 15d5c16..bbedfb4 100644
 > --- a/arch/Config.in.x86
 > +++ b/arch/Config.in.x86
 > @@ -124,6 +124,13 @@ config BR2_x86_barcelona
 >  	select BR2_X86_CPU_HAS_SSE
 >  	select BR2_X86_CPU_HAS_SSE2
 >  	select BR2_X86_CPU_HAS_SSE3
 > +config BR2_x86_jaguar
 > +	bool "jaguar"
 > +	select BR2_X86_CPU_HAS_MMX
 > +	select BR2_X86_CPU_HAS_SSE
 > +	select BR2_X86_CPU_HAS_SSE2
 > +	select BR2_X86_CPU_HAS_SSE3
 > +	select BR2_X86_CPU_HAS_SSSE3

Committed, thanks. Notice that we have recently added _CPU_HAS_SSE4, and
I think Jaguar supports that.

If so, could you please send a followup patch to fix that?

-- 
Bye, Peter Korsgaard
