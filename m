From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jul 2011 10:14:57 +0200
Subject: [Buildroot] [PATCH] Config: unbreak check-source caused by
 empty defconfigs
In-Reply-To: <1310593649-26237-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1310593649-26237-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <20110714101457.6521ebbd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 13 Jul 2011 23:47:29 +0200,
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> a ?crit :

> Running check-source uses an allyesconfig-like configuration.
> But in this case, the defconfig files for BareBox, U-Boot and
> the Linux kernel are not set, thus braking the check.
> 
> This patch fixes it by setting a dummy value '(none)' as the
> default value for the three affected defconfig entries.

No. The check at the end of the Linux, Barebox and U-Boot are here on
purpose. This commit makes those checks useless.

There is already a check :

ifeq ($(filter source,$(MAKECMDGOALS)),)

which disable the board name check when "make source" or "make
source-check" is used.

Or maybe I misunderstood the problem ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
