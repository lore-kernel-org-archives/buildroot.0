From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 19:40:42 +0200
Subject: [Buildroot] [PATCH 0/12 v6] Some download-related changes (branch
	yem/check-downloads)
Message-ID: <cover.1401644349.git.yann.morin.1998@free.fr>
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

  - Patches 3..8  : move download helpers to shell scripts, one
    such script for each download helper

  - Patch   9     : don't use DL_DIR as scratchpad for temporary VCS
    checkouts, since DL_DIR is a precious location

  - Patches 10.11 : check hashes of downloaded files, to ensure the
    files are genuine (with doc)

  - Patch   12    : add hashes for ca-certificates


Changes v5 -> v6:
  - ensure we can run multiple parallel downloads from different build
    dirs with the same BR2_DL_DIR  (Thomas)
  - also convert bzr
  - fix for stray failed downloads

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


The following changes since commit 27a5414804f7b8ab41101aad219ebef02d364bde:

  Merge branch 'next' (2014-06-01 09:58:54 +0200)

are available in the git repository at:


  git://gitorious.org/buildroot/buildroot.git yem/check-downloads

for you to fetch changes up to a4d10289e59a5422d0e4ad101a8e7d20469008a4:

  package/ca-certificates: add tarball's hashes (2014-06-01 19:28:30 +0200)

----------------------------------------------------------------
Yann E. MORIN (12):
      Makefile: add BR2_DL_DIR to EXTRA_ENV
      pkg-infra: also set PKGDIR for the download step
      pkg-infra: move the git download helper to a script
      pkg-infra: move the svn download helper to a script
      pkg-infra: move the cvs download helper to a script
      pkg-infra: move the hg download helper to a script
      pkg-infra: move the wget download helper to a script
      pkg-infra: move the bzr download helper to a script
      pkg-infra: don't use DL_DIR as scratchpad for temporary downloads
      pkg-infra: add possiblity to check downloaded files against known hashes
      manual: add documentation about packages' hashes
      package/ca-certificates: add tarball's hashes

 docs/manual/adding-packages-directory.txt    | 67 ++++++++++++++++++++++
 package/Makefile.in                          |  1 +
 package/ca-certificates/ca-certificates.hash |  3 +
 package/pkg-download.mk                      | 83 ++++++++++++----------------
 package/pkg-generic.mk                       |  1 +
 support/download/bzr                         | 37 +++++++++++++
 support/download/check-hash                  | 77 ++++++++++++++++++++++++++
 support/download/cvs                         | 40 ++++++++++++++
 support/download/git                         | 50 +++++++++++++++++
 support/download/hg                          | 38 +++++++++++++
 support/download/svn                         | 37 +++++++++++++
 support/download/wget                        | 32 +++++++++++
 12 files changed, 417 insertions(+), 49 deletions(-)
 create mode 100644 package/ca-certificates/ca-certificates.hash
 create mode 100755 support/download/bzr
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
