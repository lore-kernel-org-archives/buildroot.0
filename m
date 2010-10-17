From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 Oct 2010 10:00:45 +0000 (UTC)
Subject: [Buildroot] [Bug 2707] Can't compile linux kernel using buildroot +
	crosstool-ng
In-Reply-To: <bug-2707-163@https.bugs.busybox.net/>
References: <bug-2707-163@https.bugs.busybox.net/>
Message-ID: <20101017100045.166A48D2FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2707

Yann E. MORIN <yann.morin.1998@anciens.enib.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at anciens.eni
                   |                            |b.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@anciens.enib.fr>  ---
Philippe, All,

I believe the correct way would be to declare KERNEL_ARCH somewhere else.

First, the crosstool-NG backend does not need stuff from kernel-headers.mk, so
there is no reason to include it.

Second, KERNEL_ARCH is not specific to the kernel-headers used to build the
toolchain, even the internal toolchain backend. Indeed, it is used by a few
other components: the kernel itself, but also U-Boot, barebox, linux-fusion,
ltrace, lm-sensors, pciutils, and bizarely enough, busybox.

That's why I believe KERNEL_ARCH should be moved out of kernel-headers, and to
a common place.

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
