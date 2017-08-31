From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 31 Aug 2017 20:06:39 +0300
Subject: [Buildroot] [PATCH 0/2] package/grub: drop grub-legacy
In-Reply-To: <cover.1504194830.git.yann.morin.1998@free.fr>
References: <cover.1504194830.git.yann.morin.1998@free.fr>
Message-ID: <20170831170639.w7b6k5tgsd56ll3c@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

On Thu, Aug 31, 2017 at 05:53:56PM +0200, Yann E. MORIN wrote:
> This two-patch series removes grub, aka grub-legacy.
> 
> The reasioning is explained in the first patch, which actually gets rid
> of grub.
> 
> The second patch then removes grub support in the iso8660 filesystem, as
> grub is no longer available then.
> 
> 
> Regards,
> Yann E. MORIN.
> 
> 
> The following changes since commit 0ea3d7ba0e162c68990919e3187749f24268866d
> 
>   CHANGES: start preparing for the final 2017.08 (2017-08-30 22:18:57 +0200)
> 
> 
> are available in the git repository at:
> 
>   git://git.buildroot.org/~ymorin/git/buildroot.git

That's the 'yem/no-grub-legacy' branch right?

The first patch exceeds the list limit so anyone interested in seeing it must 
use git for that.

Here is the git web interface link:

  https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/no-grub-legacy

baruch

> for you to fetch changes up to 89462d4b3d365f2c6585eefeb35175813b5a8af2
> 
>   fs/iso9660: remove support for grub (2017-08-31 17:49:12 +0200)
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (2):
>       boot/grub: remove
>       fs/iso9660: remove support for grub
> 
>  Config.in.legacy                              |     9 +
>  boot/Config.in                                |     1 -
>  boot/grub/Config.in                           |   200 -
>  boot/grub/grub.200-fix_mbr_handling.patch     |    13 -
>  boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch |    36 -
>  boot/grub/grub.400-nic_update2.patch          | 47064 ------------------------
>  boot/grub/grub.hash                           |     3 -
>  boot/grub/grub.mk                             |   109 -
>  boot/grub/menu.lst                            |    16 -
>  boot/grub/splash.xpm.gz                       |   Bin 16466 -> 0 bytes
>  fs/iso9660/Config.in                          |    16 +-
>  fs/iso9660/grub.cfg                           |     7 -
>  fs/iso9660/iso9660.mk                         |    32 +-
>  support/testing/tests/fs/test_iso9660.py      |    37 -
>  14 files changed, 14 insertions(+), 47529 deletions(-)
>  delete mode 100644 boot/grub/Config.in
>  delete mode 100644 boot/grub/grub.200-fix_mbr_handling.patch
>  delete mode 100644 boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch
>  delete mode 100644 boot/grub/grub.400-nic_update2.patch
>  delete mode 100644 boot/grub/grub.hash
>  delete mode 100644 boot/grub/grub.mk
>  delete mode 100644 boot/grub/menu.lst
>  delete mode 100644 boot/grub/splash.xpm.gz
>  delete mode 100644 fs/iso9660/grub.cfg

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
