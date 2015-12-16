From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Dec 2015 22:44:26 +0100
Subject: [Buildroot] [pull request] package/gnmupg2: build fixes
Message-ID: <cover.1450302183.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes two build issues with gnupg2:
  - build failure with musl  (missing #include),
  - really not running tests in cross-compilation.

Regards,
Yann E. MORIN.


The following changes since commit 4cb010a5f1773d11c0dadcb3ac5ffa6e154fa113:

  package/libhdhomerun: new package (2015-12-16 22:11:33 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/gnupg2

for you to fetch changes up to c7dd2e8bb5db5e326a7a4e7cb3611b8a0eea0e68:

  package/gnupg2: really do not run tests in cross-compilation (2015-12-16 22:42:36 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/gnupg2: fix build with musl
      package/gnupg2: really do not run tests in cross-compilation

 .../0000-silence-git-when-not-in-git-tree.patch    | 26 +++++++++++++++
 package/gnupg2/0001-fix-pth-config-usage.patch     | 29 ++++++++--------
 package/gnupg2/0002-missing-include.patch          | 15 +++++++++
 package/gnupg2/0003-dont-run-tests.patch           | 39 ++++++++++++++++++++++
 package/gnupg2/gnupg2.mk                           |  4 +++
 5 files changed, 97 insertions(+), 16 deletions(-)
 create mode 100644 package/gnupg2/0000-silence-git-when-not-in-git-tree.patch
 create mode 100644 package/gnupg2/0002-missing-include.patch
 create mode 100644 package/gnupg2/0003-dont-run-tests.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
