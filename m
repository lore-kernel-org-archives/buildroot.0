From: Will Newton <will.newton@gmail.com>
Date: Fri, 25 Feb 2011 17:46:15 +0000
Subject: [Buildroot] [PATCH 0/8] Update GNU config support.
Message-ID: <AANLkTikOo9+wsqSNNLRPLJncArhW22BhXa6eV5Vu=QhU@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently use a version of config.sub that is nearly 4 years old
and a version of config.guess that is nearly 2 years old.

Since this package was last updated GNU config has merged a couple of
patches and moved to git. This means we cannot use cvs up to update
it any more, so we can get rid of all the files that were kept around
for that purpose.

Will Newton (8):
  gnuconfig: Remove old checkout of GNU config.
  gnuconfig: Remove GNU Hurd patch as it is no longer supported.
  gnuconfig: Remove gnuconfig patch as it has been merged upstream.
  gnuconfig: Remove sh patch.
  gnuconfig: Update config.{sub,guess} to 2011-02-02 version.
  gnuconfig: Update patches to apply to 2011-02-02 version.
  gnuconfig: Apply patches to config.{sub,guess}.
  gnuconfig: Update README.buildroot.

 package/gnuconfig/CVS/Entries                      |   14 -
 package/gnuconfig/CVS/Repository                   |    1 -
 package/gnuconfig/CVS/Root                         |    1 -
 package/gnuconfig/ChangeLog                        | 1996 --------------------
 package/gnuconfig/Makefile                         |   15 -
 package/gnuconfig/README.buildroot                 |    8 +-
 package/gnuconfig/config.guess                     |  458 +++---
 package/gnuconfig/config.sub                       |  219 ++-
 .../gnuconfig/patches/config.guess.uclibc.patch    |  137 +-
 .../patches/config.sub.gnuhurd-uclibc.patch        |   20 -
 package/gnuconfig/patches/config.sub.ps2.patch     |   19 +-
 package/gnuconfig/patches/config.sub.sh.patch      |   39 -
 package/gnuconfig/patches/config.xtensa.glob.patch |   44 -
 package/gnuconfig/testsuite/.cvsignore             |    1 -
 package/gnuconfig/testsuite/CVS/Entries            |    7 -
 package/gnuconfig/testsuite/CVS/Repository         |    1 -
 package/gnuconfig/testsuite/CVS/Root               |    1 -
 package/gnuconfig/testsuite/config-guess.data      |   34 -
 package/gnuconfig/testsuite/config-guess.sh        |   47 -
 package/gnuconfig/testsuite/config-sub.data        |  117 --
 package/gnuconfig/testsuite/config-sub.sh          |   35 -
 package/gnuconfig/testsuite/uname.in               |    9 -
 package/gnuconfig/uname                            |   11 -
 23 files changed, 455 insertions(+), 2779 deletions(-)
 delete mode 100644 package/gnuconfig/CVS/Entries
 delete mode 100644 package/gnuconfig/CVS/Repository
 delete mode 100644 package/gnuconfig/CVS/Root
 delete mode 100644 package/gnuconfig/ChangeLog
 delete mode 100644 package/gnuconfig/Makefile
 delete mode 100644 package/gnuconfig/patches/config.sub.gnuhurd-uclibc.patch
 delete mode 100644 package/gnuconfig/patches/config.sub.sh.patch
 delete mode 100644 package/gnuconfig/patches/config.xtensa.glob.patch
 delete mode 100644 package/gnuconfig/testsuite/.cvsignore
 delete mode 100644 package/gnuconfig/testsuite/CVS/Entries
 delete mode 100644 package/gnuconfig/testsuite/CVS/Repository
 delete mode 100644 package/gnuconfig/testsuite/CVS/Root
 delete mode 100644 package/gnuconfig/testsuite/config-guess.data
 delete mode 100644 package/gnuconfig/testsuite/config-guess.sh
 delete mode 100644 package/gnuconfig/testsuite/config-sub.data
 delete mode 100644 package/gnuconfig/testsuite/config-sub.sh
 delete mode 100755 package/gnuconfig/testsuite/uname.in
 delete mode 100755 package/gnuconfig/uname

-- 
1.7.3.4
