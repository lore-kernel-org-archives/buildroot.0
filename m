From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 11 Feb 2014 11:56:39 +0100
Subject: [Buildroot] [pkg-perl infra V7 0/6] a package infrastructure for
	Perl/CPAN modules
Message-ID: <1392116205-12810-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

delta V6 vs V7 :
 - global
   + substitute 'perl_5' by 'Artistic or GPLv1+'
 - scancpan
   + remove 'NO ABSTRACT'
   + check Module::CoreList::is_core with the target Perl version
   + add packages Module-CoreList and MetaCPAN-API-Tiny instead of use Fatpack
   + add GPL

delta V5 vs V6 :

 - export PERL5LIB
 - rename PKG_PERL_ARCHNAME to PERL_ARCHNAME
 - remove $(2)_*_OPT (with empty default value)
 - remove PERL_INSTALL_TARGET_GOALS


Francois Perrad (6):
  pkg-perl: new infrastructure
  scancpan: a new script
  host-perl-xml-parser: rename and refactor with perl infrastructure
  host-perl-module-build: new package
  manual: adding packages perl
  perl: remove PERL_INSTALL_TARGET_GOALS

 Config.in                                          |   10 +
 docs/manual/adding-packages-perl.txt               |  110 ++++++++++
 docs/manual/adding-packages.txt                    |    2 +
 package/Config.in                                  |    1 -
 package/Makefile.in                                |    4 +-
 package/intltool/intltool.mk                       |    2 +-
 package/libxml-parser-perl/Config.in               |   10 -
 package/libxml-parser-perl/libxml-parser-perl.mk   |   35 ---
 package/metacity/metacity.mk                       |    2 +-
 .../perl-metacpan-api-tiny.mk                      |   12 +
 package/perl-module-build/perl-module-build.mk     |   12 +
 .../perl-module-corelist/perl-module-corelist.mk   |   13 ++
 package/perl-xml-parser/perl-xml-parser.mk         |   17 ++
 package/perl/perl.mk                               |    4 +-
 package/pkg-perl.mk                                |  181 ++++++++++++++++
 support/scripts/scancpan                           |  229 ++++++++++++++++++++
 16 files changed, 592 insertions(+), 52 deletions(-)
 create mode 100644 docs/manual/adding-packages-perl.txt
 delete mode 100644 package/libxml-parser-perl/Config.in
 delete mode 100644 package/libxml-parser-perl/libxml-parser-perl.mk
 create mode 100644 package/perl-metacpan-api-tiny/perl-metacpan-api-tiny.mk
 create mode 100644 package/perl-module-build/perl-module-build.mk
 create mode 100644 package/perl-module-corelist/perl-module-corelist.mk
 create mode 100644 package/perl-xml-parser/perl-xml-parser.mk
 create mode 100644 package/pkg-perl.mk
 create mode 100755 support/scripts/scancpan

-- 
1.7.9.5
