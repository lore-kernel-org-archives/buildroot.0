From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jul 2014 00:37:19 +0200
Subject: [Buildroot] [PATCH 0/5 RFCv2] pkg-autotools: introduce infra to
	gettextize packages (branch yem/gettext)
Message-ID: <cover.1405463657.git.yann.morin.1998@free.fr>
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

Changes RFCv1 -> RFCv2:
  - only getttextize with autoreconf  (Gustavo)


Regards,
Yann E. MORIN.


The following changes since commit 201adefb6e17e30d8e66b3d673c58cfd17ac1b5a:

  Makefile: do not purge locale-archive from target (2014-07-15 22:56:23 +0200)

are available in the git repository at:

  git://ymorin.is-a-geek.org/buildroot yem/gettext

for you to fetch changes up to 2cf9afdee12730d0d550b2847f620e8011b6852e:

  package/parted: gettextize to match the new gettext version (2014-07-16 00:23:15 +0200)

----------------------------------------------------------------
Yann E. MORIN (5):
      pkg-autotools: add support to gettextize a package
      manual: add gettextize explanations in the manual
      package/wget: use the new gettextize infra
      package/coreutils: gettextize to match the new gettext version
      package/parted: gettextize to match the new gettext version

 docs/manual/adding-packages-autotools.txt | 12 +++++++++++
 package/coreutils/coreutils.mk            |  1 +
 package/parted/parted.mk                  |  1 +
 package/pkg-autotools.mk                  | 33 +++++++++++++++++++++++++++++--
 package/wget/wget.mk                      |  6 +-----
 5 files changed, 46 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
