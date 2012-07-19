From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jul 2012 23:10:03 +0200
Subject: [Buildroot] [PATCH] uClibc: make mDNS addresses resolvable via
 avahi daemon
In-Reply-To: <201203300601.q2U61G4l019973@gatekeeper.vosshq.de>
References: <201203300601.q2U61G4l019973@gatekeeper.vosshq.de>
Message-ID: <20120719231003.760e96f2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nikolaus,

Le Fri, 30 Mar 2012 07:47:42 +0200,
Nikolaus Voss <n.voss@weinmann.de> a ?crit :

> If a uClibc toolchain is build and buildroot has avahi enabled,
> currently avahi must be contacted directly to resolve mdns addresses.
> 
> This patch enables the uClibc resolver to contact avahi, so
> mDNS addresses become resolvable by using libc calls. To enable
> this feature in uClibC, UCLIBC_HAS_AVAHI_RES must be enabled in
> uClibc configuration
> ---
>  toolchain/uClibc/uClibc-0.9.33-avahi.patch |  418 ++++++++++++++++++++++++++++
>  1 files changed, 418 insertions(+), 0 deletions(-)
>  create mode 100644 toolchain/uClibc/uClibc-0.9.33-avahi.patch

Thanks for this work. However, in Buildroot, we do not accept to carry
patches adding features to the different packages we have. We accept to
carry bug fixes or build fixes, but not entirely new features. For
these, we encourage people to get the features merged in the
respective upstream projects instead.

This allows us to avoid turning Buildroot into a big pile of
unmaintainable patches, which would prevent us from easily bumping
component versions. For example, once uClibc 0.9.34 is out, who will be
responsible for forward-porting such a large patch?

So please submit this to the uClibc community instead. While it gets
accepted, you can always add the patch to your local branch of
Buildroot.

Thanks again for contributing!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
