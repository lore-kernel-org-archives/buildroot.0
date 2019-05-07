From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 May 2019 22:52:26 +0200
Subject: [Buildroot] [PATCH 0/2 v3] support/scripts: use the new show-info
 to generate dependency graphs (branch yem/show-info-2)
Message-ID: <cover.1557262335.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

The dependency graphs currently use the show-depednency-tree rule, which
was introduced in this release cycle. But we now have a better and more
versatile rule, show-info, to provide the same (and more) information.

So, this series switches brpkg-utils to use show-info to grab the
dependency tree, and then removes the show-dependency-tree rule as it
was never part of a release.


Regards,
Yann E. MORIN.


The following changes since commit ce32fa6cc1decd07ced9f944e7ea6aa51dd0c49d

  package/go: bump version to 1.12.5 (2019-05-07 22:30:13 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to fc3002077beb3f48401c4280e5347f27f548b4a3

  core: remove show-dependency-tree (2019-05-07 22:51:00 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      support/scripts: use show-info to extract dependency graph
      core: remove show-dependency-tree

 Makefile                     |  4 ----
 fs/common.mk                 |  8 --------
 package/pkg-generic.mk       |  6 ------
 support/scripts/brpkgutil.py | 29 ++++++++++++++---------------
 4 files changed, 14 insertions(+), 33 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
