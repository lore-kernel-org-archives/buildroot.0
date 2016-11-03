From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Nov 2016 23:21:05 +0100
Subject: [Buildroot] [PATCH 0/4] core: fix pseudo,
	definitely get rid of fakeroot
Message-ID: <cover.1478211656.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series closes the migration from fakeroot to pseudo:
  - fix the buidl of pseudo, which needs sqlite3,
  - fix iso9660 to depend on pseudo, not fakeroot
  - add legacy fakeroot symlink to use pseudo
  - completely remove the fakeroot package


Regards,
Yann E. MORIN.


The following changes since commit eb71c22b0b0faa338c1f82f3e17ef12abadea1e8

  CHANGES: final update (2016-11-03 22:56:20 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 9db5c7acb037104ad296a1dc8d73ee7640417d3f

  package/fakeroot: remove (2016-11-03 23:16:20 +0100)


----------------------------------------------------------------
Yann E. MORIN (4):
      package/pseudo: needs sqlite
      fs/iso9660: use pseudo instead of fakeroot
      package/pseudo: add a legacy symlink to emulate fakeroot
      package/fakeroot: remove

 fs/iso9660/iso9660.mk                        |  2 +-
 package/fakeroot/0001-hide-dlsym-error.patch | 34 ----------------------------
 package/fakeroot/fakeroot.hash               |  4 ----
 package/fakeroot/fakeroot.mk                 | 20 ----------------
 package/pseudo/pseudo.mk                     | 10 ++++++++
 5 files changed, 11 insertions(+), 59 deletions(-)
 delete mode 100644 package/fakeroot/0001-hide-dlsym-error.patch
 delete mode 100644 package/fakeroot/fakeroot.hash
 delete mode 100644 package/fakeroot/fakeroot.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
