From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 11 Oct 2019 18:21:36 +0200
Subject: [Buildroot] beaglebone_qt5 does not build since commit
 a7914499b80
In-Reply-To: <CAJ4jsae64FAUnKVqj2wEbYpEaLC31=gJuZuGCV3ZLjLbOP6djQ@mail.gmail.com>
References: <CAJ4jsae64FAUnKVqj2wEbYpEaLC31=gJuZuGCV3ZLjLbOP6djQ@mail.gmail.com>
Message-ID: <CAGm1_ks9UE8jfLaQTdVo3gtdb6+4o87W1QVtQgjk6vuXV5_9tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Fri, Oct 11, 2019 at 4:03 AM Carlos Santos <unixmania@gmail.com> wrote:
>
> Hello,
>
> configs/beaglebone_qt5_defconfig contain BR2_GCC_VERSION_5_X=y because
> the Linux 4.1 kernel used on the board does not compile with gcc 6.x
> and later.
>
> At the same time it contains BR2_TOOLCHAIN_BUILDROOT_GLIBC=y, which
> invalidated the CGG version selection because
> since commit a7914499b80 glbc requires GCC 6.2 or later.
>
> Switching to uClibc is not an option, since ti-sgx-um requires glibc.

I've also seen the issue with the toolchain. I'm not familiar with 3D
stuff. My intention was to make both beaglebone defconfigs coherent in
regards to the bootloader

@Lothar can help here?

If you fix the defcongif, please also drop the /dev/ttyOx as a console.

Regards,
Yegor.
