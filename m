From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:40:38 +0100
Subject: [Buildroot] [PATCH] package/mesa3d: fix circular dependency in
 Kconfig
In-Reply-To: <20200210205146.23753-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 10 Feb 2020 21:51:46 +0100")
References: <20200210205146.23753-1-yann.morin.1998@free.fr>
Message-ID: <87r1z0hhnd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When the r300 driver was introduced in c5ae77c97 (package/mesa3d: add
 > support for gallium r300 driver), a last-minute fix was introduced by
 > Yann, to properly propagate the dependency of a selected symbol.

 > However, this ended up causing a spurious circular dependency that does
 > not really exists, but that Kconfig is not smart enough to detect is in
 > fact OK.

 > Fixing this is pretty non-obvious, but we have an easy way out: the
 > dependency is about libdrm's radeon driver requirement for a toolchain
 > that has the sync4 family of primitives, which is always a given for an
 > x86 toolchain. As the radeon r300 driver is x86-only, this dependency is
 > forcefully fulfilled.

 > So, we drop the propagated dependency, and replace it by a fat comment.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Romain Naour <romain.naour@gmail.com>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Cc: James Hilliard <james.hilliard1@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
