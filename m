From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Jun 2017 00:03:35 +0200
Subject: [Buildroot] [PATCH 0/5] core: check hashes of license files
Message-ID: <cover.1498428166.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series is a proposal to check the hashes of the license files
during legal-info, to catch the packages whose license changes but where
the text of the new license is in the same file.

This was suggested by Rahul recently:
    http://lists.busybox.net/pipermail/buildroot/2017-June/194425.html

Changes v1 -> v2:
  - call MESSAGE to display current package name  (Luca)
  - don't mention weak hashes  (Luca)
  - fix support script check-package  (Ricardo)


Regards,
Yann E. MORIN.


The following changes since commit 0672f3f2133294b6248af0740bb7bb78f97bccf6

  uboot-tools: drop unreferenced empty variable (2017-06-25 15:54:09 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 48ad498d1bf7e08c8120090942e711a1d2320c32

  docs/manual: document hashes for license files (2017-06-25 23:56:31 +0200)


----------------------------------------------------------------
Yann E. MORIN (5):
      support/check-package: don't check filenames of hashes
      core/pkg-generic: call MESSAGE when saving package legal-info
      core/pkg-util: pass package directory and name when saving license files
      core/pkg-utils: check hashes of license files
      docs/manual: document hashes for license files

 Makefile                                    |  2 +-
 docs/manual/adding-packages-directory.txt   | 15 +++++++++++++--
 package/pkg-generic.mk                      |  4 +++-
 package/pkg-utils.mk                        | 11 ++++++++---
 support/scripts/checkpackagelib/lib_hash.py | 16 ----------------
 5 files changed, 25 insertions(+), 23 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
