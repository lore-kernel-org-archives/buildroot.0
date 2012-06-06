From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jun 2012 22:14:35 +0200
Subject: [Buildroot] [PATCH 1 of 6] pkg-download.mk: allow using
 localfiles outside of package infrastructure
In-Reply-To: <5103c7c0451ff036f611.1338924132@beantl019720>
References: <patchbomb.1338924131@beantl019720>
 <5103c7c0451ff036f611.1338924132@beantl019720>
Message-ID: <20120606221435.3d843ddd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 05 Jun 2012 21:22:12 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> The localfiles download method uses $($(PKG)_SITE))) and
> $($(PKG)_SOURCE) instead of $(1) and $(2). This means that it can only
> be used for package downloads (through gentargets, autotargets, ...)
> and not for other downloads like external toolchains.
> 
> This patch changes localfiles to allow this, just as the wget and scp
> download methods already did.
> For the version control download methods, nothing changes.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

I generally agree with this, but for consistency sake, it should
probably done similarly for all other download methods, no? Of course,
it can be done later as separate patches, the code is already
inconsistent, so this patch does not make it worse from that
perspective.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
