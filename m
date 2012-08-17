From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Aug 2012 15:32:18 +0200
Subject: [Buildroot] [PATCH 11/36] package/qemu: new package
In-Reply-To: <20120817132606.1212d7f8@skate>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <201208141903.45500.yann.morin.1998@free.fr> <20120817132606.1212d7f8@skate>
Message-ID: <201208171532.18946.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Friday 17 August 2012 13:26:06 Thomas Petazzoni wrote:
> Le Tue, 14 Aug 2012 19:03:45 +0200,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
> 
> > > Just curious, what's the use case for Qemu on the target? I would have
> > > seen Qemu as something useful on the host, but on the target?
> > 
> > I want to build a libvirt-based system to host VMs, and I do not want
> > to use a complete distro for that : I do not care about the handy-dandy
> > init stuff, I don't care about networking auto-managing stuff, no fscking
> > desktop stuff... I just want a basic system that just runs a libvirt daemon,
> > and manages the VMs.
> > 
> > I want to build a completly-static QEMU, and that's not possible on a
> > desktop/server distro that uses glibc, because static linking still pulls
> > the NSS libs. So, rather than creating a new 'framework', I just decided
> > to reuse something. ;-)
> > 
> > I want to play! ;-)
> 
> Ok, interesting. The only thing I'm a bit worried about is that this
> brings Buildroot outside of its "environment to cross-compile Linux
> systems for embedded platforms". Although it initially probably fits
> the "minimal Linux system for VM hosting" use case, I'm worried that
> down the road the needs may diverge (for example people using Buildroot
> for VM hosting environments will want package management, etc.). But
> maybe I simply shouldn't anticipate too much on this and just see how
> things move.
> 
> However, on this patch set, I'd like to see at least a Ack from Peter
> on the general idea of merging Qemu for the target and all the required
> dependencies. If Peter is fine with the general idea, we can together
> review the implementation details, but the general idea needs to be
> Acked, me thinks.
> 
> Of course, other people in the community are invited to raise their
> voice here as well.

Of course, it diverges from the original goal.

But using buildroot for this stuff is really dead-easy (besides all the
time it takes to test, and dependencies, re-test and so-on... ;-) ).

I can understand that we may not want qemu upstream, but as I have this
stuff here, better post them at least for review, and if people find it
interesting, for upstreaming.

And yes, I too want an Ack from Peter before this is pulled.

Which should *not* be done now, I have some changes down the road (fixes
from the reviews, plus local sound support (not spice)).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
