From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Jun 2017 09:08:42 +0200
Subject: [Buildroot] [PATCH] gcc: add option to build and install gcc's
	libssp
In-Reply-To: <5c2a90b2-8989-fb5d-aed4-f06d3fd3ef43@mind.be>
References: <AM3PR05MB433082E20B48215DFA88130C9CD0@AM3PR05MB433.eurprd05.prod.outlook.com>
 <5c2a90b2-8989-fb5d-aed4-f06d3fd3ef43@mind.be>
Message-ID: <20170613090842.6b0b724e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Jun 2017 00:08:35 +0200, Arnout Vandecappelle wrote:

> On 12-06-17 10:23, Guy Benyei wrote:
> > When stack smashing protection is not provided by the C library, libssp
> > provides the functionality needed to support the -fstack-protector flag.  
> 
>  I have a few details that can be improved below. However, I still wonder
> whether this feature is useful at all.
> 
>  The new symbol will only appear in two cases:
> 
> - with uClibc, if BR2_TOOLCHAIN_BUILDROOT_USE_SSP is not selected;
> - with musl, for i386 and powerpc (because it is broken on musl).
> 
>  In the uClibc case, I really see no reason to prefer the gcc version instead of
> the uClibc version. So that basically leaves just the musl case. Is that the
> situation you are trying to fix? If that is it, I think it's better not to have
> a config options at all, but just enable the gcc thing if musl && (i386 || powerpc).
> 
>  Or is there another reason why you need this?

Yes, I'm also wondering about the use case here. Is there any benefit
in using the compiler-provided libssp, instead of the libc provided
implementation? Or, opposite question: is there any benefit in using
the libc provided implementation (as we do today) instead of the
compiler-provided one?

Should we provide a choice for the user to select between the two? I
must say I'm not really thrilled by this idea because it's a very
arcane/specific configuration item, which may be difficult for
regular users to understand.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
