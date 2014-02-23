From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 23 Feb 2014 15:17:14 +0100
Subject: [Buildroot] [pkg-perl infra v11 0/6] a package infrastructure for
	Perl/CPAN modules
Message-ID: <1393165041-21015-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

delta V11 vs V10
 - manual
   + some improvements
 - scancpan
   + add comments

delta V9 vs V10
 - reorder patches (Note that patch 1/6 can go in immediately, perhaps even for 2014.02)
 - scancpan
   + remove spurious final empty line in Config.in
   + POD description
   + generates target/host variants only when needed
 - manual

delta V8 vs V9 :
 - scancpan 
   + back to fatpack
   + use 5.018;

delta V7 vs V8 :
 - typo and minor improvements

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
  perl: remove PERL_INSTALL_TARGET_GOALS
  pkg-perl: new infrastructure
  host-perl-xml-parser: rename and refactor with perl infrastructure
  host-perl-module-build: new package
  manual: adding packages perl
  scancpan: a new script

 Config.in                                        |   11 +
 docs/manual/adding-packages-perl.txt             |  120 ++++
 docs/manual/adding-packages.txt                  |    2 +
 package/Config.in                                |    1 -
 package/Makefile.in                              |    4 +-
 package/intltool/intltool.mk                     |    2 +-
 package/libxml-parser-perl/Config.in             |   10 -
 package/libxml-parser-perl/libxml-parser-perl.mk |   35 -
 package/metacity/metacity.mk                     |    2 +-
 package/perl-module-build/perl-module-build.mk   |   12 +
 package/perl-xml-parser/perl-xml-parser.mk       |   17 +
 package/perl/perl.mk                             |    4 +-
 package/pkg-perl.mk                              |  181 ++++++
 support/scripts/scancpan                         |  741 ++++++++++++++++++++++
 14 files changed, 1090 insertions(+), 52 deletions(-)
 create mode 100644 docs/manual/adding-packages-perl.txt
 delete mode 100644 package/libxml-parser-perl/Config.in
 delete mode 100644 package/libxml-parser-perl/libxml-parser-perl.mk
 create mode 100644 package/perl-module-build/perl-module-build.mk
 create mode 100644 package/perl-xml-parser/perl-xml-parser.mk
 create mode 100644 package/pkg-perl.mk
 create mode 100755 support/scripts/scancpan

-- 
1.7.9.5
