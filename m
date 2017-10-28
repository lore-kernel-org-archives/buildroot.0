From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Oct 2017 17:30:54 +0200
Subject: [Buildroot] [PATCH 0/4 v3] core/pkg-generic: store package<->files
	for staging and host
Message-ID: <cover.1509204637.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series does for staging and host as we do for target:
store the list of installed files and relate them to the package
that installed each.

In the end, it also reports files that are touched by more than one
package, for target, staging and host files.

---
Changes v2 -> v3:
  - make it python2 and python3 compatible  (Baruch)
  - typoes  (Peter S.)

Changes v1 -> v2:
  - split in three patches
  - in addition to staging, also store for host
  - report files touched by more than one package


Regards,
Yann E. MORIN.


The following changes since commit 5868ab5f22300e920474005e3ae4f78e0b210473

  package/util-linux: drop _VERSION_MINOR variable (2017-10-28 14:24:55 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to cd4d3c26158a9dc124b3ac584da2c61e004cbc8b

  core: check files are not touched by more than one package (2017-10-28 16:02:56 +0200)


----------------------------------------------------------------
Yann E. MORIN (4):
      core/pkg-generic: remove intermediate file-list files
      core/pkg-generic: redirect only when listing package's installed files
      core/pkg-generic: store file->package list for staging and host too
      core: check files are not touched by more than one package

 Makefile                            |  4 ++++
 package/pkg-generic.mk              | 45 ++++++++++++++++++++++++-------------
 support/scripts/check-uniq-files.py | 40 +++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+), 16 deletions(-)
 create mode 100755 support/scripts/check-uniq-files.py

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
