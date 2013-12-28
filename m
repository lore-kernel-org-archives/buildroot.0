From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Dec 2013 18:39:10 +0100
Subject: [Buildroot] [PATCH 0/4 v2] Add ability to generate some graphs
Message-ID: <cover.1388252053.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a small series that adds some graphing abilities to Buildroot:
  - graph build-times, originally by Thomas, revamped now that our step-hooks
    generate $(O)/build/build-time.log for all builds
  - expose this, graph-depends and <package>-graph-depends as make targets
  - allow generating either PDF or PNG graphs

Regards,
Yann E. MORIN.

Changes v1 -> v2:
  - add --input to graph-build time  (Thomas)
  - move %-graph-depends to package/pkg-generic  (Thomas)
  - document <package>-graph-depends  (Thomas)
  - document GRAPH_ALT and GRAPH_OUT in manual  (Thomas)
  - misc typoes

Regards,
Yann E. MORIN.

----------------------------------------------------------------
Thomas Petazzoni (1):
      graph-build-time: generate graphs based on timing data

Yann E. MORIN (3):
      Makefile: expose target 'graph-build' to generate the build-time graphs
      Makefile: expose 'graph-depends' to generate a graph of the dependency tree
      graphs: support generating png graphs

 Makefile                         |  22 +++
 docs/manual/common-usage.txt     |   4 +
 package/pkg-generic.mk           |   5 +
 support/scripts/graph-build-time | 290 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 321 insertions(+)
 create mode 100755 support/scripts/graph-build-time

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
