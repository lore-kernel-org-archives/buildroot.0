From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Sep 2017 20:23:36 +0200
Subject: [Buildroot] [PATCH 1/2] boot/grub: remove
In-Reply-To: <59a8a70c74acb_4c3212b6eec928af@ultri3.mail>
References: <dcfdaefd6117d329079c5b6fbea1fbf00fe2094c.1504194830.git.yann.morin.1998@free.fr>
 <59a8a70c74acb_4c3212b6eec928af@ultri3.mail>
Message-ID: <20170901182336.GA2866@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-08-31 21:17 -0300, Ricardo Martincoski spake thusly:
> I don't see this patch on patchwork.

No, it is too big... :-/

And it's not on nte list either... :-/

> On Thu, Aug 31, 2017 at 12:54 PM, Yann E. MORIN wrote:
> 
> [snip]
> > ---
> >  Config.in.legacy                              |     9 +
> >  boot/Config.in                                |     1 -
> >  boot/grub/Config.in                           |   200 -
> >  boot/grub/grub.200-fix_mbr_handling.patch     |    13 -
> >  boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch |    36 -
> >  boot/grub/grub.400-nic_update2.patch          | 47064 ------------------------
> >  boot/grub/grub.hash                           |     3 -
> >  boot/grub/grub.mk                             |   109 -
> >  boot/grub/menu.lst                            |    16 -
> >  boot/grub/splash.xpm.gz                       |   Bin 16466 -> 0 bytes
> >  support/testing/tests/fs/test_iso9660.py      |    37 -
> 
> The update to .gitlab-ci.yml is missing.

OK, good catch!

> >  11 files changed, 9 insertions(+), 47479 deletions(-)
> [snip]
> > +++ b/support/testing/tests/fs/test_iso9660.py
> > @@ -85,43 +85,6 @@ BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
> >          self.assertEqual(exit_code, 0)
> >  
> >  #
> > -# Grub
> > -#
> > -
> > -class TestIso9660GrubExternal(infra.basetest.BRTest):
> > -    config = BASIC_CONFIG + \
> > -"""
> > -BR2_TARGET_ROOTFS_ISO9660=y
> > -# BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
> > -BR2_TARGET_GRUB=y
> > -BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
> > -""".format(infra.filepath("conf/grub-menu.lst"))
> 
> This file is not used by remaining test cases so it can be removed:
> support/testing/conf/grub-menu.lst

Yup!

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
