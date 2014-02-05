From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  5 Feb 2014 14:52:51 +0100
Subject: [Buildroot] [pkg-perl infra V4 0/9] a package infrastructure for
	Perl/CPAN modules
Message-ID: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Full refactor after the review at BR developer days.

 - new convention : package/perl-<pkgname> instead of package/cpan/lib<pkgname>-perl

Francois Perrad (9):
  pkg-perl: refactor and rename PERL5LIB
  pkg-perl: new infrastructure
  scancpan: a new script
  host-perl-xml-parser: rename and refactor with perl infrastructure
  host-perl-module-build: new package
  perl: remove useless patch
  manual: adding packages perl
  cpanminus: remove it
  qemu: add a Config.in.host

 Config.in                                        |   10 +
 docs/manual/adding-packages-perl.txt             |  110 ++++
 docs/manual/adding-packages.txt                  |    2 +
 package/Config.in                                |    2 -
 package/Config.in.host                           |    1 +
 package/Makefile.in                              |   13 +-
 package/cpanminus/Config.in                      |   40 --
 package/cpanminus/cpanminus.mk                   |   47 --
 package/intltool/intltool.mk                     |    5 +-
 package/libxml-parser-perl/Config.in             |   10 -
 package/libxml-parser-perl/libxml-parser-perl.mk |   35 --
 package/metacity/metacity.mk                     |    2 +-
 package/perl-module-build/perl-module-build.mk   |   12 +
 package/perl-xml-parser/perl-xml-parser.mk       |   16 +
 package/perl/perl-fix-Module-Build.patch         |   16 -
 package/pkg-perl.mk                              |  198 ++++++
 package/qemu/Config.in.host                      |   10 +
 support/scripts/scancpan                         |  694 ++++++++++++++++++++++
 18 files changed, 1065 insertions(+), 158 deletions(-)
 create mode 100644 docs/manual/adding-packages-perl.txt
 delete mode 100644 package/cpanminus/Config.in
 delete mode 100644 package/cpanminus/cpanminus.mk
 delete mode 100644 package/libxml-parser-perl/Config.in
 delete mode 100644 package/libxml-parser-perl/libxml-parser-perl.mk
 create mode 100644 package/perl-module-build/perl-module-build.mk
 create mode 100644 package/perl-xml-parser/perl-xml-parser.mk
 delete mode 100644 package/perl/perl-fix-Module-Build.patch
 create mode 100644 package/pkg-perl.mk
 create mode 100644 package/qemu/Config.in.host
 create mode 100755 support/scripts/scancpan

-- 
1.7.9.5
