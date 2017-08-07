From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Mon, 7 Aug 2017 09:33:31 -0500
Subject: [Buildroot] [PATCHv2] fs/squashfs: honour the number of
	parallel jobs
In-Reply-To: <20170806154102.24807-1-yann.morin.1998@free.fr>
References: <20170806154102.24807-1-yann.morin.1998@free.fr>
Message-ID: <CANn-YGRT2J1GuHu0efq6OhGCoJ9v0PyzmrcSRTfXkRoKyQkD-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Aug 6, 2017 at 10:41 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> By default, mksquashfs uses all the CPUs available, like us with
> BR2_JLEVEL=0.

This ends up using the number of CPUs available plus 1. I tested this on my
machine and it worked. I do still see the extended attributes issue
that I posted
in https://bugs.busybox.net/show_bug.cgi?id=10141.

> However, by setting BR21_JLEVEL to non-zero, a user volutarily limits
> the number of jobbs allowed to run concurrently (for various reasons,
> like this is not a priority task on the machine; or like the
> autobuilders, to spread the load accross multiple runs without
> overloading the machine).
>
> So, propagate tthe parallelisn settings down to mksquashfs, to repect
> the user's will.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

Tested-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

Thanks,
Clayton
