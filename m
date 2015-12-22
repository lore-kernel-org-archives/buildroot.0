From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Dec 2015 21:53:32 +0100
Subject: [Buildroot] [PATCH 0/5 v4] core/pkg-kconfig: handle generated
	kconfig defconfigs (branch yem/kconfig-gen-defconfig)
Message-ID: <cover.1450817564.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an attempt to support defconfig that are generated with
make rules.

The Linux kernel now has at least one defconfig that is not an actual
file, but a Makefile rule:

    ea4d1a8: powerpc/configs: Replace pseries_le_defconfig with a
             Makefile target using merge_config

Which means that we can no longer just copy defconfig files.

The series was discussed on IRC a while ago, and it was decided I would
just adopt it, clean it and resubmit. Thanks go to Sam for the initial
submission. Thanks! :-)


Changes v3 -> v4:
  - do not append the _defconfig suffix in the infra, let the packages
    do that (as it was before)  (Thomas)

Changes v2 -> v3 (Yann):
  - make all core changes in the same patch
  - update the manual
  - misc cleanups
  - misc typoes and rephrasing


Regards,
Yann E. MORIN.


The following changes since commit c61e97a4d9779e72004e563d00e7985104cba462:

  lockdev: fix build with the musl C library (2015-12-22 21:39:17 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/kconfig-gen-defconfig

for you to fetch changes up to 51882e0fdeb29ed2beecc63f2e78be6b0c568e9b:

  boot/barebox: handle generated defconfigs (2015-12-22 21:47:09 +0100)

----------------------------------------------------------------
Sam bobroff (4):
      core/pkg-kconfig: handle generated defconfigs
      package/linux: handle generated defconfigs
      boot/at91bootstrap3: handle generated defconfigs
      boot/barebox: handle generated defconfigs

Yann E. MORIN (1):
      docs/manual: document the new kconfig-package variable

 boot/at91bootstrap3/at91bootstrap3.mk   |  9 ++++-----
 boot/barebox/barebox.mk                 | 10 ++++------
 docs/manual/adding-packages-kconfig.txt | 10 ++++++++++
 linux/linux.mk                          | 10 ++++------
 package/pkg-kconfig.mk                  | 20 ++++++++++++++++----
 5 files changed, 38 insertions(+), 21 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
