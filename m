From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  7 Mar 2018 22:51:20 +0100
Subject: [Buildroot] [PATCH 0/2 v2] support/check-bin-arch: add support for
 excluding arbitrary locations
Message-ID: <cover.1520459473.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Users have started reporting issues with this check, when they have
local packages (mostly out-of-tree, proprietary) that install binary
blobs (like co-processor firmwares) in arbitrary locations, like
/opt, which we currently do not exclude from the check.

Changes v1 -> v2:
  - typoes and rephrasing  (Peter)
  - use of intermediate variable  (Thomas)
  - code-style  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit 13fb1c49128d4c039fc23fcf32317008862f8b4b

  configs/teliv_evk_pro3: remove defconfig (2018-03-07 22:37:51 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 9fe26c138652b171d9192c128713c3e6ce989d38

  support/check-bin-arch: exclude kernel modules for merged /usr (2018-03-07 22:45:01 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      spport/check-bin-arch: accept arbitrary ignore paths
      support/check-bin-arch: exclude kernel modules for merged /usr

 docs/manual/adding-packages-generic.txt |  7 ++++
 package/pkg-generic.mk                  |  1 +
 support/scripts/check-bin-arch          | 57 ++++++++++++++++++++-------------
 3 files changed, 43 insertions(+), 22 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
