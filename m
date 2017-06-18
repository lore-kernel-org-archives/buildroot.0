From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jun 2017 16:01:40 +0200
Subject: [Buildroot] [PATCH 0/4 v2] tools: add a directory to contain
	usefull user-facing tools
Message-ID: <cover.1497794488.git.yann.morin.1998@free.fr>
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

Changes v1 -> v2:
  - rename contrib -> tools  (Arnout)
  - move more scripts


Regards,
Yann E. MORIN.


The following changes since commit 859764ac39c18c6aaabbb6a1a47f2fa2e5793044

  linux-headers: bump 4.{1, 4, 9, 11}.x series (2017-06-17 16:17:04 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to eb8cb9682d84d1f110044a1448f18ef95ad79e84

  tools: move check-package out of support/scripts/ (2017-06-17 21:09:20 +0200)


----------------------------------------------------------------
Yann E. MORIN (4):
      tools: add a directory to store some useful user-facing tools
      tools: move test-pkg out of support/scripts
      tools: move get-developers out of support/scripts/
      tools: move check-package out of support/scripts/

 docs/manual/adding-packages-tips.txt               |  12 +-
 docs/manual/contribute.txt                         |   2 +-
 docs/manual/writing-rules.txt                      |   5 +-
 support/scripts/check-package                      | 145 +--------------
 support/scripts/get-developers                     |  84 +--------
 support/scripts/pkg-stats                          |   2 +-
 support/scripts/test-pkg                           | 198 +--------------------
 tools/00-README.txt                                |  23 +++
 tools/brmake                                       |  37 ++++
 {support/scripts => tools}/check-package           |   2 +-
 .../scripts => tools}/checkpackagelib/__init__.py  |   0
 {support/scripts => tools}/checkpackagelib/base.py |   0
 {support/scripts => tools}/checkpackagelib/lib.py  |   0
 .../checkpackagelib/lib_config.py                  |   0
 .../scripts => tools}/checkpackagelib/lib_hash.py  |   0
 .../scripts => tools}/checkpackagelib/lib_mk.py    |   0
 .../scripts => tools}/checkpackagelib/lib_patch.py |   0
 .../scripts => tools}/checkpackagelib/readme.txt   |  10 +-
 {support/scripts => tools}/get-developers          |   0
 {support/scripts => tools}/getdeveloperlib.py      |   0
 {support/scripts => tools}/test-pkg                |   0
 21 files changed, 80 insertions(+), 440 deletions(-)
 mode change 100755 => 120000 support/scripts/check-package
 mode change 100755 => 120000 support/scripts/get-developers
 mode change 100755 => 120000 support/scripts/test-pkg
 create mode 100644 tools/00-README.txt
 create mode 100755 tools/brmake
 copy {support/scripts => tools}/check-package (98%)
 rename {support/scripts => tools}/checkpackagelib/__init__.py (100%)
 rename {support/scripts => tools}/checkpackagelib/base.py (100%)
 rename {support/scripts => tools}/checkpackagelib/lib.py (100%)
 rename {support/scripts => tools}/checkpackagelib/lib_config.py (100%)
 rename {support/scripts => tools}/checkpackagelib/lib_hash.py (100%)
 rename {support/scripts => tools}/checkpackagelib/lib_mk.py (100%)
 rename {support/scripts => tools}/checkpackagelib/lib_patch.py (100%)
 rename {support/scripts => tools}/checkpackagelib/readme.txt (91%)
 copy {support/scripts => tools}/get-developers (100%)
 rename {support/scripts => tools}/getdeveloperlib.py (100%)
 copy {support/scripts => tools}/test-pkg (100%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
