From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  6 Sep 2016 16:29:11 +0200
Subject: [Buildroot] [PATCH 0/2 v3] linux/tools: move to their own package
	(branch yem/linux-tools)
Message-ID: <cover.1473171931.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series moves the Linux tools (cpupower, perf and selftests) our of
the linux package and into their own package.

As extensively explained in the commit log from the first patch, some
configurations are unbuildable, because they cause circular dependencies
in our Makefiles.

We fix that by moving the Linux tools to their own package.


Changes v2 -> v3:
  - don't symlink the Linux sources; just build in there
  - typoes

Changes v1 -> v2:
  - properly handle legacy


Regards,
Yann E. MORIN.


The following changes since commit e03cb2eb2edf73b79156e8f54c80d04dc0846e89

  libgtk3: fix typo (2016-09-05 23:36:04 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to bdadcf3de3e5617f0492d88329476963a06fad44

  docs/manual: update the linux tools section (2016-09-06 15:22:54 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      linux/tools: make it a real, separate package
      docs/manual: update the linux tools section

 Config.in.legacy                                   | 24 +++++++++++
 .../adding-packages-linux-kernel-spec-infra.txt    | 40 +++++++++---------
 linux/Config.in                                    |  2 +-
 linux/linux.mk                                     | 24 +----------
 .../linux-tools/Config.in                          | 14 +++++--
 .../linux-tools}/linux-tool-cpupower.mk            |  8 ++--
 {linux => package/linux-tools}/linux-tool-perf.mk  | 18 ++++----
 .../linux-tools}/linux-tool-selftests.mk           | 14 +++----
 package/linux-tools/linux-tools.mk                 | 48 ++++++++++++++++++++++
 9 files changed, 126 insertions(+), 66 deletions(-)
 rename linux/Config.tools.in => package/linux-tools/Config.in (83%)
 rename {linux => package/linux-tools}/linux-tool-cpupower.mk (79%)
 rename {linux => package/linux-tools}/linux-tool-perf.mk (84%)
 rename {linux => package/linux-tools}/linux-tool-selftests.mk (65%)
 create mode 100644 package/linux-tools/linux-tools.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
