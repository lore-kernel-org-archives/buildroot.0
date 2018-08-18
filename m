From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 21:29:53 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] Add BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
In-Reply-To: <20180818174900.0ee2b668@windsurf>
References: <20180817221014.32681-1-fontaine.fabrice@gmail.com>
 <20180818174900.0ee2b668@windsurf>
Message-ID: <20180818212953.26bf3a2f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Aug 2018 17:49:00 +0200, Thomas Petazzoni wrote:

> However, we still have an issue: when static linking, libboost_atomic.a
> is produced even on platforms that do provide the "always lock-free
> atomic ints".
> 
> Examples:
> 
>  - Cortex-M4
> 
>    http://autobuild.buildroot.net/results/212/212651b677cfb0763b34596d4f999103039d89bc/build-end.log
> 
>    $ ./host/bin/arm-linux-gcc -dM -E - < /dev/null | grep
>    ATOMIC_BOOL_LOCK_FREE #define __GCC_ATOMIC_BOOL_LOCK_FREE 2
> 
>  - MIPS, statically linked
> 
>    http://autobuild.buildroot.net/results/6d3/6d3db8a67a1de75920624b3e13e8110e783ddbd9/build-end.log
> 
>    $ ./host/bin/mipsel-linux-gcc -dM -E - < /dev/null | grep
>    ATOMIC_BOOL_LOCK_FREE #define __GCC_ATOMIC_BOOL_LOCK_FREE 2

And we have another situation here:

  http://autobuild.buildroot.net/results/9c3/9c373d0b5a1a59e2271d71c480d55a90a67b84cb/build-end.log

This one is on PowerPC, and with dynamic linking. It is not going to be
solved by the BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS stuff.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
