From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 23:31:32 +0100
Subject: [Buildroot] [PATCH 0/2 v2] parted: fix static link (branch
	yem/for-release)
Message-ID: <cover.1417386541.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes static linking in parted.

It needs fixes in two packages:
  - util-linux, so libuuid properly sets its .pc file;
  - parted itself to use pkg-config to find libuuid instead of
    AC_CHECK_LIB.


Changes v1 -> v2:
  - add description to parted patch  (Peter)
  - misc typoes  (Baruch, Peter)


Regards,
Yann E. MORIN.


The following changes since commit b68b6eca4c7c7895cd9d1a17761fdc3a835a6be7:

  package/libwebsockets: fix static build (2014-11-30 12:43:33 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/for-release

for you to fetch changes up to fa1b00debbe3293a7617c2c7829e9acead92dc19:

  package/parted: fix static link (2014-11-30 14:59:24 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/util-linux: libuuid needs -lintl
      package/parted: fix static link

 .../parted/parted-003-fix-static-link-uuid.patch   | 48 ++++++++++++++++++++++
 package/util-linux/util-linux.mk                   |  8 ++++
 2 files changed, 56 insertions(+)
 create mode 100644 package/parted/parted-003-fix-static-link-uuid.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
