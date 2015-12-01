From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Dec 2015 23:19:02 +0100
Subject: [Buildroot] [PATCH 0/2 for 2015.11.x] rpath: fix fallout of
	check-host-rpath (branch yem/host-gawk)
Message-ID: <cover.1449008170.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series, intended for master *and* a 2015.11.x maitenance branch,
fixes two bugs related to the RPATH handling that we introduced in
2015.11.

The first is a trivial oversight in sanitising the host directory in the
check-host-rpath script.

The second is more complex. It simply disables optional features of our
host gawk when the user has gmp and mpfr or readline development files
installed on its host system.

See the second commit log, the topic is fully explained there, and is
not trivial to sumarise.


Regards,
Yann E. MORIN.


The following changes since commit 3f90e532ff48669873f682a4f0c3b6f0910cb2e9:

  Update for 2015.11 (2015-11-30 23:13:41 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/host-gawk

for you to fetch changes up to 9cd7b6bdd9790d4105829b278c0e6acba9f103f3:

  package/gawk: do not use readeline ormpfr in host variant (2015-12-01 22:56:50 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      support/check-host-rpath: remove trailing '/' in host dir
      package/gawk: do not use readeline ormpfr in host variant

 package/gawk/gawk.mk             | 4 +++-
 support/scripts/check-host-rpath | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
