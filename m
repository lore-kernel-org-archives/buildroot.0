From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 25 Feb 2013 22:31:20 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch for-master/doc
Message-ID: <cover.1361827174.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Here is the 2nd round of this doc series.

Changes v1 -> v2:
  - drop the patches 4/9 and 5/9 (adding faq entries about controversial topic,
  they will be handled later);
  - integrate the kconfiglib module in the Buildroot source tree
  - rework gen-manual-lists.py;
  - split doc patches (generator script, makefiles and generated files) in
  distinct patches (hope this will ease the review ;-));
  - integrate the patch from Stephan Hoffmann in this series.


The following changes since commit 9ef10c2cf302a6a45205c998e555dc80b0409884:

  linux-firmware: switch to http url (2013-02-25 19:26:19 +0100)

are available in the git repository at:

  git://github.com/tSed/buildroot.git for-master/doc

for you to fetch changes up to 72489a607185be4b7e1e443ef340fc28395a54a0:

  Manual: add empty line after header in .mk files (2013-02-25 21:52:42 +0100)

----------------------------------------------------------------
Samuel Martin (10):
      manual: fix cross-refs
      manual: minor fix in patch-policy.txt
      manual: misc. post-{build,image} scripts fixes
      working-with: board support
      support: add kconfiglib python module
      support/scripts: add gen-manual-lists.py
      manual: add a make target 'manual-update-lists'
      manual: cleanup appendix.txt
      Makefile: add to the release target a warning about the manual updates.
      manual: update generated lists

Stephan Hoffmann (1):
      Manual: add empty line after header in .mk files

 Makefile                                  |    2 +
 docs/manual/adding-packages-autotools.txt |   33 +-
 docs/manual/adding-packages-cmake.txt     |   33 +-
 docs/manual/adding-packages-generic.txt   |   83 +-
 docs/manual/appendix.txt                  |   29 +-
 docs/manual/configure.txt                 |    3 +
 docs/manual/customize-rootfs.txt          |   30 +-
 docs/manual/customize-store.txt           |    7 +-
 docs/manual/customize-toolchain.txt       |    2 +-
 docs/manual/deprecated-list.txt           |   79 +-
 docs/manual/host-package-list.txt         |   19 +
 docs/manual/manual.mk                     |    8 +-
 docs/manual/package-list.txt              |  930 +++++++
 docs/manual/patch-policy.txt              |   12 +-
 docs/manual/pkg-list.txt                  |  870 -------
 docs/manual/working-with.txt              |    3 +-
 support/pym/kconfiglib.py                 | 3772 +++++++++++++++++++++++++++++
 support/pym/readme                        |   14 +
 support/scripts/gen-manual-lists.py       |  336 +++
 19 files changed, 5250 insertions(+), 1015 deletions(-)
 create mode 100644 docs/manual/host-package-list.txt
 create mode 100644 docs/manual/package-list.txt
 delete mode 100644 docs/manual/pkg-list.txt
 create mode 100644 support/pym/kconfiglib.py
 create mode 100644 support/pym/readme
 create mode 100755 support/scripts/gen-manual-lists.py

Yours,
Samuel

--
