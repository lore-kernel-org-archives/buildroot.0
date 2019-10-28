From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Oct 2019 23:54:37 +0100
Subject: [Buildroot] [PATCH 0/3] udev providers: compile the hwdb at build
 time (branch yem/host-eudev)
Message-ID: <cover.1572303270.git.yann.morin.1998@free.fr>
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


Regards,
Yann E. MORIN.


The following changes since commit 658388138ceba022c0db7ddb30a453140911f994

  package/libsigrok: fix libftdi support (2019-10-28 23:37:58 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 371d42c6636c11fe7ad280c28ca67aa9e2d9f3ba

  package/systemd: generate hwdb.bin (2019-10-28 23:54:09 +0100)


----------------------------------------------------------------
Yann E. MORIN (3):
      package/eudev: introduce a host variant
      package/eudev: generate hwdb.bin
      package/systemd: generate hwdb.bin

 package/Config.in.host       |  1 +
 package/eudev/Config.in      |  3 ++-
 package/eudev/Config.in.host |  3 +++
 package/eudev/eudev.mk       | 36 ++++++++++++++++++++++++++++++++++++
 package/systemd/Config.in    |  1 +
 package/systemd/systemd.mk   | 23 +++++++++++++++++++++++
 6 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 package/eudev/Config.in.host

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
