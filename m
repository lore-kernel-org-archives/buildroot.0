From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 Jan 2014 23:46:05 +0100
Subject: [Buildroot] [PATCH 0/5] Misc accumulated changes
Message-ID: <cover.1389134731.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a small series with a few un-assorted fixes for the toolchain
wrapper and for graph-depends, a cleanup in the system sub-menu for
/etc/{hostname,issue}, a new package, and a blurb in the manual about
dealing efficiently with very large files.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Sagaert Johan (1):
      system: default to empty issue/hostname for custom skeleton

Yann E. MORIN (4):
      Makefile: support running graph-depends from out-of-tree
      toolchain/external: fix wrapper by not passing conflicting flags
      package/tzdata: install a default localtime
      manual: add section about dealing efficiently with big image files

 Makefile                                           |  3 +-
 docs/manual/common-usage.txt                       | 39 ++++++++++++++++++++
 package/pkg-generic.mk                             |  3 +-
 package/tzdata/Config.in                           | 10 ++++++
 package/tzdata/tzdata.mk                           |  8 ++++-
 system/Config.in                                   | 32 ++++++++++-------
 .../toolchain-external/ext-toolchain-wrapper.c     | 41 ++++++++++++++++------
 7 files changed, 111 insertions(+), 25 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
