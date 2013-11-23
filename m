From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 23 Nov 2013 10:25:37 +0100
Subject: [Buildroot] [pkg-perl infra V3 00/12] a package infrastructure for
	Perl/CPAN modules
Message-ID: <1385198749-6249-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

delta V2 vs V3 :

- [03/12] scancpan:
    add options (including a update/force mode)
    refactor with Pod::Usage

- [12/12] libxml-libxml-perl:
    includes all its CPAN dependencies

Francois Perrad (12):
  perl: new infrastructure
  cpan: a home for Perl modules
  scancpan: a new script
  cpanminus: remove it
  perl: remove useless patch
  qemu: add a Config.in.host
  host-libxml-parser-perl: move and refactor with perl infrastructure
  host-libmodule-build-perl: new package
  manual: adding packages perl
  libcurses-perl: new package
  libnet-ssleay-perl: new package
  libxml-libxml-perl: new package

 Config.in                                          |    7 +
 docs/manual/adding-packages-perl.txt               |   91 +++
 docs/manual/adding-packages.txt                    |    2 +
 package/Config.in                                  |    3 +-
 package/Config.in.host                             |    1 +
 package/Makefile.in                                |   11 +-
 package/cpan/Config.in                             |    6 +
 package/cpan/cpan.mk                               |    1 +
 package/cpan/libcurses-perl/Config.in              |    6 +
 package/cpan/libcurses-perl/libcurses-perl.mk      |   15 +
 .../libmodule-build-perl/libmodule-build-perl.mk   |   13 +
 package/cpan/libnet-ssleay-perl/Config.in          |    6 +
 .../cpan/libnet-ssleay-perl/libnet-ssleay-perl.mk  |   16 +
 package/cpan/libxml-libxml-perl/Config.in          |    9 +
 .../cpan/libxml-libxml-perl/libxml-libxml-perl.mk  |   22 +
 .../cpan/libxml-namespacesupport-perl/Config.in    |    5 +
 .../libxml-namespacesupport-perl.mk                |   16 +
 .../cpan/libxml-parser-perl/libxml-parser-perl.mk  |   17 +
 package/cpan/libxml-sax-base-perl/Config.in        |    5 +
 .../libxml-sax-base-perl/libxml-sax-base-perl.mk   |   16 +
 package/cpan/libxml-sax-perl/Config.in             |    7 +
 package/cpan/libxml-sax-perl/libxml-sax-perl.mk    |   15 +
 package/cpanminus/Config.in                        |   40 --
 package/cpanminus/cpanminus.mk                     |   47 --
 package/intltool/intltool.mk                       |    4 +-
 package/libxml-parser-perl/Config.in               |   11 -
 package/libxml-parser-perl/libxml-parser-perl.mk   |   35 -
 package/perl/perl-fix-Module-Build.patch           |   16 -
 package/pkg-perl.mk                                |  220 ++++++
 package/qemu/Config.in.host                        |   10 +
 support/scripts/scancpan                           |  700 ++++++++++++++++++++
 31 files changed, 1216 insertions(+), 157 deletions(-)
 create mode 100644 docs/manual/adding-packages-perl.txt
 create mode 100644 package/cpan/Config.in
 create mode 100644 package/cpan/cpan.mk
 create mode 100644 package/cpan/libcurses-perl/Config.in
 create mode 100644 package/cpan/libcurses-perl/libcurses-perl.mk
 create mode 100644 package/cpan/libmodule-build-perl/libmodule-build-perl.mk
 create mode 100644 package/cpan/libnet-ssleay-perl/Config.in
 create mode 100644 package/cpan/libnet-ssleay-perl/libnet-ssleay-perl.mk
 create mode 100644 package/cpan/libxml-libxml-perl/Config.in
 create mode 100644 package/cpan/libxml-libxml-perl/libxml-libxml-perl.mk
 create mode 100644 package/cpan/libxml-namespacesupport-perl/Config.in
 create mode 100644 package/cpan/libxml-namespacesupport-perl/libxml-namespacesupport-perl.mk
 create mode 100644 package/cpan/libxml-parser-perl/libxml-parser-perl.mk
 create mode 100644 package/cpan/libxml-sax-base-perl/Config.in
 create mode 100644 package/cpan/libxml-sax-base-perl/libxml-sax-base-perl.mk
 create mode 100644 package/cpan/libxml-sax-perl/Config.in
 create mode 100644 package/cpan/libxml-sax-perl/libxml-sax-perl.mk
 delete mode 100644 package/cpanminus/Config.in
 delete mode 100644 package/cpanminus/cpanminus.mk
 delete mode 100644 package/libxml-parser-perl/Config.in
 delete mode 100644 package/libxml-parser-perl/libxml-parser-perl.mk
 delete mode 100644 package/perl/perl-fix-Module-Build.patch
 create mode 100644 package/pkg-perl.mk
 create mode 100644 package/qemu/Config.in.host
 create mode 100755 support/scripts/scancpan

-- 
1.7.9.5
