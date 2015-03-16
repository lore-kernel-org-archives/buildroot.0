From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 23:41:41 +0100
Subject: [Buildroot] [PATCH 0/3] support/download: be more aggressive on
	missing hashes (branch yem/dl-hash)
Message-ID: <cover.1426545571.git.yann.morin.1998@free.fr>
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

Regards,
Yann E. MORIN.


The following changes since commit 2d05afa42792193fa392c9f5417e8effc73d1e38:

  cups: deprecate package due to security issues (2015-03-16 22:26:30 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/dl-hash

for you to fetch changes up to e443dfcec4c084f823c718aa4c7740eddb3b628e:

  support/download: always fail when there's no hash (2015-03-16 23:33:48 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      support/download: return different exit codes for different failures
      support/download: properly catch missing hashes
      support/download: always fail when there's no hash

 support/download/check-hash | 15 +++++++++------
 support/download/dl-wrapper | 11 ++++++++++-
 2 files changed, 19 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
