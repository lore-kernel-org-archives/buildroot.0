From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2019 10:37:10 +0100
Subject: [Buildroot] [PATCH 0/9] packages: do not use := to append to
 FOO_LICENSE variables (branch yem/pkg-no-immediate-assignment)
In-Reply-To: <cover.1572079551.git.yann.morin.1998@free.fr>
References: <cover.1572079551.git.yann.morin.1998@free.fr>
Message-ID: <2efe9f6c-39ce-b9bb-c942-978ecdd05def@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/10/2019 10:45, Yann E. MORIN wrote:
> Hello All!
> 
> This let us drop the last case where we had to use immediate assignment
> in thr packages .mk files., and thus makes the rule much simpler: we
> never use immediate assignment.

 Series, applied to master, with a few exceptions, see individual replies.

 Thanks,

 Regards,
 Arnout

> 
> 
> Regards,
> Yann E. MORIN.
> 
> 
> The following changes since commit c0ffd16e40f15938f4a440a1048fc3d7fba2f7c4
> 
>   package/kvm-unit-tests: fix build on Arch Linux x86_64 (2019-10-26 10:31:20 +0200)
> 
> 
> are available in the git repository at:
> 
>   git://git.buildroot.org/~ymorin/git/buildroot.git
> 
> for you to fetch changes up to 9c2c26f0d6e2967ef96cf5602e193a397cd4cc6a
> 
>   utils/check-package: report := that apends to variables (2019-10-26 10:40:20 +0200)
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (9):
>       core/legal-info: don't require overriding _LICENSE
>       package: do not override LICENSE, but append to it
>       package: get rid of remnants of using := in LICENSE
>       package/ligpgme: don't use :=, use += and subst
>       package/zmqpp: don't override variable
>       package/gcc: don't override a variable
>       fs: don't use := when not needed
>       arc/riscv: get rid of immediate-assignment
>       utils/check-package: report := that apends to variables
> 
>  arch/arch.mk.riscv                                 | 22 +++++++++++-----------
>  docs/manual/adding-packages-generic.txt            | 16 ++++++++++------
>  fs/btrfs/btrfs.mk                                  |  2 +-
>  fs/ext2/ext2.mk                                    |  2 +-
>  fs/f2fs/f2fs.mk                                    |  2 +-
>  fs/jffs2/jffs2.mk                                  |  4 ++--
>  fs/tar/tar.mk                                      |  2 +-
>  fs/ubi/ubi.mk                                      |  2 +-
>  package/dtc/dtc.mk                                 |  2 +-
>  package/elfutils/elfutils.mk                       |  2 +-
>  package/freeswitch/freeswitch.mk                   |  6 +++---
>  package/gcc/gcc-final/gcc-final.mk                 |  8 +++-----
>  package/gnutls/gnutls.mk                           |  2 +-
>  .../gst1-plugins-bad/gst1-plugins-bad.mk           |  8 ++++----
>  package/iwd/iwd.mk                                 |  2 +-
>  package/kmod/kmod.mk                               |  2 +-
>  package/kodi/kodi.mk                               |  2 +-
>  package/libgpgme/libgpgme.mk                       | 14 +++++++-------
>  package/libidn2/libidn2.mk                         |  4 ++--
>  package/libuci/libuci.mk                           |  2 +-
>  package/pkg-generic.mk                             |  2 +-
>  package/qt5/qt5base/qt5base.mk                     |  4 ++--
>  package/qt5/qt5connectivity/qt5connectivity.mk     |  2 +-
>  package/qt5/qt5enginio/qt5enginio.mk               |  2 +-
>  package/qt5/qt5multimedia/qt5multimedia.mk         |  2 +-
>  package/qt5/qt5scxml/qt5scxml.mk                   |  2 +-
>  .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   |  8 ++++----
>  package/qt5/qt5webchannel/qt5webchannel.mk         |  2 +-
>  package/qt5/qt5websockets/qt5websockets.mk         |  2 +-
>  package/qt5/qt5webview/qt5webview.mk               |  2 +-
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  2 +-
>  package/sg3_utils/sg3_utils.mk                     |  2 +-
>  package/usbredir/usbredir.mk                       |  2 +-
>  package/zmqpp/zmqpp.mk                             |  9 ++++-----
>  utils/checkpackagelib/lib_mk.py                    |  4 +++-
>  35 files changed, 78 insertions(+), 75 deletions(-)
> 
