From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu, 18 Jul 2013 23:47:49 +0200
Subject: [Buildroot] [PATCH v2 0/3] Upgrade ARC port to new toolchain
Message-ID: <1374184072-6531-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These three patches upgrade the ARC toolchain to GCC 4.8 and
Binutils 2.23.2. This fixes multiple issues (including most
autobuilder failures from the past couple of weeks).

v2:
  * Remove gcc 4.4.7 patch
  * Fix whitespace in fix_branch_out_of_range.patch
  * Remove binutils 2.19-arc dependencies (not required anymore)
  * Fix gcc 4.8-arc dependencies (host-flex, host-bison still required :-( )

Mischa Jonker (3):
  uclibc, eglibc: remove REALLY_NOSTDLIB references
  arc: binutils: Go from 2.19-arc to 2.23.2-arc
  arc: gcc: Go from 4.4.7 to 4.8 for ARC

 .../binutils/2.19-arc/add-empty-info-files.patch   |   72 ----------
 package/binutils/Config.in.host                    |    2 +-
 package/binutils/binutils.mk                       |    4 -
 package/eglibc/eglibc.mk                           |    2 +-
 package/gcc/4.8-arc/100-uclibc-conf.patch          |   15 ++
 package/gcc/4.8-arc/301-missing-execinfo_h.patch   |   13 ++
 package/gcc/4.8-arc/302-c99-snprintf.patch         |   13 ++
 .../gcc/4.8-arc/305-libmudflap-susv3-legacy.patch  |   49 +++++++
 package/gcc/4.8-arc/disable_gc_sections.patch      |  145 ++++++++++++++++++++
 .../fix_branch_out_of_range.patch                  |    2 +-
 package/gcc/Config.in.host                         |   13 +-
 package/gcc/gcc.mk                                 |    2 +-
 package/uclibc/uclibc.mk                           |   11 +-
 13 files changed, 248 insertions(+), 95 deletions(-)
 delete mode 100644 package/binutils/2.19-arc/add-empty-info-files.patch
 create mode 100644 package/gcc/4.8-arc/100-uclibc-conf.patch
 create mode 100644 package/gcc/4.8-arc/301-missing-execinfo_h.patch
 create mode 100644 package/gcc/4.8-arc/302-c99-snprintf.patch
 create mode 100644 package/gcc/4.8-arc/305-libmudflap-susv3-legacy.patch
 create mode 100644 package/gcc/4.8-arc/disable_gc_sections.patch
 rename package/gcc/{4.4.7-arc => 4.8-arc}/fix_branch_out_of_range.patch (96%)

-- 
1.7.9.5
