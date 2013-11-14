From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2013 19:46:55 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch yem/patchwork
Message-ID: <cover.1384454667.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series ensures that taregt/ and our copy of busybox .config are
writeable.

In case the Buildroot tree is RO (eg. shared via a read-only NFS mount),
target/ would end-up read-only, which is a bit awkward, since we won't be
able to add files in there. Ditto for the busybox' .config file, since we
need to tweak it with sed.

I've had this locally for some time now, grabbed from some patches in
patchwork. A previous submission of this series has been marked as
"Changes Requested", but there's no trace of it in the ML, so I'm just
re-spinning them as-is for further comments.

Changes v1 -> v2:
  - add three other files to the list  (Danomi)

Regards,
Yann E. MORIN.


Regards,
Yann E. MORIN.


The following changes since commit 2b9bdcafa3d69bcc3d63d5d1d3d2ab692413b39d:

  qemu/arm-nuri: bump to latest 3.10.x kernel version (2013-11-14 12:25:04 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/patchwork

for you to fetch changes up to 9bc9c11ace25603f32efc9248e9a513581192f59:

  fs: ensure $(TARGET_DIR_WARNING_FILE) is writable (2013-11-14 19:41:09 +0100)

----------------------------------------------------------------
Nathan Lynch (2):
      target: ensure target/ dir is writable
      busybox: ensure $(BUSYBOX_BUILD_CONFIG) is writable

Yann E. MORIN (3):
      linux: ensure buildroot_defconfig is writable
      package/uClibc: ensure .oldconfig is writable
      fs: ensure $(TARGET_DIR_WARNING_FILE) is writable

 Makefile                   | 6 +++---
 fs/common.mk               | 2 +-
 linux/linux.mk             | 2 +-
 package/busybox/busybox.mk | 2 +-
 package/uclibc/uclibc.mk   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
