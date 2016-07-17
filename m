From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 10:44:24 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	yem/systemd-skeleton-2
Message-ID: <cover.1468744792.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a clean-up of our skeleton handling, especially the
customskeleton, aimed at preparing the ground for adding proper systemd
handling in our skeleton.

The first wo patches are independent cleanups, adding a comment about
busybox-show-others and using package-specific target-finalize hooks.

The next four patches remove all choice options for customising the
custom skeleton, on the assumption that the user is responsible for
providing a complete skeleton.

This is a resend of the previous patches that were almost accepted
previously, taking inteo account the few comments that were made during
the Summer Camp two weeks ago.

When this is in, I'll rework the rest of the skeleton-systemd series as
suggested by Thomas.


Regards,
Yann E. MORIN.


The following changes since commit 97308d8e9ae0f096ec2df8275deb063266583b91

  package/ti-gfx: list supported SoCs in Config.in help text (2016-07-16 22:53:55 +0200)


are available in the git repository at:

  https://gitlab.com/ymorin/buildroot.git

for you to fetch changes up to c890968b9496cac9613f3ea69282ec4db8fa3de2

  system: do not set hostname and issue for custom skeleton (2016-07-17 00:04:42 +0200)


----------------------------------------------------------------
Yann E. MORIN (6):
      package/busybox: add comment about BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
      toolchain: use the <PKG>_TARGET_FINALIZE_HOOKS
      system: provide no default for custom skeleton path
      system: move the rootfs skeleton choice
      system: do not handle network settings for custom skeleton
      system: do not set hostname and issue for custom skeleton

 package/busybox/Config.in    |  6 +++-
 package/skeleton/skeleton.mk | 14 +++++++---
 system/Config.in             | 65 +++++++++++++++++++++++---------------------
 toolchain/toolchain.mk       |  4 +--
 4 files changed, 51 insertions(+), 38 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
