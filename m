From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Mar 2015 23:56:29 +0100
Subject: [Buildroot] [pull request] misc graph-depends enhancements
Message-ID: <cover.1427150990.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces a few enhancements to graph-depends, with two new
options:
  - --stop-on/-s PKG: to stop graphing on package PKG;
  - --exclude/-x PKG: like --stop-on, but also omit PKG from the graph.

PKG can be one of an actual package name, a glob or the keyword
'virtual' (to stop on / exclude virtual packages). Stoping on, or
excluding host packages can easily be done by using the glob 'host-*'

Note: I did not introduce the keyword 'host' because 'host' is an
existing package, and even though we do not package it so far, it
would have clashed, should we eventually have it.

Regards,
Yann E. MORIN.


The following changes since commit 22014e038047dfa2a303fecce0a22d1c5811b6a5:

  mongoose: bump to version 5.6 (2015-03-23 23:17:32 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/graph-depends

for you to fetch changes up to f9b988d14b88cd502a3ae47739597e45882bf1f3:

  docs/manual: document new graph-depends options (2015-03-23 23:44:21 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      support/graph-depends: add option to stop on specific packages
      support/graph-depends: accepts globs to stop on package
      support/graph-depends: add option to completely exclude a package
      docs/manual: document new graph-depends options

 docs/manual/common-usage.txt  |  8 ++++++++
 support/scripts/graph-depends | 34 +++++++++++++++++++++++++++++++---
 2 files changed, 39 insertions(+), 3 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
