From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  1 Apr 2016 22:25:28 +0200
Subject: [Buildroot] [PATCH 0/4 v2] core/download: add support for git
	sub-modules (branch yem/git)
Message-ID: <cover.1459541702.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This little series adds support for packages coming from a git clone,
with git sub-modules.

The commit logs are pretty detailed, but roughly, it goes as thus;

  - we can't get sub-modules in a bare clone, so we no longer use bare
    clones, but use full clones (with a working copy);

  - git-archive does not support submodules, so we generate archives
    manually;

  - we check out the working copy to the correct cset, then we retrieve
    the submodules;

  - we expose a new package variable to request sub-modules.


Changes v1 -> v2:
  - properly accept -r in the download wrapper  (Aleksandar)
  - split the non-bare-git and manual-archive changes in two separate
    patches, as they are not semantically related
  - some of my usual typoes fixed...


Regards,
Yann E. MORIN.


The following changes since commit 2cd5abf7f9edd3c0a609e9626f12f71e2a6e4e7c:

  alsa-utils: bump to version 1.1.1 (2016-04-01 03:57:54 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/git

for you to fetch changes up to 8373904cdf1fee9724d6834b56efaa706a92fc31:

  core/pkg-infra: download git submodules if the package wants them (2016-04-01 22:12:08 +0200)

----------------------------------------------------------------
Yann E. MORIN (4):
      support/download/git: do not use bare clones
      support/download/git: do not use git archive, handle it manually
      support/download/git: add support for submodules
      core/pkg-infra: download git submodules if the package wants them

 package/pkg-download.mk     |  1 +
 package/pkg-generic.mk      |  8 ++++++++
 support/download/dl-wrapper |  7 ++++---
 support/download/git        | 46 +++++++++++++++++++++++++++++++++++++++------
 4 files changed, 53 insertions(+), 9 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
