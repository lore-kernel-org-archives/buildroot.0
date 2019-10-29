From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Oct 2019 23:07:52 +0100
Subject: [Buildroot] [PATCH 0/3 v2] udev providers: compile the hwdb at
 build time (branch yem/host-eudev-2)
Message-ID: <cover.1572386855.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

The *.hwdb files installed by eudev or systemd are "source" files; they
need to be compiled into a binary form to be useful.

This needs udevadm to be available, so we introduce a eudev host variant
to provide it, and use that from both eudev and systemd to compile the
database during target-finalize.

---
Changes v1 -> v2:
  - do a custom configure and install of host-eudev, to simplify the
    hooks  (Carlos)


Regards,
Yann E. MORIN.


The following changes since commit 1f89ab5c0cf44017955ebf72c89c31df60b1b0a5

  package/uclibc-ng-test: fix build with latest glibc (2019-10-29 22:55:36 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 803cedc8ae9597d0ae287e65d873cb9e0f6a91d9

  packagesystemd: generate the hwdb.bin (2019-10-29 23:06:24 +0100)


----------------------------------------------------------------
Yann E. MORIN (3):
      package/eudev: introduce a host variant
      package/eudev: generate the hwdb.bin
      packagesystemd: generate the hwdb.bin

 package/Config.in.host       |  1 +
 package/eudev/Config.in      |  3 ++-
 package/eudev/Config.in.host |  3 +++
 package/eudev/eudev.mk       | 36 ++++++++++++++++++++++++++++++++++++
 package/systemd/Config.in    |  1 +
 5 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 package/eudev/Config.in.host

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
