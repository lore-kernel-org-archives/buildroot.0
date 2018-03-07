From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  7 Mar 2018 21:27:15 +0100
Subject: [Buildroot] [PATCH 0/2] support/check-bin-arch: add support for
 excluding arbitrary locations
Message-ID: <cover.1520454419.git.yann.morin.1998@free.fr>
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


Regards,
Yann E. MORIN.


The following changes since commit 74295b02d4b380e5267357be0ae1281c7410cdc2

  ipset: bump to version 6.36 (2018-03-06 15:44:18 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to ce786b49c9bbe6a3e2ebde9ca28b56de86e68b2e

  support/check-bin-arch: exclude kernel modules for merged /usr (2018-03-07 21:17:11 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      spport/check-bin-arch: accept arbitrary ignore paths
      support/check-bin-arch: exclude kernel modules for merged /usr

 docs/manual/adding-packages-generic.txt |  7 ++++
 package/pkg-generic.mk                  |  1 +
 support/scripts/check-bin-arch          | 59 +++++++++++++++++++++------------
 3 files changed, 45 insertions(+), 22 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
