From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 May 2018 21:45:15 +0200
Subject: [Buildroot] [PATCH 0/2 v2] package/binutils+elf2flt: fix for noMMU
 targets
Message-ID: <cover.1527536710.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

TL;DR: gcc gets confused by our symlinks trick that we use to fix
the rpath handling. This series de-hardlinks using copies instead
of symlinks.

See the first commit for the whole story.

Fixes: #11031.


Regards,
Yann E. MORIN.


The following changes since commit d28591a2ee39704f6795c8aa1d0a3db7e909facc

  poppler: link with libatomic when needed (2018-05-28 20:23:18 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 99b5f16248ada22680df533f78869bcf552e06d9

  package/elf2flt: replace hard-links with copies to fix rpath (2018-05-28 21:22:22 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/binutils: switch from symlinks to copies to fix rpath
      package/elf2flt: replace hard-links with copies to fix rpath

 package/binutils/binutils.mk |  7 ++++---
 package/elf2flt/elf2flt.mk   | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
