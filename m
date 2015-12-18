From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 22:45:15 +0100
Subject: [Buildroot] [PATCH] python-pyxml: remove obsolete package
In-Reply-To: <20151218214021.GG27578@free.fr>
References: <1450251868-7288-1-git-send-email-yegorslists@googlemail.com>
 <20151218222828.26ba769f@free-electrons.com>
 <20151218214021.GG27578@free.fr>
Message-ID: <20151218224515.65f2b5cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Dec 2015 22:40:21 +0100, Yann E. MORIN wrote:

> I usually agree that we first mark package as being deprecated before we
> get rid of them.
> 
> However, python-pyxml is so old, its features have long been incoporated
> into python stdlib. Probably not many people are using it, if any at
> all.
> 
> So, I'd vote in favour of just removing it altogether right now.

Fine with me. Yegor, can you respin your patch then with
Config.in.legacy handling?

It would have been good to hear from Clayton to know why he added this
package in May 2015. I think it might have been at some point a
dependency of some SELinux stuff, but even the pending SELinux patches
don't make any reference to it. The only reference I could find was in
the changelog of one of the patches, which says:

"""
  - Remove dependancy on host-python-pyxml (Ryan B.)
"""

But the current python-pyxml package only implements the target
variant. So, /me confused.

Clayton, Ryan?



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
