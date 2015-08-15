From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Aug 2015 11:26:35 +0200
Subject: [Buildroot] [PATCH 0/2] package/protobuf: misc fixes (branch
	yem/protobuf)
Message-ID: <cover.1439630677.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series fixes two things wrt protobuf:

  - remove a false comment in protobuf-c, implying that there was a
    dependency on protobuf, which is wrong,

  - make protobuf depend on shared libs to fix an idiosyncracy of the
    autoconf macro that checks for threads and forcibly wants to link it
    shared, always.

Regards,
Yann E. MORIN.


The following changes since commit 15a53b93a034af78c1a3d62510a2abe5a91e4f8f:

  fs/common: add <fs>_POST_GEN_HOOKS support (2015-08-10 20:56:05 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/protobuf

for you to fetch changes up to 4e2deeada0d857331dc2346098344403bf3fbc4c:

  package/protobuf: needs dynamix libraries (2015-08-15 11:17:56 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/protobuf-c: threads dependency is a direct dependency
      package/protobuf: needs dynamix libraries

 package/mosh/Config.in       | 7 ++++---
 package/ola/Config.in        | 6 ++++--
 package/protobuf-c/Config.in | 2 +-
 package/protobuf/Config.in   | 6 ++++--
 4 files changed, 13 insertions(+), 8 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
