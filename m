From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 18:35:38 +0200
Subject: [Buildroot] [PATCH v2 0/5] Recursive show-depends and show-rdepends
Message-ID: <20180331163543.6278-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is a new iteration of the patch from George Redivo [1] that added
the <pkg>-show-rrdepends target. This series pushes this much further:

 - It starts by doing a cleanup pass on graph-depends, moving all
   global code into proper functions, and removing most global
   variables.

 - It adds a --quiet option to ask graph-depends to not display its
   debugging messages, which are not really meaningful for
   show-recursive-depends/show-recursive-rdepend.

 - We have chosen to name the target <pkg>-show-recursive-rdepends
   instead of <pkg>-show-rrdepends, as it is more explicitly, and
   allows us to also introduce <pkg>-show-recursive-depends.

 - The change in graph-depends (introducing the --flat-list feature)
   and in the package infrastructure are in separate patches.

 - The output of show-recursive-(r)depends is now on a single line
   (instead of one package by line), to match the output of the
   existing show-depends and show-rdepends targets.

[1] http://patchwork.ozlabs.org/patch/756075/

Thanks!

Thomas

George Redivo (2):
  support/scripts/graph-depends: add --flat-list option
  package/pkg-generic: add <pkg>-show-recursive-(r)depends targets

Thomas Petazzoni (3):
  support/scripts/graph-depends: remove global code and most global
    variables
  support/scripts/graph-depends: use colors instead of colours
  support/scripts/graph-depends: add --quiet option

 Makefile                      |   4 +
 docs/manual/common-usage.txt  |   4 +-
 package/pkg-generic.mk        |   8 ++
 support/scripts/brpkgutil.py  |  18 +--
 support/scripts/graph-depends | 313 ++++++++++++++++++++++--------------------
 5 files changed, 188 insertions(+), 159 deletions(-)

-- 
2.14.3
