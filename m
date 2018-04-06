From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 13:37:44 +0200
Subject: [Buildroot] [PATCH 1/2] llvm: add dependency on
 !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
In-Reply-To: <a8703b32-9442-95d3-4ea6-b008cd791cf8@smile.fr>
References: <20180406090013.20187-1-thomas.petazzoni@bootlin.com>
 <a8703b32-9442-95d3-4ea6-b008cd791cf8@smile.fr>
Message-ID: <20180406133744.43c8f225@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 6 Apr 2018 11:36:26 +0200, Valentin Korenblit wrote:

> The three autotests crashed because of std::shared_future,
> 
> I've found the following in: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=820535
> 
> "This looks like the kind of failure you get when your host toolchain
> doesn't support C++11 properly (specifically lock-free atomics in this
> case).  When I've seen it before GCC was defaulting to a CPU that's
> too old to do atomics properly, and that configuration is very
> unlikely to be supported by LLVM ever (any more)."
> 
> I was about to send a patch to blacklist ARMv4 and ARMv5 but this should
> be a more appropriate solution (I was not aware of BUG_64735).

Note: I didn't test building LLVM for ARMv4/ARMv5, with a gcc 7.x
compiler. But the build error itself clearly points to this gcc
limitation, which has been solved in gcc 7.x.

> I'll try to build with the defconfigs from the autobuilder applying the
> patch and adding a dependency on !BR2_STATIC_LIBS.

So far, there hasn't been any failure to build LLVM in static only
configurations, so let's see if any shows up.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
