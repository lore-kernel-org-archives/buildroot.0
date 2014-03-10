From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 21:51:40 +0100
Subject: [Buildroot] [PATCH 0/12 v4] Some download-related changes (branch
	yem/check-downloads)
Message-ID: <cover.1394484283.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series contains those download-related changes:

  - Patches 1..2  : some cleanups and preparatory works in the
    download infra,

  - Patches 3..7  : move download helpers to shell scripts, one
    such script for each download helper

  - Patch   8     : don't use DL_DIR as scratchpad for temporary VCS
    checkouts, since DL_DIR is a precious location

  - Patches 9..11 : check hashes of downloaded files, to ensure the
    files are genuine

  - Patch   12    : add hashes for ca-certificates


Changes v3 -> v4:
  - enhance the manual, typoes  (Gustavo, Samuel, Thomas DS)
  - remove spurious test bump on package/fis  (Samuel)

Changes v2 -> v3:
  - avoid partial downloads  (Thomas DS)
  - store hash-type in .hash file  (Gustavo)
  - typoes  (Samuel, Gustavo)
  - add possibility to treat missing hashes as an error

Changes v1 -> v2:
  - don't do any behavioural change when switching to shell scripts,
    just reproduce exactly what was in the Makefile  (Luca, Arnout)
  - support more than one hash algorithm  (Arnout, Gustavo)
  - typoes  (Luca, Baruch)


Regards,
Yann E. MORIN.


The following changes since commit ca4e9a78732bcacddd0c91ab35ee39a60ff040aa:

  jack2: fix missing alsa-lib feature dependency (2014-03-10 13:13:03 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/check-downloads

for you to fetch changes up to 985eb7379f1347835b44d685bbcef295fea730c5:

  package/ca-certificates: add tarball's hashes (2014-03-10 18:15:03 +0100)

----------------------------------------------------------------
Yann E. MORIN (12):
      Makefile: rename USER_HOOKS_EXTRA_ENV to EXTRA_ENV
      Makefile: add BR2_DL_DIR to EXTRA_ENV
      pkg-infra: move the git download helper to a script
      pkg-infra: move the svn download helper to a script
      pkg-infra: move the cvs download helper to a script
      pkg-infra: move the hg download helper to a script
      pkg-infra: move the wget download helper to a script
      pkg-infra: don't use DL_DIR as scratchpad for temporary VCS checkouts
      pkg-infra: also set PKGDIR for the download step
      pkg-infra: add possiblity to check downloaded files against known hashes
      manual: add documentation about packages' hashes
      package/ca-certificates: add tarball's hashes

 Makefile                                     |  4 +-
 docs/manual/adding-packages-directory.txt    | 67 +++++++++++++++++++++++
 package/Makefile.in                          |  5 +-
 package/ca-certificates/ca-certificates.hash |  3 ++
 package/pkg-download.mk                      | 79 +++++++++++-----------------
 package/pkg-generic.mk                       |  3 +-
 support/download/check-hash                  | 77 +++++++++++++++++++++++++++
 support/download/cvs                         | 33 ++++++++++++
 support/download/git                         | 41 +++++++++++++++
 support/download/hg                          | 31 +++++++++++
 support/download/svn                         | 30 +++++++++++
 support/download/wget                        | 24 +++++++++
 12 files changed, 345 insertions(+), 52 deletions(-)
 create mode 100644 package/ca-certificates/ca-certificates.hash
 create mode 100755 support/download/check-hash
 create mode 100755 support/download/cvs
 create mode 100755 support/download/git
 create mode 100755 support/download/hg
 create mode 100755 support/download/svn
 create mode 100755 support/download/wget

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
