From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Mar 2019 22:07:03 +0100
Subject: [Buildroot] [PATCH 0/3 v3] support/graphs: speedup graph-depends
 (branch yem/graphs-from-make-2)
Message-ID: <cover.1553288807.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This two-patch series bring tremendous speedups to graph-depends (and to
-rdepends as well) by using the newly-introduced show-dependency-tree.

The first patch is a cleanup in the PHONY rules.

The second patch is a preparatory fixup for the mandatory-deps removal.

The third patch is the actual speedup.

Changes v2 -> v3:
  - fix the %-graph-rdepends  (Thomas P.)
  - simplify by using defaultdicts()  (Thomas P.)
  - return the deps and rdeps


Regards,
Yann E. MORIN.


The following changes since commit f4f7dd9557cf139f6014ada77e947152d5a82fb3

  package/libssh2: security bump to latest git (2019-03-21 00:00:54 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to e26ba891857584eb10bbfbe76ec45be8eb2551b8

  support/graph-depends: use the new make-based dependency tree (2019-03-22 21:49:53 +0100)


----------------------------------------------------------------
Yann E. MORIN (3):
      package/pkg-generic: mark some rule PHONY
      support/graph-depends: don't eliminate mandatory deps for reverse graphs
      support/graph-depends: use the new make-based dependency tree

 package/pkg-generic.mk        |   3 +
 support/scripts/brpkgutil.py  |  97 ++++++++++++-----------------
 support/scripts/graph-depends | 138 +++++++++---------------------------------
 3 files changed, 70 insertions(+), 168 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
