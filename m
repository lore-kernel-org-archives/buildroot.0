From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 May 2014 14:01:43 +0200
Subject: [Buildroot] [PATCH 0/11 v5] Some download-related changes (branch
	yem/check-downloads)
Message-ID: <cover.1399204808.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series contains those download-related changes:

  - Patches 1..2  : preparatory patches for upcoming helper scripts and
    hash checks

  - Patches 3..7  : move download helpers to shell scripts, one
    such script for each download helper

  - Patch   8     : don't use DL_DIR as scratchpad for temporary VCS
    checkouts, since DL_DIR is a precious location

  - Patches 9..10 : check hashes of downloaded files, to ensure the
    files are genuine (with doc)

  - Patch   11    : add hashes for ca-certificates


Changes v4 -> v5:
  - update ca-certificates hashes after version bump
  - fix detection of comments and empty lines in .hash file
  - rebase on top of master

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


The following changes since commit dd5dbe627f4d66603e03ae2fdb09d4fe34d34dc7:

  clapack: new package (2014-05-04 09:10:55 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/check-downloads

for you to fetch changes up to d42a49d8ac95fcb36ce8e4d2ec566cc17e06c756:

  package/ca-certificates: add tarball's hashes (2014-05-04 13:55:23 +0200)

----------------------------------------------------------------
Yann E. MORIN (11):
      Makefile: add BR2_DL_DIR to EXTRA_ENV
      pkg-infra: also set PKGDIR for the download step
      pkg-infra: move the git download helper to a script
      pkg-infra: move the svn download helper to a script
      pkg-infra: move the cvs download helper to a script
      pkg-infra: move the hg download helper to a script
      pkg-infra: move the wget download helper to a script
      pkg-infra: don't use DL_DIR as scratchpad for temporary VCS checkouts
      pkg-infra: add possiblity to check downloaded files against known hashes
      manual: add documentation about packages' hashes
      package/ca-certificates: add tarball's hashes

 docs/manual/adding-packages-directory.txt    | 67 +++++++++++++++++++++++
 package/Makefile.in                          |  1 +
 package/ca-certificates/ca-certificates.hash |  3 ++
 package/pkg-download.mk                      | 79 +++++++++++-----------------
 package/pkg-generic.mk                       |  1 +
 support/download/check-hash                  | 77 +++++++++++++++++++++++++++
 support/download/cvs                         | 33 ++++++++++++
 support/download/git                         | 41 +++++++++++++++
 support/download/hg                          | 31 +++++++++++
 support/download/svn                         | 30 +++++++++++
 support/download/wget                        | 24 +++++++++
 11 files changed, 340 insertions(+), 47 deletions(-)
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
