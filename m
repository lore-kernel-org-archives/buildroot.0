From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 13 Oct 2019 11:29:14 +0200
Subject: [Buildroot] beaglebone_qt5 does not build since commit
 a7914499b80
In-Reply-To: <CAJ4jsae64FAUnKVqj2wEbYpEaLC31=gJuZuGCV3ZLjLbOP6djQ@mail.gmail.com>
References: <CAJ4jsae64FAUnKVqj2wEbYpEaLC31=gJuZuGCV3ZLjLbOP6djQ@mail.gmail.com>
Message-ID: <cbf93c1c-0a4a-79d4-6ebd-5d26f37d3c23@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos, All,

Le 11/10/2019 ? 04:03, Carlos Santos a ?crit?:
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
> 

We recently (June 2019) talked about this defconfig [1] but this was before
merging glibc 2.30 (August 2019).

There is an old patch [2] [3] in patchwork bumping the kernel (to 4.9) used in
this defconfig but it's marked "Changes Requested" due to issues.

If we really want to keep this defconfig (as is), we have to use an external
toolchain old enough to build the kernel and TI's modules.

[1] http://lists.busybox.net/pipermail/buildroot/2019-June/253504.html
[2] http://patchwork.ozlabs.org/patch/939705/
[3] http://lists.busybox.net/pipermail/buildroot/2018-June/224863.html

Best regards,
Romain
