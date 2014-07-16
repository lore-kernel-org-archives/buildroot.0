From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jul 2014 00:00:29 +0200
Subject: [Buildroot] [PATCH 0/6 v3] pkg-autotools: introduce infra to
	gettextize packages (branch yem/gettext)
Message-ID: <cover.1405547907.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series introduces the gettextize of a package as an optional
sequence in the autotools package infra.

It has been only slightly tested, so is still in RFC stage.

Three packages have been converted: wget (the historical offender),
coreutils and parted. Others may need gettextizing, too, but the
autobuilders (or users) will catch them eventually.


Changes v2 -> v3:
  - fix double-dollars  (Gustavo)
  - fix hook name  (Gustavo)
  - reword commit log for wget package  (Gustavo)
  - gettextize gst1-plugins-bad  (Gustavo)
  - typoes  (Gustavo)

Changes RFCv1 -> RFCv2:
  - only getttextize with autoreconf  (Gustavo)


Regards,
Yann E. MORIN.


The following changes since commit cff18c2f347a46fb996808b6ac439e2a222aa189:

  opencv: add jasper support (2014-07-16 22:59:03 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/gettext

for you to fetch changes up to f200992ff52ec38350cf0fcd1d79c5b459da175f:

  package/gst1-plugins-bad: gettextize to match the new gettext version (2014-07-16 23:57:48 +0200)

----------------------------------------------------------------
Yann E. MORIN (6):
      pkg-autotools: add support to gettextize a package
      manual: add gettextize explanations in the manual
      package/wget: use the new gettextize infra
      package/coreutils: gettextize to match the new gettext version
      package/parted: gettextize to match the new gettext version
      package/gst1-plugins-bad: gettextize to match the new gettext version

 docs/manual/adding-packages-autotools.txt          | 12 ++++++++
 package/coreutils/coreutils.mk                     |  1 +
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  1 +
 package/parted/parted.mk                           |  1 +
 package/pkg-autotools.mk                           | 33 ++++++++++++++++++++--
 package/wget/wget.mk                               |  9 +-----
 6 files changed, 47 insertions(+), 10 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
