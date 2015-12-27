From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 12:22:28 +0100
Subject: [Buildroot] [PATCH] package/gettext: host variant needs
 host-libxml2
In-Reply-To: <20151227105437.GC3483@free.fr>
References: <1451165734-15534-1-git-send-email-yann.morin.1998@free.fr>
 <20151227114427.554e436b@free-electrons.com>
 <20151227105437.GC3483@free.fr>
Message-ID: <20151227122228.4aa11938@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, 27 Dec 2015 11:54:37 +0100, Yann E. MORIN wrote:

> Well, we also have to consider why we have to build host-gettext: it is
> a dependency of quite a few packages. I did not try to time-build all of
> them, but we have to really compare the extra time to the time it takes
> to build the real packages that need host-gettext. Surely, we're already
> adding 2m21s to the build time of those packages; adding 40s more is not
> transparent, but still better than the situation we currently have with
> library mismatch.
> 
> Also, as Vicente replied, we already need to build host-libxml2 in some
> cases, so we may end up building it twice if we were to use the bundled
> one.

There are not so many cases where we build host-libxml2 in fact. There
are some, but not that many.

> A solution would have been to use host-libxml2 if something else depends
> on it, and fallback to the bundled one otherwsie, but we have no way to
> know if a host-libxml2 is to be built or not (no Kconfig variable for it).

Right.

> I would prefer to spend more build time for a reproducible build, at
> least.

Well, with --with-included-libxml, the build is reproducible, since the
internal libxml library is always used. But I agree that our policy is
generally to use the non-bundled versions of the different libraries.

It's just super annoying to have yet another dependency, for this silly
--color option of gettext that nobody cares about...

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
