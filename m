From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Jul 2014 23:27:12 +0200
Subject: [Buildroot] [PATCH 0/5] Cleanups in download helpers (branch
	yem/check-downloads)
Message-ID: <cover.1404681878.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a follow-up to the previous download series, and brings in:
  - a fix for the bzr helper
  - fixes a potential race in parallel downloads
  - simplifies the localfiles helper
  - post-pones creating temp files/dirs only at the point they are needed
  - cleanups and rationalises the naming of temp files/dirs

Regards,
Yann E. MORIN.


The following changes since commit ea0f52fc3fca5e5ba3ea5cd46033df2f53e9b5a5:

  pkg-infra: do the package install before installing init files (2014-07-06 22:25:24 +0200)

are available in the git repository at:

  git://ymorin.is-a-geek.org/buildroot yem/check-downloads

for you to fetch changes up to 68fe3038dcc98bd803b0fe01a3d26cf95be97d4b:

  support/download: rationalise naming and use of the temporary files (2014-07-06 23:15:36 +0200)

----------------------------------------------------------------
Yann E. MORIN (5):
      support/download: fix the bzr helper
      support/download: properly use temp files
      support/download: simplify the local-files helper
      support/download: only create final temp file when needed
      support/download: rationalise naming and use of the temporary files

 Config.in               |  4 ----
 Config.in.legacy        | 11 +++++++++++
 package/pkg-download.mk |  1 -
 support/download/bzr    |  9 ++++-----
 support/download/cp     |  6 ++++--
 support/download/cvs    | 21 ++++++++++++---------
 support/download/git    | 17 ++++++++---------
 support/download/hg     | 11 +++--------
 support/download/scp    |  8 +++++---
 support/download/svn    | 14 +++++---------
 support/download/wget   |  7 +++----
 11 files changed, 55 insertions(+), 54 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
