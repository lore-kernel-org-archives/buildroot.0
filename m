From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jul 2014 23:44:34 +0200
Subject: [Buildroot] [PATCH 0/6 v2] Cleanups in download helpers (branch
	yem/check-downloads)
Message-ID: <cover.1404769268.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a follow-up to the previous download series, and brings in:
  - fixes the git and bzr helpers
  - fixes a potential race in parallel downloads
  - simplifies the localfiles helper
  - postpones creating temp files/dirs only at the point they are needed
  - cleanups and harmonises the naming of temp files/dirs


Changes v1 -> v2:
  - fix the git helper
  - add the git comment in a single patch
  - fix left-overs in the cvs helper
  - fix double-dot typo in scp helper
  - harmoise the svn and cvs helpers wrt. tar options


Regards,
Yann E. MORIN.


The following changes since commit 1473c8c4c819aa5b544eb2d9368c510ada3ec6c0:

  linux: bump default to version 3.15.4 (2014-07-07 19:44:52 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/check-downloads

for you to fetch changes up to b16d43fcd8082ce3444c04e8db2ef2e896b40834:

  support/download: rationalise naming and use of the temporary files (2014-07-07 22:08:06 +0200)

----------------------------------------------------------------
Yann E. MORIN (6):
      support/download: fix the bzr helper
      support/download: fix the git helper
      support/download: properly use temp files
      support/download: simplify the local-files helper
      support/download: only create final temp file when needed
      support/download: rationalise naming and use of the temporary files

 Config.in               |  4 ----
 Config.in.legacy        | 11 +++++++++++
 package/pkg-download.mk |  1 -
 support/download/bzr    |  9 ++++-----
 support/download/cp     |  6 ++++--
 support/download/cvs    | 19 +++++++++++--------
 support/download/git    | 26 ++++++++++++++------------
 support/download/hg     | 11 +++--------
 support/download/scp    |  8 +++++---
 support/download/svn    | 21 ++++++++++++---------
 support/download/wget   |  7 +++----
 11 files changed, 67 insertions(+), 56 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
