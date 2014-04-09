From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Apr 2014 00:20:00 +0200
Subject: [Buildroot] [PATCH 0/3] [RFC] pkg-autotools: introduce infra to
	gettextize packages (branch yem/gettextize)
Message-ID: <cover.1397081821.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This small series introduces the gettextize of a package as an optional
sequence in the autotools package infra.

    WARNING! Completely untested, only an RFC!

Currently, wget is the sole user, and the way it is done for wget is
just working by chance (see commit log of path 3 for the complete
explanations.)

So, move the gettextization to the pkg-autotools infra, so we have a
chance to do it correctly and consistently across packages.

Regards,
Yann E. MORIN.


The following changes since commit 8b083158a5d7c80bc54697c17ab4bbbc8d65fb04:

  linux-headers: bump 3.{2,12}.x series (2014-04-09 13:45:13 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/gettextize

for you to fetch changes up to f318a05b46d762c07c435c133b0a6e836600c6d6:

  package/wget: use the new gettextize infra (2014-04-10 00:16:01 +0200)

----------------------------------------------------------------
Yann E. MORIN (3):
      pkg-autotools: add support to gettextize a package
      manual: add gettextize explanations in the manual
      package/wget: use the new gettextize infra

 docs/manual/adding-packages-autotools.txt | 12 ++++++++++++
 package/pkg-autotools.mk                  | 30 ++++++++++++++++++++++++++++++
 package/wget/wget.mk                      |  6 +-----
 3 files changed, 43 insertions(+), 5 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
