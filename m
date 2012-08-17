From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 13:26:06 +0200
Subject: [Buildroot] [PATCH 11/36] package/qemu: new package
In-Reply-To: <201208141903.45500.yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-11-git-send-email-yann.morin.1998@free.fr>
 <20120814153403.1673236e@skate>
 <201208141903.45500.yann.morin.1998@free.fr>
Message-ID: <20120817132606.1212d7f8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 14 Aug 2012 19:03:45 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> > Just curious, what's the use case for Qemu on the target? I would have
> > seen Qemu as something useful on the host, but on the target?
> 
> I want to build a libvirt-based system to host VMs, and I do not want
> to use a complete distro for that : I do not care about the handy-dandy
> init stuff, I don't care about networking auto-managing stuff, no fscking
> desktop stuff... I just want a basic system that just runs a libvirt daemon,
> and manages the VMs.
> 
> I want to build a completly-static QEMU, and that's not possible on a
> desktop/server distro that uses glibc, because static linking still pulls
> the NSS libs. So, rather than creating a new 'framework', I just decided
> to reuse something. ;-)
> 
> I want to play! ;-)

Ok, interesting. The only thing I'm a bit worried about is that this
brings Buildroot outside of its "environment to cross-compile Linux
systems for embedded platforms". Although it initially probably fits
the "minimal Linux system for VM hosting" use case, I'm worried that
down the road the needs may diverge (for example people using Buildroot
for VM hosting environments will want package management, etc.). But
maybe I simply shouldn't anticipate too much on this and just see how
things move.

However, on this patch set, I'd like to see at least a Ack from Peter
on the general idea of merging Qemu for the target and all the required
dependencies. If Peter is fine with the general idea, we can together
review the implementation details, but the general idea needs to be
Acked, me thinks.

Of course, other people in the community are invited to raise their
voice here as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
