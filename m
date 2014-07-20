From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Jul 2014 00:42:22 +0200
Subject: [Buildroot] [PATCH 0/9 v3] Cleanups in download helpers (branch
	yem/check-downloads)
Message-ID: <cover.1405895896.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a follow-up to the previous download series. Following
the advice from Arnout, I introduced a wrapper script that is responsible
for the saving atomically in BR2_DL_DIR. If also manages all the temporary
files, and properly cleans up.

Consequently, the helpers are now nuch more simple, and no longer need to
duplicate the complex handling of atomicity in BR2_DL_DIR, nor do they
need to manage temporary files.


Changes v2 -> v3:
  - complete rewrite of the series


Regards,
Yann E. MORIN.


The following changes since commit 89611dc08f53e62020cd54b070759557dbfc0f54:

  qt5base: allow selection of OpenGL API (2014-07-20 11:57:45 +0200)

are available in the git repository at:

  git://ymorin.is-a-geek.org/buildroot yem/check-downloads

for you to fetch changes up to 28d4112e90481daf555b3c3703166f9e47887c12:

  support/download: convert wget to use the wrapper (2014-07-21 00:34:22 +0200)

----------------------------------------------------------------
Yann E. MORIN (9):
      support/download: add download wrapper
      support/download: convert bzr to use the wrapper
      support/download: convert localfiles to use the wrapper
      support/download: convert cvs to use the wrapper
      support/download: convert git to use the wrapper
      support/download: convert Hg to use the wrapper
      support/download: convert scp to use the wrapper
      support/download: convert svn to use the wrapper
      support/download: convert wget to use the wrapper

 package/pkg-download.mk  | 44 +++++++++++++--------
 support/download/bzr     | 36 ++++--------------
 support/download/cp      | 20 +++-------
 support/download/cvs     | 50 +++++++-----------------
 support/download/git     | 58 +++++++++-------------------
 support/download/hg      | 48 +++++++----------------
 support/download/scp     | 24 +++---------
 support/download/svn     | 44 ++++++---------------
 support/download/wget    | 31 +++------------
 support/download/wrapper | 99 ++++++++++++++++++++++++++++++++++++++++++++++++
 10 files changed, 209 insertions(+), 245 deletions(-)
 create mode 100755 support/download/wrapper

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
