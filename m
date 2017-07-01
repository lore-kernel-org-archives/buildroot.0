From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Jul 2017 16:31:03 +0200
Subject: [Buildroot] [PATCH 0/7 v4] tools: add a directory to contain
	usefull user-facing tools
Message-ID: <cover.1498919458.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Currently, we provide a few user-facing utilities, like get-developers,
in support/scripts/ . But this directory also contains internal scripts
that a user should not be directly concerned with. Besides, it is
two-level deep in the hierarchy, which is not really nice.

So, we introduce tools/ as a top-level directory, with the goal to store
and expose all user-facing utilities, while keeping our internal scripts
in support/scripts/ .

The last patch in the series introduces a new utility, brmake, a wrapper
around make that stores all the output to a log file and displays only
the >>> lines.

Changes v3 -> v4:
  - drop legacy symlinks  (Thomas)
  - reorder series  (Thomas, Arnout)
  - drop options parsing in brmake  (Arnout, Samuel)
  - drop moving xorg-release  (Thomas)

Changes v2 -> v3:
  - rename readme file  (Arnout, Thomas)
  - fix DEVELOPPERS  (Ricardo)

Changes v1 -> v2:
  - rename contrib -> tools  (Arnout)
  - move more scripts


Regards,
Yann E. MORIN.


The following changes since commit 9bb306bd6411071cd07529923b825627502c794d

  support/testing: large timeout for login prompt (2017-07-01 16:05:14 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 99c3ef336521def728a1e5d80da5d7de7fd3fac1

  tools: new tool to filter the output of make (2017-07-01 16:26:12 +0200)


----------------------------------------------------------------
Yann E. MORIN (7):
      tools: move test-pkg out of support/scripts
      tools: move get-developers out of support/scripts/
      tools: move check-package out of support/scripts/
      tools: move size-stat-compare out of support/scripts/
      tools: move scancpan out of support/scripts/
      tools: move scanpypi out of support/scripts/
      tools: new tool to filter the output of make

 DEVELOPERS                                         |  3 +-
 docs/manual/adding-packages-tips.txt               | 12 +++----
 docs/manual/contribute.txt                         |  2 +-
 docs/manual/writing-rules.txt                      |  5 +--
 support/scripts/pkg-stats                          |  2 +-
 tools/brmake                                       | 37 ++++++++++++++++++++
 {support/scripts => tools}/check-package           |  2 +-
 .../scripts => tools}/checkpackagelib/__init__.py  |  0
 {support/scripts => tools}/checkpackagelib/base.py |  2 +-
 {support/scripts => tools}/checkpackagelib/lib.py  |  2 +-
 .../checkpackagelib/lib_config.py                  |  2 +-
 .../scripts => tools}/checkpackagelib/lib_hash.py  |  2 +-
 .../scripts => tools}/checkpackagelib/lib_mk.py    |  2 +-
 .../scripts => tools}/checkpackagelib/lib_patch.py |  2 +-
 .../scripts => tools}/checkpackagelib/readme.txt   | 10 +++---
 {support/scripts => tools}/get-developers          |  0
 {support/scripts => tools}/getdeveloperlib.py      |  0
 tools/readme.txt                                   | 40 ++++++++++++++++++++++
 {support/scripts => tools}/scancpan                |  0
 {support/scripts => tools}/scanpypi                |  0
 {support/scripts => tools}/size-stats-compare      |  0
 {support/scripts => tools}/test-pkg                |  0
 22 files changed, 102 insertions(+), 23 deletions(-)
 create mode 100755 tools/brmake
 rename {support/scripts => tools}/check-package (98%)
 rename {support/scripts => tools}/checkpackagelib/__init__.py (100%)
 rename {support/scripts => tools}/checkpackagelib/base.py (78%)
 rename {support/scripts => tools}/checkpackagelib/lib.py (95%)
 rename {support/scripts => tools}/checkpackagelib/lib_config.py (98%)
 rename {support/scripts => tools}/checkpackagelib/lib_hash.py (96%)
 rename {support/scripts => tools}/checkpackagelib/lib_mk.py (99%)
 rename {support/scripts => tools}/checkpackagelib/lib_patch.py (96%)
 rename {support/scripts => tools}/checkpackagelib/readme.txt (91%)
 rename {support/scripts => tools}/get-developers (100%)
 rename {support/scripts => tools}/getdeveloperlib.py (100%)
 create mode 100644 tools/readme.txt
 rename {support/scripts => tools}/scancpan (100%)
 rename {support/scripts => tools}/scanpypi (100%)
 rename {support/scripts => tools}/size-stats-compare (100%)
 rename {support/scripts => tools}/test-pkg (100%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
