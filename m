From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Mar 2015 13:59:33 +0100
Subject: [Buildroot] [PATCH 0/5 v2] support/download: be more aggressive on
	missing hashes (branch yem/dl-hash)
Message-ID: <cover.1426597114.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series makes hashes mandatory when a .hash file exists.

Currently, we treat missing hashes as a mere warning. Unfortunately,
that often goes un-noticed by most users, and thus we get a lot of
package bumps that are missing the new hashes corresponding to the new
version.

We now make that a hard error, so users really notice something is
wrong.

Of course, if no .hash file exists, the behaviour is as yet unchanged.

Changes v1 -> v2:
  - make it work for downloads from git/svn/... repositories


Regards,
Yann E. MORIN.


The following changes since commit 2d05afa42792193fa392c9f5417e8effc73d1e38:

  cups: deprecate package due to security issues (2015-03-16 22:26:30 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/dl-hash

for you to fetch changes up to b9c42017c424fae04a5bae3d8a74c3b21de65370:

  support/download: always fail when there's no hash (2015-03-17 12:17:20 +0100)

----------------------------------------------------------------
Yann E. MORIN (5):
      support/download: make hash file optional
      package infra: do not check hashes when downloading from a repository
      support/download: return different exit codes for different failures
      support/download: properly catch missing hashes
      support/download: always fail when there's no hash

 docs/manual/adding-packages-directory.txt |  6 ++----
 package/pkg-download.mk                   |  5 -----
 support/download/check-hash               | 17 ++++++++++-------
 support/download/dl-wrapper               | 14 ++++++++++----
 4 files changed, 22 insertions(+), 20 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
