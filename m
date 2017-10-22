From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Oct 2017 17:15:30 +0200
Subject: [Buildroot] [PATCH 0/4 v2] core/pkg-generic: store package<->files
	for staging and host
Message-ID: <cover.1508685316.git.yann.morin.1998@free.fr>
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
Changes v1 -> v2:
  - split in three patches
  - in addition to staging, also store for host
  - report files touched by more than one package


Regards,
Yann E. MORIN.


The following changes since commit c2aa34d8cede20d4c8701f20ade9a016fb478b87

  CHANGES: update after netsnmp changes (2017-10-22 16:46:33 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 64a5b7666e47d87d58845028f9576ab68a186f44

  core: check files are nto touched by more than on package (2017-10-22 16:55:40 +0200)


----------------------------------------------------------------
Yann E. MORIN (4):
      core/pkg-generic: remove intermediate file-list files
      core/pkg-generic: redirect only when listing package's installed files
      core/pkg-generic: store file->package list for staging and host too
      core: check files are nto touched by more than on package

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
