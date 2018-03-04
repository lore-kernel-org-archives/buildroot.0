From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Mar 2018 18:06:14 +0100
Subject: [Buildroot] [PATCH 0/3] package/systemd: unbreak a few stuf..
Message-ID: <cover.1520183159.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series, starting with a patch from Trent, is an attempt to fix
most of the known systemd issues, especially with respect to the DBus
socket location and the rest of the factory stuff.

It should supersed all the previous attempts.

Some work is probably still needed to clean up all the mess. The most
important issue left over is that the /var state might be inconsistent,
should the filesystem generation fails (e.g. too-small a read-only
ext2 filesystem is attempted). This would be fixed by my other series
about the handling of filesystems...

At least, this is probably just enough for the release.


Regards,
Yann E. MORIN.


The following changes since commit b1aa2148b0365776a17af3d8e22edd3622d475e4

  core: drop no-longer used C.UTF-8 locale option (2018-03-04 11:59:16 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 12fe4b30ba04733e7c58451fd2e44ca796465db2

  support/tests: enhance the runtime systemd tests (2018-03-04 17:57:13 +0100)


----------------------------------------------------------------
Trent Piepho (1):
      package/skeleton-init-systemd: work around for /var/lib not populating

Yann E. MORIN (2):
      package/skeleton-systemd: invert factory logic
      support/tests: enhance the runtime systemd tests

 package/skeleton-init-systemd/skeleton-init-systemd.mk | 17 ++++++++++-------
 support/testing/tests/init/test_systemd.py             | 12 ++++++++++++
 2 files changed, 22 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
