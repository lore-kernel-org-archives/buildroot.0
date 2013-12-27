From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Dec 2013 00:12:49 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem/graphs
Message-ID: <cover.1388185918.git.yann.morin.1998@free.fr>
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
  - expose this and graph-depends as make targets
  - allow generating either PDF or PNG graphs

Regards,
Yann E. MORIN.


The following changes since commit 269da64af5ad72e1d522b54a6203970c3eb344d0:

  package: deprecate some more development tools (2013-12-27 19:54:05 +0100)

are available in the git repository at:

  git://ymorin.is-a-geek.org/buildroot yem/graphs

for you to fetch changes up to 22105197db33dde1f1cee82511ce9c6d00d86853:

  graphs: support generating png graphs (2013-12-28 00:00:24 +0100)

----------------------------------------------------------------
Thomas Petazzoni (1):
      graph-build-time: generate graphs based on timing data

Yann E. MORIN (3):
      Makefile: expose target 'graph-build' to generate the build-time graphs
      Makefile: expose 'graph-depends' to generate a graph of the dependency tree
      graphs: support generating png graphs

 Makefile                         |  31 +++++
 package/pkg-generic.mk           |   3 +
 support/scripts/graph-build-time | 284 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 318 insertions(+)
 create mode 100755 support/scripts/graph-build-time

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
