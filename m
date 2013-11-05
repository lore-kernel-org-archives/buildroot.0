From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  6 Nov 2013 00:28:02 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem/misc
Message-ID: <cover.1383693880.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are a few patches I've been assigned to massage into shape, during
the last devday:
  - 186840 (nut)
  - 241511 (ser2net)
  - 242998 + 242999  (rpi)

I'll mark those patchwork IDs as superseded in a moment.

It also includes the OOT Makefile fix since it was in the same branch,
sorry for the duplication... :-/

Regards,
Yann E. MORIN.


The following changes since commit 615881ff5e1a15e99396dd2615bb4ce8c415e0dc:

  package/zic: bump (2013-11-05 23:56:46 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/misc

for you to fetch changes up to 155f4535a09b1cdce293c75108211da899c3a0a8:

  Makefile: fix out-of-tree builds with multiple targets with 'all' (2013-11-06 00:19:16 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/nut: new package
      package/ser2net: add startup script and template config file
      Makefile: fix out-of-tree builds with multiple targets with 'all'

mathieu benoit (2):
      rpi: improve documentation
      rpi: rename board folder for consistency

 board/raspberrypi/readme.txt          | 127 ---------------------------------
 board/rpi/readme.txt                  | 128 ++++++++++++++++++++++++++++++++++
 package/Config.in                     |   1 +
 package/nut/Config.in                 |  20 ++++++
 package/nut/nut-0001-foo-config.patch |  72 +++++++++++++++++++
 package/nut/nut.mk                    |  79 +++++++++++++++++++++
 package/ser2net/S50ser2net            |  48 +++++++++++++
 package/ser2net/ser2net.conf          |   3 +
 package/ser2net/ser2net.mk            |   9 +++
 support/scripts/mkmakefile            |   8 +--
 10 files changed, 364 insertions(+), 131 deletions(-)
 delete mode 100644 board/raspberrypi/readme.txt
 create mode 100644 board/rpi/readme.txt
 create mode 100644 package/nut/Config.in
 create mode 100644 package/nut/nut-0001-foo-config.patch
 create mode 100644 package/nut/nut.mk
 create mode 100644 package/ser2net/S50ser2net
 create mode 100644 package/ser2net/ser2net.conf

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
