From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Oct 2015 23:59:04 +0200
Subject: [Buildroot] [PATCH 0/2 v3] package/nodejs: bump version (branch
	yem/node)
Message-ID: <cover.1445291882.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an attempt at bumping nodejs to a newer release.

A previous submission was made by Jaap a while back (and I had missed it
so far, only got pointed to it on IRC lately):
    http://lists.busybox.net/pipermail/buildroot/2015-October/thread.html#141220

Yet, this patch was incomplete, and since I had already been working on
that, here's my series now. ;-)

Note that in the meantime, nodejs has also released a newer version,
4.2.0 and then a day later 4.2.1 (because big problem?). There's nothing
new since 4.2.1, but it is still only a week old, so I'd wait a bit to
see if they spit out yet another bug-fix release for 4.2.x shortly...


Changes v2 -> v3:
  - simplify conditions for ARM and VFPv2  (Thomas)
  - fix commit log  (J?rg)
  - fix commit log in a patch  (Thomas)

Changes v1 -> v2:
  - original sumbmisison from Jaap considered v1
  - needs gcc >= 4.8
  - fix architectural ARM dependencies (armv6+ *and* VFPv2)
  - forward-port more patches from 0.12.7
  - use .tar.xz for 4.2.x


Regards,
Yann E. MORIN.


The following changes since commit 84120c10f5ba6c8c4b8d32068616cbdb8a8a8102:

  musl: Make only shared libraries conditional (2015-10-19 23:04:48 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/node

for you to fetch changes up to eb34ab6d35a15dfbec70263091f58c3e7ec2efab:

  package/nodejs: add version 4.1.2 (2015-10-19 23:57:11 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/nodejs: fix architectural dependencies on ARM
      package/nodejs: add version 4.1.2

 ...01-Remove-dependency-on-Python-bz2-module.patch | 31 ++++++++
 .../0002-gyp-force-link-command-to-use-CXX.patch   | 29 +++++++
 ...hon-variable-instead-of-hardcoding-Python.patch | 88 ++++++++++++++++++++++
 package/nodejs/4.1.2/0004-fix-arm-vfpv2.patch      | 18 +++++
 package/nodejs/Config.in                           | 24 +++++-
 package/nodejs/nodejs.hash                         |  3 +
 package/nodejs/nodejs.mk                           |  4 +
 7 files changed, 194 insertions(+), 3 deletions(-)
 create mode 100644 package/nodejs/4.1.2/0001-Remove-dependency-on-Python-bz2-module.patch
 create mode 100644 package/nodejs/4.1.2/0002-gyp-force-link-command-to-use-CXX.patch
 create mode 100644 package/nodejs/4.1.2/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
 create mode 100644 package/nodejs/4.1.2/0004-fix-arm-vfpv2.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
