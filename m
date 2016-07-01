From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  1 Jul 2016 11:01:16 +0200
Subject: [Buildroot] [PATCH 0/4 v3] core/download: add support for git
	sub-modules (branch yem/git)
Message-ID: <cover.1467363623.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This little series adds support for packages coming from a git clone,
with git sub-modules.

The commit logs are pretty detailed, but roughly, it goes as thus:

  - we can't get sub-modules in a bare clone, so we no longer use bare
    clones, but use full clones (with a working copy);

  - git-archive does not support submodules, so we generate archives
    manually;

  - we check out the working copy to the correct cset, then we retrieve
    the submodules;

  - we expose a new package variable to request sub-modules.


Changes v2 -> v3:
  - added reviewd-by and tested-by tags
  - typoes fixed
  - rebased

Changes v1 -> v2:
  - properly accept -r in the download wrapper  (Aleksandar)
  - split the non-bare-git and manual-archive changes in two separate
    patches, as they are not semantically related
  - some of my usual typoes fixed...


Regards,
Yann E. MORIN.


The following changes since commit a542d0fd55e961e3c5805f12bba490d3dcc15d33

  erlang: enable compilation on mipsel (2016-07-01 00:44:36 +0200)


are available in the git repository at:

  https://git.buildroot.org/~ymorin/git/buildroot

for you to fetch changes up to b9061693f4d7a2c7030190efd686c988c1278e43

  core/pkg-infra: download git submodules if the package wants them (2016-07-01 10:53:32 +0200)


----------------------------------------------------------------
Yann E. MORIN (4):
      support/download/git: do not use bare clones
      support/download/git: do not use git archive, handle it manually
      support/download/git: add support for submodules
      core/pkg-infra: download git submodules if the package wants them

 package/pkg-download.mk     |  1 +
 package/pkg-generic.mk      |  8 +++++++
 support/download/dl-wrapper |  7 ++++---
 support/download/git        | 51 ++++++++++++++++++++++++++++++++++++++-------
 4 files changed, 57 insertions(+), 10 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
