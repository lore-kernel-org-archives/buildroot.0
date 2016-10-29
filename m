From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Oct 2016 10:26:38 +0200
Subject: [Buildroot] [PATCH 0/2] fs: fix fakeroot issue with SElinux contexts
Message-ID: <cover.1477729581.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an attempt at fixing fakeroot, which has issues with
SElinux contexts (in extended attributes), as reported as one of our
bug report, but also reported in Fedora Core and Debian:
    https://bugzilla.redhat.com/show_bug.cgi?id=1238802
    https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=799858

Since there has been absolutely no activity on the upstream (== Debian)
report since it was filled more than a year ago, follow the path
suggested in the FC report, and switch to using pseudo as a replacement
for fakeroot.

This can probably go in right now. If there are issues, we can still
revert this before the end of the stabilisation month.


Regards,
Yann E. MORIN.


The following changes since commit 566858f6a1d65dda466942e4c84e40e3ce95e06f

  package/libglob: fix license typo (2016-10-28 15:17:43 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to d21df0f20a6f45cf718263e40037bedb390064bf

  fs: use pseudo instead of fakeroot (2016-10-29 10:19:35 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/pseudo: new package
      fs: use pseudo instead of fakeroot

 fs/common.mk               |  4 ++--
 package/pseudo/pseudo.hash |  2 ++
 package/pseudo/pseudo.mk   | 15 +++++++++++++++
 3 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 package/pseudo/pseudo.hash
 create mode 100644 package/pseudo/pseudo.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
