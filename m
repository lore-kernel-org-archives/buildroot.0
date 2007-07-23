From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jul 2007 11:52:43 +0200
Subject: [Buildroot] _VER vs. _VERSION breakage
In-Reply-To: <1184615647.18357.27.camel@elrond.sweden.atmel.com>
References: <20070715104024.GB4096@aon.at>
	<1184615647.18357.27.camel@elrond.sweden.atmel.com>
Message-ID: <20070723095243.GC6597@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 16, 2007 at 09:54:06PM +0200, Ulf Samuelsson wrote:
>s?n 2007-07-15 klockan 12:40 +0200 skrev Bernhard Fischer:
>> Ulf,
>> 
>> Your change to use _VERSION broke at least acpid. Please double-check
>> that all packages that you touched in this patch still build fine and
>> repair.
>
>Here is the result of trying to build most available packages
>in buildroot for ARM. (I build for ARM generic (not using WCHAR)).

I will revert that _VERSION vs. _VER patch since it breaks a couple of
packages.
>
>A lot of the packages does not build for ARM,

Could be. For changes like _VER vs. _VERSION, a quick check with an x86
build before and after such a change would have been the proper thing to
do, imho.

>but if you can download the package, decompress it
>in build_<arch> and then configure or patch it, 
>then the VERSION patch is OK for this package.

>At least some of the packages seems to require the uClibc is 
>built with WCHAR. We should probably identify these packages
>and hide them during configuration if WCHAR is not enabled.

Yes, this is a completely different issue, though.

>
>Some packages like ACPID does not build for ARM
>but I think I got that right anyway, even if I did not try that
>specific package.
>Maybe someone building x86 can report the few packages
>I have problems with on ARM?

No need, i'll revert said patch and let those who want such a patch to
go in check if they break something.

Breaking the build for cosmetic reasons is not a sensible thing to do.
