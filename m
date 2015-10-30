From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Oct 2015 16:43:37 +0100
Subject: [Buildroot] [pull request] package/dvblast: fix autobuild failures
Message-ID: <cover.1446219805.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes the four types of build failures due to dvblast:
  - requires libiconv, even without locales
  - needs -lm because of -lev
  - needs threads
  - uses incorrect integer types

Regards,
Yann E. MORIN.


The following changes since commit 9cadddd0a85abdad5de799359f4ff9849d4731f2:

  libv4l: bump version to 1.8.1 (2015-10-29 20:06:33 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/autobuild

for you to fetch changes up to a138be83167445a8f88e8b028725cf6a48d45b37:

  package/dvblast: fix musl build (2015-10-30 16:42:50 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      package/dvblast: needs iconv always
      package/dvblast: fix static linking
      package/dvblast: needs threads
      package/dvblast: fix musl build

 package/dvblast/0001-missing-lm.patch    | 29 +++++++++++++++++++++++++++++
 package/dvblast/0002-fix-int-types.patch | 22 ++++++++++++++++++++++
 package/dvblast/Config.in                |  6 ++++++
 package/dvblast/dvblast.mk               | 11 +++++++++--
 4 files changed, 66 insertions(+), 2 deletions(-)
 create mode 100644 package/dvblast/0001-missing-lm.patch
 create mode 100644 package/dvblast/0002-fix-int-types.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
