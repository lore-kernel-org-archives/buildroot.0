From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Sep 2020 23:42:32 +0200
Subject: [Buildroot] [PATCH v4 00/12] IBM s390x and Z architecture
 support
In-Reply-To: <20200917040802.846896-1-egorenar@linux.ibm.com>
References: <20200917040802.846896-1-egorenar@linux.ibm.com>
Message-ID: <20200924214232.GA11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, All,

On 2020-09-17 06:07 +0200, Alexander Egorenkov spake thusly:
> This series of patches adds support for IBM s390x and Z architectures
> to buildroot.
> 
> Alexander Egorenkov (12):
>   arch: add the basic IBM s390x and Z arch support
>   toolchain: add support for the internal IBM s390x and Z toolchain
>   linux: add bzImage support for IBM s390x and Z arch
>   package/qemu: add IBM s390x and Z arch support
>   board/qemu: add IBM s390x and Z arch support
>   package/systemd: add support for IBM s390x and Z arch
>   package/cmake: add support for IBM s390x and Z arch
>   package/liburcu: add support for IBM s390x and Z arch
>   package/kexec: add support for IBM s390x and Z arch
>   package/go: add support for IBM s390x and Z arch
>   package/makedumpfile: add support for IBM s390x and Z arch
>   package/s390-tools: new package

Thanks for the sustained iterations. :-)

Ive now applied the series to master, with a few changes to some
patches; I'll individually reply to the impacted ones.

Thanks!

Regards,
Yann E. MORIN.

>  DEVELOPERS                              |  6 ++
>  Makefile                                |  1 +
>  arch/Config.in                          | 13 ++++
>  arch/Config.in.s390x                    | 34 +++++++++
>  board/qemu/s390x/post-build.sh          | 11 +++
>  board/qemu/s390x/readme.txt             |  8 +++
>  configs/qemu_s390x_defconfig            | 24 +++++++
>  linux/Config.in                         |  2 +-
>  package/Config.in                       |  1 +
>  package/cmake/Config.in                 |  3 +-
>  package/gcc/gcc.mk                      |  5 ++
>  package/go/Config.in.host               |  2 +-
>  package/kexec/Config.in                 |  2 +-
>  package/liburcu/Config.in               |  2 +-
>  package/makedumpfile/Config.in          |  1 +
>  package/qemu/Config.in.host             |  1 +
>  package/s390-tools/Config.in            | 13 ++++
>  package/s390-tools/s390-tools.hash      |  3 +
>  package/s390-tools/s390-tools.mk        | 91 +++++++++++++++++++++++++
>  package/systemd/Config.in               |  1 +
>  toolchain/toolchain-buildroot/Config.in |  6 +-
>  21 files changed, 222 insertions(+), 8 deletions(-)
>  create mode 100644 arch/Config.in.s390x
>  create mode 100755 board/qemu/s390x/post-build.sh
>  create mode 100644 board/qemu/s390x/readme.txt
>  create mode 100644 configs/qemu_s390x_defconfig
>  create mode 100644 package/s390-tools/Config.in
>  create mode 100644 package/s390-tools/s390-tools.hash
>  create mode 100644 package/s390-tools/s390-tools.mk
> 
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
