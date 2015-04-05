From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Apr 2015 22:56:19 +0200
Subject: [Buildroot] [PATCH 0/4 v2] toolchain/external: do not fail on
	missing hash for custom downloaded toolchain (branch
	yem/dl-hash-toolchains)
Message-ID: <cover.1428267362.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series makes it so we can download custom external toolchains, and
still have mandatory checks of hashes.

It also fixes a slightly annoying warning message when downloading from
a repository.


Changes v1 -> v2:
  - fix a few typoes


Regards,
Yann E. MORIN.


The following changes since commit 6b0aea1b6cff5a9d3898e5a4eb1f79044b77ebed:

  python-coherence: fix legal-info (2015-04-05 21:28:15 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/dl-hash-toolchains

for you to fetch changes up to 43e395ce9736f82fb6574be4d9ddba48f242753e:

  support/download: do not warn about missing hash file for repositories (2015-04-05 22:53:38 +0200)

----------------------------------------------------------------
Yann E. MORIN (4):
      support/download: add possibility to not fail on missing hash
      toolchain/external: ignore missing hash for custom downloaded toolchain
      support/download: restore mandatory check of hashes
      support/download: do not warn about missing hash file for repositories

 package/pkg-download.mk                            |  4 ++++
 support/download/check-hash                        | 12 ++++++++++--
 toolchain/toolchain-external/toolchain-external.mk |  2 ++
 3 files changed, 16 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
