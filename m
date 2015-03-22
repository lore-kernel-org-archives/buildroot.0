From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2015 16:21:02 +0100
Subject: [Buildroot] [PATCH 0/7 v3] support/download: be more aggressive on
	missing hashes (branch yem/dl-hash-2)
Message-ID: <cover.1427037564.git.yann.morin.1998@free.fr>
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


Changes v2 -> v3:
  - further differentiat hash check errors  (Arnout)
  - add 'none' hash type  (Arnout)
  - further improve the manual  (Arnout)

Changes v1 -> v2:
  - make it work for downloads from git/svn/... repositories


Regards,
Yann E. MORIN.


The following changes since commit e16796942a6f68391e69961e5045ce20b56063e2:

  attr: backport upstream patches to fix build on musl (2015-03-21 10:13:51 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/dl-hash-2

for you to fetch changes up to a30751a9b30f9cc2b22bacffa659ef311622e180:

  support/download: warn when there's no .hash file (2015-03-22 15:40:05 +0100)

----------------------------------------------------------------
Yann E. MORIN (7):
      support/download: make hash file optional
      package infra: do not check hashes when downloading from a repository
      support/download: add explicit no-hash support
      support/download: return different exit codes for different failures
      support/download: properly catch missing hashes
      support/download: always fail when there's no hash
      support/download: warn when there's no .hash file

 docs/manual/adding-packages-directory.txt | 27 +++++++++++++++++++++------
 package/pkg-download.mk                   |  5 -----
 support/download/check-hash               | 26 +++++++++++++++++---------
 support/download/dl-wrapper               | 14 ++++++++++----
 4 files changed, 48 insertions(+), 24 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
