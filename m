From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Apr 2014 22:42:37 +0200
Subject: [Buildroot] [PATCH 0/6] Misc graphs enhancements (branch yem/graphs)
Message-ID: <cover.1397421554.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a quick series with enhancements to generated graphs:
  - graph-depends
    - new option to limit the depth of the graph
    - toolchain is only shown as a dependency of of 'All', not
      every packages
  - build-time
    - embiggen the graph with lots of packages

This should hopefully be a step to present nicer graphs. Not yet
really perfect, but still.

Regards,
Yann E. MORIN.


The following changes since commit fae7cc33a117d5408019b705d76ebb4549593f88:

  mtd: fix build against uClibc (2014-04-13 21:44:06 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/graphs

for you to fetch changes up to 3f8fcc1e8205eb851227c1b085355089a9368faf:

  graphs: make graphs with lots of packages nicer to look at (2014-04-13 22:37:45 +0200)

----------------------------------------------------------------
Yann E. MORIN (6):
      Makefile: rename non-user-facing variable
      support/graph-depends: use argparse to parse argv[]
      support/graph-depends: add option to limit the depth of the graph
      manual: document BR2_GRAPH_DEPTH
      support/graph-depends: don't show toolchain dependency for all packages
      graphs: make graphs with lots of packages nicer to look at

 Makefile                         | 11 +++---
 docs/manual/common-usage.txt     |  2 +
 package/pkg-generic.mk           |  4 +-
 support/scripts/graph-build-time | 17 ++++++---
 support/scripts/graph-depends    | 79 ++++++++++++++++++++++++++++------------
 5 files changed, 76 insertions(+), 37 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
