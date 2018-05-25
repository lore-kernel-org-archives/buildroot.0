From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 May 2018 22:42:58 +0200
Subject: [Buildroot] [PATCH 0/2] package/binutils+elf2flt: fix for noMMU
 targets
Message-ID: <cover.1527280948.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

TL;DR: gcc gets confused by our symlinks trick that we use to fix the
rpath handling. We replace symlinks with script wrappers instead.

See the first commit for the whole story.

Fixes: #11031.


Regards,
Yann E. MORIN.


The following changes since commit 2c57dc0469f7e32182932e5937f61f82b01a743a

  cjson: bump to version 1.7.7 (2018-05-25 16:22:11 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 59b3d35d7c805ebee29dc7185ea63e55aca768ca

  package/elf2flt: replace hard-links with script wrappers to fix rpath (2018-05-25 22:24:32 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/binutils: switch from symlinks to script wrappers
      package/elf2flt: replace hard-links with script wrappers to fix rpath

 package/binutils/binutils.mk |  9 ++++++---
 package/elf2flt/elf2flt.mk   | 17 +++++++++++++++++
 2 files changed, 23 insertions(+), 3 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
