From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 May 2020 23:05:10 +0200
Subject: [Buildroot] [PATCH 0/6] Support Python 3.x in U-Boot
In-Reply-To: <20200502212812.51219-1-thomas.petazzoni@bootlin.com>
References: <20200502212812.51219-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200515210510.GH12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-05-02 23:28 +0200, Thomas Petazzoni spake thusly:
> Hello,
> 
> Since 2020.01, U-Boot now uses python3 for its scripts, but our uboot
> package only supports adding a dependency on host-python, which causes
> a number of build failures of our defconfigs.
> 
> To fix this, this series introduces additional U-Boot options with
> appropriate dependencies, and fixes the problematic defconfigs.

Series applied, with a few changes:

  - I applied my proposal to handle the choice of host python version,
    see the thread in patch 2

  - I fixed the defconfig files as thus:
    - for those that need pyelftools or pylibfdt, the NEEDS_PYTHON=y was
      superfluous in the defconfig as it is selected by ither option,
    - for the others that do not have pyelftools or pylibfdt, it has
      become useless, because it no longer show/hides the choice anymore

Thanks!

Regards,
Yann E. MORIN.

> Thomas
> 
> Thomas Petazzoni (6):
>   package/python3-pyelftools: new package
>   boot/uboot: support building U-Boot with Python 3.x
>   configs/olimex_a20_olinuxino_lime{,2}: use Python 3.x
>   configs/beelink_gs1: use Python 3.x
>   configs/roc_pc_rk3399: fix U-Boot dependencies
>   configs/nanopi_neo4: fix U-Boot dependencies
> 
>  boot/uboot/Config.in                          | 29 +++++++++++++++++++
>  boot/uboot/uboot.mk                           | 12 +++++++-
>  configs/beelink_gs1_defconfig                 |  2 ++
>  configs/nanopi_neo4_defconfig                 |  4 +--
>  configs/olimex_a20_olinuxino_lime2_defconfig  |  2 ++
>  configs/olimex_a20_olinuxino_lime_defconfig   |  2 ++
>  configs/roc_pc_rk3399_defconfig               |  4 +--
>  .../python-pyelftools/python-pyelftools.mk    |  1 +
>  .../python3-pyelftools.hash                   |  1 +
>  .../python3-pyelftools/python3-pyelftools.mk  | 17 +++++++++++
>  10 files changed, 69 insertions(+), 5 deletions(-)
>  create mode 120000 package/python3-pyelftools/python3-pyelftools.hash
>  create mode 100644 package/python3-pyelftools/python3-pyelftools.mk
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
