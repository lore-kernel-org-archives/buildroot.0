From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Sep 2017 15:53:23 +0200
Subject: [Buildroot] [pull request v2] package/grub: drop grub-legacy
In-Reply-To: <cover.1506174552.git.yann.morin.1998@free.fr>
References: <cover.1506174552.git.yann.morin.1998@free.fr>
Message-ID: <20170923135323.GA3779@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2017-09-23 15:49 +0200, Yann E. MORIN spake thusly:
> This two-patch series removes grub, aka grub-legacy.
> 
> The reasioning is explained in the first patch, which actually gets rid
> of grub.
> 
> The second patch then removes grub support in the iso9660 filesystem, as
> grub is no longer available then.

I forgot to state: git refuses to send patches when a line is longer
than 998 chars, but the first patch does remove such lines. So this is a
plain pull-request; the patches can't go to the list...

For those wanting to see the changes, you can browse them:
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/no-grub-legacy

Regards,
Yann E. MORIN.

> Regards,
> Yann E. MORIN.
> 
> 
> The following changes since commit bf9cae05fde11077bd04234b301bb62e73a0608c
> 
>   package/olsr: bump version to 0.9.6.1 (2017-09-22 23:37:01 +0200)
> 
> 
> are available in the git repository at:
> 
>   git://git.buildroot.org/~ymorin/git/buildroot.git
> 
> for you to fetch changes up to 28ae3fd3246849f4d10419790856d15bd6b0d8d7
> 
>   fs/iso9660: remove support for grub (2017-09-23 15:44:34 +0200)
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (2):
>       boot/grub: remove
>       fs/iso9660: remove support for grub
> 
>  .gitlab-ci.yml                                |     2 -
>  Config.in.legacy                              |     9 +
>  boot/Config.in                                |     1 -
>  boot/grub/Config.in                           |   200 -
>  boot/grub/grub.100-autoreconf.patch           |  1407 -
>  boot/grub/grub.200-fix_mbr_handling.patch     |    13 -
>  boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch |    36 -
>  boot/grub/grub.400-nic_update2.patch          | 47064 ------------------------
>  boot/grub/grub.hash                           |     3 -
>  boot/grub/grub.mk                             |   109 -
>  boot/grub/menu.lst                            |    16 -
>  boot/grub/splash.xpm.gz                       |   Bin 16466 -> 0 bytes
>  fs/iso9660/Config.in                          |    16 +-
>  fs/iso9660/iso9660.mk                         |    32 +-
>  fs/iso9660/menu.lst                           |    20 -
>  support/testing/conf/grub-menu.lst            |    20 -
>  support/testing/tests/fs/test_iso9660.py      |    37 -
>  17 files changed, 14 insertions(+), 48971 deletions(-)
>  delete mode 100644 boot/grub/Config.in
>  delete mode 100644 boot/grub/grub.100-autoreconf.patch
>  delete mode 100644 boot/grub/grub.200-fix_mbr_handling.patch
>  delete mode 100644 boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch
>  delete mode 100644 boot/grub/grub.400-nic_update2.patch
>  delete mode 100644 boot/grub/grub.hash
>  delete mode 100644 boot/grub/grub.mk
>  delete mode 100644 boot/grub/menu.lst
>  delete mode 100644 boot/grub/splash.xpm.gz
>  delete mode 100644 fs/iso9660/menu.lst
>  delete mode 100644 support/testing/conf/grub-menu.lst
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
