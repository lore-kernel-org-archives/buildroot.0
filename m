From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 7 Aug 2013 11:06:26 -0700
Subject: [Buildroot] Understanding kernel version manipulation
Message-ID: <CALo-6+hkp=twEgHsysP0uCfp97oNg3UaPOuujHyOhyS_xA-E-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gentlemen:

I'm trying to understand kernel version manipulation that ends up
creating /lib/modules/linux* this morning in order to get the
/lib/modules directory to work correctly between my existing linux
kernel project (2.6.37+) and the newest buildroot.

This is part of the AM3517/Qt5 project I am working on where the TI
support department has said that they are staying on the 2.6.37+
kernel indefinitely for the LogicPD AM3517EVM.

I can create a tar.xz from the existing kernel source which has the
tricky script in scripts/setlocalversion which adds a "+" sign, so I
get linux-2.6.37+ from uname and /lib/modules/2.6.37+.

But, when I copy that .tar.xz to the dl/ directory as if it were
downloaded, I end up with /lib/modules/2.6.37 instead of
/lib/modules/2.6.37+ and modprobe sticks its tongue out when the
rootfs boots.

Could someone consider giving me a few pointers on using a custom
tarball linux kernel and understanding the extraversion addition logic
for the "+" in buildroot so I can make a bit of progress, please.

Charles

-- 
Charles Krinke
