From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:19:56 +0100
Subject: [Buildroot] [PATCH 0/6] linux: build host perf (branch
	yem/linux-host-perf)
Message-ID: <cover.1457720152.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This short series make it possible to build a host perf.

When run on the target, perf may generate raw dumps. Those dumps are to
be parsed by perf itself to gfenerate proper reports; this can (and
should probably) be done off-line ona fast machine, rather than on the
target.

First, we apply a number of fixes to the perf linux tool:
  - really do not build the documentation
  - honour the number of parallel jobs
  - really disable unavailable features
  - conditioanlly add support for gz and xz

Then, we build perf for the target in an empty directory, rather than
in-place, so that we do not mix the target .o files with the host .o
files.

Finally, we do build the host perf, alsao in its own directory.

Regards,
Yann E. MORIN.


The following changes since commit 0b7b84310c3781c346eea4c114c8cb4e97bbd8ea:

  olimex_imx233_olinuxino_defconfig: genimage support (2016-03-11 13:14:54 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/linux-host-perf

for you to fetch changes up to b5f50fa3c517ddd37dbf339c011f6bf0621f55ac:

  linux/perf: build the host perf tool (2016-03-11 18:11:58 +0100)

----------------------------------------------------------------
Yann E. MORIN (6):
      linux/perf: really do not build the documentation
      linux/perf: honour the number of parallel jobs
      linux/perf: forcefully disable the features with missing dependencies
      linux/perf: conditionally enable support for gz/xz compression
      linux/perf: build in a sub-directory
      linux/perf: build the host perf tool

 linux/Config.tools.in    |  4 +++
 linux/linux-tool-perf.mk | 93 ++++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 87 insertions(+), 10 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
