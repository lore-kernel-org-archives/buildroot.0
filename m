From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Aug 2014 19:53:38 +0200
Subject: [Buildroot] [PATCH 0/9 v4] Cleanups in download helpers (branch
	yem/check-downloads)
Message-ID: <cover.1407088287.git.yann.morin.1998@free.fr>
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

Changes v3 -> v4:
  - fix root-dir in bzr-generated archives  (Thomas DS)
  - enhance the usage comment in every hepers  (Thomas DS)
  - typoes  (Thomas DS)

Changes v2 -> v3:
  - complete rewrite of the series


Regards,
Yann E. MORIN.


The following changes since commit 01370132c10cb2d194042e08fefbc9cec8392c66:

  gst-fsl-plugins, libfslvpuwrap: add missing select (2014-08-03 14:47:03 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/check-downloads

for you to fetch changes up to d43ab6ef106a7a55948b533b22ad7215fc580c51:

  support/download: convert wget to use the wrapper (2014-08-03 19:49:55 +0200)

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

 package/pkg-download.mk  | 50 ++++++++++++++++--------
 support/download/bzr     | 42 ++++++--------------
 support/download/cp      | 26 ++++---------
 support/download/cvs     | 54 ++++++++------------------
 support/download/git     | 62 ++++++++++--------------------
 support/download/hg      | 52 ++++++++-----------------
 support/download/scp     | 28 ++++----------
 support/download/svn     | 48 +++++++----------------
 support/download/wget    | 35 ++++-------------
 support/download/wrapper | 99 ++++++++++++++++++++++++++++++++++++++++++++++++
 10 files changed, 234 insertions(+), 262 deletions(-)
 create mode 100755 support/download/wrapper

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
