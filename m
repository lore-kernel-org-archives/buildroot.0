From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 23:22:30 +0200
Subject: [Buildroot] [PATCH] strongswan: needs atomics
In-Reply-To: <55259A87.7050504@zacarias.com.ar>
References: <1428507128-8490-1-git-send-email-gustavo@zacarias.com.ar>
 <20150408212227.615c05a2@free-electrons.com>
 <55258D3D.9070800@zacarias.com.ar>
 <20150408224028.1c419e88@free-electrons.com>
 <55259A87.7050504@zacarias.com.ar>
Message-ID: <20150408232230.362b95bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 08 Apr 2015 18:15:51 -0300, Gustavo Zacarias wrote:

> I'd venture to say the first (hardware has atomics) - that's what it
> means right now because:
> 
> 1) We don't handle libatomic, which is the fallback if HW doesn't do it.
> This would entail adding LIBS="-latomic" for autotools packages, and
> things are magically fixed.
> 
> 2) We don't copy libatomic (patches sent), so we can't do 1 just yet.
> 
> So basically we should rename the whole thing.
> BR2_ARCH_HAS_ATOMICS isn't precise, we need to formulate this probably
> as BR2_ARCH_NEEDS_LIBATOMIC since AFAIK the fallback is mandatory, while
> copying it for the toolchains.
> We could have BR2_TOOLCHAIN_HAS_ATOMICS to point towards
> toolchains/architectures that don't provide atomics and a fallback.
> It also means that packages that were previously excluded can, in fact,
> be used anyway as long as libatomic is thrown to the mix.

Thanks for the summary.

How do you handle Blackfin, which uses gcc 4.3, while I believe
libatomic is a new thing in gcc 4.8, no?

Are you sure all atomic intrinsics are tied to the existence of
libatomic? It's quite hard to find some good documentation on the web
about libatomic.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
