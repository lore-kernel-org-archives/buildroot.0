From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Apr 2018 21:41:50 +0200
Subject: [Buildroot] [PATCH 0/2] core/download: fix extra downloads for
 scm-based main downloads
Message-ID: <cover.1524685305.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

As reported by Luca [0], when the main download for a package is from an
SCM (gt, hg...), then extra downloads are also attempted using the same
site method.

This is due to the big rework of the download infra, when we introduced
the git cache feature.

It is to be noted that, before that big rewrite, the error was a silent
failure (and would have thus failed later), while we now detect that
failure at download time (rather than at extract or later).


Regards,
Yann E. MORIN.


The following changes since commit babc94e9dd4a1a04c4a0befdb6d32236a30b8ea8

  mbedtls: security bump to version 2.7.2 (2018-04-25 15:29:57 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 58a86c2e2f56abb66012e88c26f5e8c1d6737a2d

  core/pkg-infra: don't enforce site-method for extra downloads (2018-04-25 21:28:49 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      core/pkg-infra: set no-check-hash only for main download
      core/pkg-infra: don't enforce site-method for extra downloads

 package/pkg-download.mk | 4 +---
 package/pkg-generic.mk  | 7 ++++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
