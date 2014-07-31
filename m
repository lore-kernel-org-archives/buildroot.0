From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 20:05:37 +0200
Subject: [Buildroot] [PATCH v2 1/9] toolchain: Add config option for
 atomic intrinsics
In-Reply-To: <20140731172520.GD3960@free.fr>
References: <20140730084548.05bd6dec@free-electrons.com>
 <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
 <20140731172520.GD3960@free.fr>
Message-ID: <20140731200537.0b27eea7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 31 Jul 2014 19:25:20 +0200, Yann E. MORIN wrote:

> On 2014-07-31 17:24 +0400, Anton Kolesov spake thusly:
> > GCC has several builtin functions that implement atomic operations. Those
> > functions are architecture specific and may not be implemented by the
> > specific toolchain. In case of GCC for ARC those functions rely on
> > LLOCK/SCOND instructions which are optional in ARC CPU's. If ARC CPU doesn't
> > support those instructions but software tries to use them, then application
> > will be aborted with Illegal instruction exception. To avoid confusion user
> > should first specify that their CPU supports atomic extension, which will
> > allow selection of packages that use builtin atomic functions.
> 
> I think what Thomas and I discussed, was to have a patch series that
> does the following changes:
> 
>    1- introduce BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS;
>    2- have all current architectures, that have atomics, select that new
>       symbol (note: i386 does not, i486 and above have, for example);
>    3- convert packages (one patch par package) to depend on it;
>    4- introduce BR2_ARC_ATOMIC_EXT that selects it, too.
> 
> This is more logical: you first add a new option, and then you gradually
> start using it, until finally you airrive to what you eventually wanted.

Well, that's pretty much what Anton did actually: his patch 1 covers
your items (1), (2) and (4), and his other patches cover your item (3).
And there's actually no problem in having (4) being done before (3).

So far the only difference between what you expose and what he has done
is the fact that his patch series have
BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS selected even for i386. But the
current Buildroot already assumes that i386 has atomic intrinsics.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
