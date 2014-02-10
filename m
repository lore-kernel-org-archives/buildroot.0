From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 10 Feb 2014 13:23:07 +0100
Subject: [Buildroot] [pkg-perl infra V6 0/9] a package infrastructure for
	Perl/CPAN modules
Message-ID: <1392034997-12394-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

delta V5 vs V6 :

 - export PERL5LIB
 - rename PKG_PERL_ARCHNAME to PERL_ARCHNAME
 - remove $(2)_*_OPT (with empty default value)
 - remove PERL_INSTALL_TARGET_GOALS

Francois Perrad (9):
  host-perl: export and rename PERL5LIB
  pkg-perl: new infrastructure
  scancpan: a new script
  host-perl-xml-parser: rename and refactor with perl infrastructure
  host-perl-module-build: new package
  perl: remove useless patch
  manual: adding packages perl
  cpanminus: remove it
  perl: remove PERL_INSTALL_TARGET_GOALS

 Config.in                                        |   10 +
 docs/manual/adding-packages-perl.txt             |  110 ++++
 docs/manual/adding-packages.txt                  |    2 +
 package/Config.in                                |    2 -
 package/Makefile.in                              |   13 +-
 package/cpanminus/Config.in                      |   40 --
 package/cpanminus/cpanminus.mk                   |   47 --
 package/intltool/intltool.mk                     |    4 +-
 package/libxml-parser-perl/Config.in             |   10 -
 package/libxml-parser-perl/libxml-parser-perl.mk |   35 --
 package/metacity/metacity.mk                     |    2 +-
 package/perl-module-build/perl-module-build.mk   |   12 +
 package/perl-xml-parser/perl-xml-parser.mk       |   17 +
 package/perl/perl-fix-Module-Build.patch         |   16 -
 package/perl/perl.mk                             |    4 +-
 package/pkg-perl.mk                              |  181 ++++++
 support/scripts/scancpan                         |  694 ++++++++++++++++++++++
 17 files changed, 1036 insertions(+), 163 deletions(-)
 create mode 100644 docs/manual/adding-packages-perl.txt
 delete mode 100644 package/cpanminus/Config.in
 delete mode 100644 package/cpanminus/cpanminus.mk
 delete mode 100644 package/libxml-parser-perl/Config.in
 delete mode 100644 package/libxml-parser-perl/libxml-parser-perl.mk
 create mode 100644 package/perl-module-build/perl-module-build.mk
 create mode 100644 package/perl-xml-parser/perl-xml-parser.mk
 delete mode 100644 package/perl/perl-fix-Module-Build.patch
 create mode 100644 package/pkg-perl.mk
 create mode 100755 support/scripts/scancpan

-- 
1.7.9.5
