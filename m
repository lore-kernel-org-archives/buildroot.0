From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2019 20:22:07 +0100
Subject: [Buildroot] [PATCH 0/3] package/kodi: fix build in minimal config
 (branch yem/fixes)
Message-ID: <cover.1573759321.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

With a minimal configuration, Kodi fails to build because of a missing
autopoint, so this series adds the missing dependency to host-gettext.

In the way, it also brings two fixes to gettext-tiny.

Failing defconfig:
    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_INIT_NONE=y
    BR2_SYSTEM_BIN_SH_NONE=y
    # BR2_PACKAGE_BUSYBOX is not set
    BR2_PACKAGE_KODI=y
    BR2_PACKAGE_RPI_USERLAND=y
    BR2_PACKAGE_PYTHON=y
    BR2_PACKAGE_PYTHON_PY_ONLY=y
    # BR2_TARGET_ROOTFS_TAR is not set

Error message:
    [  2%] Performing autoreconf step for 'libcpluff'
    autoreconf: Entering directory `.'
    autoreconf: running: autopoint --force
    Can't exec "autopoint": No such file or directory at [...]/host/share/autoconf/Auto4te/FileUtils.pm line 345.
    autoreconf: failed to run autopoint: No such file or directory
    autoreconf: autopoint is needed because this package uses Gettext
    make[4]: *** [CMakeFiles/libcpluff.dir/build.make:121: build/cpluff/src/libcpluff-stamp/libcpluff-autoreconf] Error 1
    make[3]: *** [CMakeFiles/Makefile2:615: CMakeFiles/libcpluff.dir/all] Error 2


Regards,
Yann E. MORIN.


The following changes since commit 6d588b718de3cc17aee95462fd356933c6470006

  package/kodi: drop readline dependency (2019-11-14 18:37:10 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 9a12e61152e7f9944e986aa9f1c7483750e767c2

  package/kodi: add missing host-gettext dependency (2019-11-14 20:09:21 +0100)


----------------------------------------------------------------
Yann E. MORIN (3):
      package/gettext-tiny: fix prefix in autopoint
      package/gettext-tiny: fix gettext wrapper
      package/kodi: add missing host-gettext dependency

 package/gettext-tiny/gettext-tiny.mk | 1 +
 package/gettext-tiny/gettext-wrapper | 2 +-
 package/kodi/kodi.mk                 | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
