From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:32:04 +0100
Subject: [Buildroot] [pull request] core/download: add support for git
	sub-modules
Message-ID: <cover.1457721001.git.yann.morin.1998@free.fr>
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
    clones, but use full clones (with a working copy)

  - we enhance the git download wrapper to retrieve sub-modules if
    needed,

  - we expose a new package variable to request sub-modules.

Regards,
Yann E. MORIN.


The following changes since commit 0b7b84310c3781c346eea4c114c8cb4e97bbd8ea:

  olimex_imx233_olinuxino_defconfig: genimage support (2016-03-11 13:14:54 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/git

for you to fetch changes up to 8386db648bd2fde9ca492c57b2b92c09cdcfa18d:

  core/pkg-infra: downlaod git submodules if the package wants them (2016-03-11 19:28:45 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      support/download/git: do not use bare clones
      support/download/git: add support for submodules
      core/pkg-infra: downlaod git submodules if the package wants them

 package/pkg-download.mk |  1 +
 package/pkg-generic.mk  |  8 ++++++++
 support/download/git    | 46 ++++++++++++++++++++++++++++++++++++++++------
 3 files changed, 49 insertions(+), 6 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
