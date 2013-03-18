From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Mar 2013 16:07:32 +0100
Subject: [Buildroot] Q. vmlinuz on ARM?
In-Reply-To: <CAHUKsLL9aV9NH-NmtgRmDONGjnAkaeJjJepM65AMq3sU+LBbkw@mail.gmail.com>
References: <CAHUKsLL9aV9NH-NmtgRmDONGjnAkaeJjJepM65AMq3sU+LBbkw@mail.gmail.com>
Message-ID: <20130318160732.2a6117d7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Wilkinson,

On Sun, 17 Mar 2013 21:45:34 -0400, Chris Wilkinson wrote:

> Is vmlinuz an output option for ARM? It appears to be an option only for
> MIPS.
> 
> My current iop32x stock kernel is vmlinuz, see below.

Most likely, it's just zImage that has been renamed. On x86, the kernel
generates 'bzImage', and distributions typically rename it to
vmlinuz-<version> when the kernel image is installed in /boot.

If you want a vmlinuz on ARM:

	cp /path/to/linux/build/dir/arch/arm/boot/zImage /boot/vmlinuz-<version>

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
