From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Jun 2017 23:50:07 +0200
Subject: [Buildroot] [PATCH 0/8 v3] tools: add a directory to contain
	usefull user-facing tools
Message-ID: <cover.1498859395.git.yann.morin.1998@free.fr>
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

The first patch in the series introduces a new utility, brmake, a
wrapper around make that stores all the output to a log file and
displays only the >>> lines.

The second and subsequent patches each move a few user-facing utilities
out of support/scripts/ and into tools/ .

Changes v2 -> v3:
  - rename readme file  (Arnout, Thomas)
  - fix DEVELOPPERS  (Ricardo)

Changes v1 -> v2:
  - rename contrib -> tools  (Arnout)
  - move more scripts


Regards,
Yann E. MORIN.


The following changes since commit 87d0964e0b815d39b140be8ee5cd322d6714ee14

  libva-intel-driver: bump version to 1.8.3 (2017-06-28 23:29:21 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 1b7714308bccb32916cf2a41590894d59a58c6e1

  tools move xorg-release out of support/scripts/ (2017-06-30 17:56:58 +0200)


----------------------------------------------------------------
Yann E. MORIN (8):
      tools: add a directory to store some useful user-facing tools
      tools: move test-pkg out of support/scripts
      tools: move get-developers out of support/scripts/
      tools: move check-package out of support/scripts/
      tools: move size-stat-compare out of support/scripts/
      tools: move scancpan out of support/scripts/
      tools: move scanpypi out of support/scripts/
      tools move xorg-release out of support/scripts/

 DEVELOPERS                                         |   3 +-
 docs/manual/adding-packages-tips.txt               |  12 +-
 docs/manual/contribute.txt                         |   2 +-
 docs/manual/writing-rules.txt                      |   5 +-
 support/scripts/check-package                      | 145 +---
 support/scripts/get-developers                     |  84 +-
 support/scripts/pkg-stats                          |   2 +-
 support/scripts/scancpan                           | 859 +--------------------
 support/scripts/scanpypi                           | 654 +---------------
 support/scripts/size-stats-compare                 | 128 +--
 support/scripts/test-pkg                           | 198 +----
 support/scripts/xorg-release                       | 181 +----
 tools/brmake                                       |  62 ++
 {support/scripts => tools}/check-package           |   2 +-
 .../scripts => tools}/checkpackagelib/__init__.py  |   0
 {support/scripts => tools}/checkpackagelib/base.py |   2 +-
 {support/scripts => tools}/checkpackagelib/lib.py  |   2 +-
 .../checkpackagelib/lib_config.py                  |   2 +-
 .../scripts => tools}/checkpackagelib/lib_hash.py  |   2 +-
 .../scripts => tools}/checkpackagelib/lib_mk.py    |   2 +-
 .../scripts => tools}/checkpackagelib/lib_patch.py |   2 +-
 .../scripts => tools}/checkpackagelib/readme.txt   |  10 +-
 {support/scripts => tools}/get-developers          |   0
 {support/scripts => tools}/getdeveloperlib.py      |   0
 tools/readme.txt                                   |  40 +
 {support/scripts => tools}/scancpan                |   0
 {support/scripts => tools}/scanpypi                |   0
 {support/scripts => tools}/size-stats-compare      |   0
 {support/scripts => tools}/test-pkg                |   0
 {support/scripts => tools}/xorg-release            |   0
 30 files changed, 134 insertions(+), 2265 deletions(-)
 mode change 100755 => 120000 support/scripts/check-package
 mode change 100755 => 120000 support/scripts/get-developers
 mode change 100755 => 120000 support/scripts/scancpan
 mode change 100755 => 120000 support/scripts/scanpypi
 mode change 100755 => 120000 support/scripts/size-stats-compare
 mode change 100755 => 120000 support/scripts/test-pkg
 mode change 100755 => 120000 support/scripts/xorg-release
 create mode 100755 tools/brmake
 copy {support/scripts => tools}/check-package (98%)
 rename {support/scripts => tools}/checkpackagelib/__init__.py (100%)
 rename {support/scripts => tools}/checkpackagelib/base.py (78%)
 rename {support/scripts => tools}/checkpackagelib/lib.py (95%)
 rename {support/scripts => tools}/checkpackagelib/lib_config.py (98%)
 rename {support/scripts => tools}/checkpackagelib/lib_hash.py (96%)
 rename {support/scripts => tools}/checkpackagelib/lib_mk.py (99%)
 rename {support/scripts => tools}/checkpackagelib/lib_patch.py (96%)
 rename {support/scripts => tools}/checkpackagelib/readme.txt (91%)
 copy {support/scripts => tools}/get-developers (100%)
 rename {support/scripts => tools}/getdeveloperlib.py (100%)
 create mode 100644 tools/readme.txt
 copy {support/scripts => tools}/scancpan (100%)
 copy {support/scripts => tools}/scanpypi (100%)
 copy {support/scripts => tools}/size-stats-compare (100%)
 copy {support/scripts => tools}/test-pkg (100%)
 copy {support/scripts => tools}/xorg-release (100%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
