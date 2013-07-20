From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 20 Jul 2013 09:52:06 -0300
Subject: [Buildroot] [PATCH 0/9] Fix internal blackfin toolchain
Message-ID: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset fixes the internal blackfin toolchain build.
It's been broken for ages (never worked maybe?)
Testers wanted, it builds what's supposed to build but i lack hardware
to see if it really works.

Gustavo Zacarias (9):
  gcc/bfin: doesn't support --with-cpu defaults
  uclibc/bfin: only supports linuxthreads.old
  uclibc: make target utils optional
  gcc/bfin: 4.{6,7,8}.x are broken
  uclibc: use builtin startfiles target
  uclibc/bfin: set the appropiate binfmt in the configuration
  uclibc/bfin: don't install host utils if not FDPIC
  blackfin: set GNU_TARGET_NAME accordingly
  gcc/mudflap: disable for blackfin, it doesn't build

 package/Makefile.in        |  5 +++
 package/gcc/Config.in.host |  7 +++--
 package/gcc/gcc.mk         |  8 +++++
 package/uclibc/Config.in   | 15 ++++++++-
 package/uclibc/uclibc.mk   | 76 ++++++++++++++++++++++++++++++++++++++--------
 5 files changed, 95 insertions(+), 16 deletions(-)

--
1.8.1.5
