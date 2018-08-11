From: Christopher McCrory <chrismcc@gmail.com>
Date: Sat, 11 Aug 2018 11:27:32 -0700
Subject: [Buildroot] [PATCH 00/17] even more perl modules
Message-ID: <20180811182749.20924-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds more perl modules, most of which depend on the previous
series.  It also adds host builds where needed. All generated with scancpan.  

perl-package-stash was edited to not build the xs directory bits (more
on this later)
perl-mime-tools was edited to use correct version


This config fragment should select all modules from both series to make
testing easier.

BR2_PACKAGE_PERL=y
BR2_PACKAGE_PERL_CGI=y
BR2_PACKAGE_PERL_CLASS_LOAD=y
BR2_PACKAGE_PERL_CLASS_STD_FAST=y
BR2_PACKAGE_PERL_DATA_UUID=y
BR2_PACKAGE_PERL_DATE_MANIP=y
BR2_PACKAGE_PERL_DBI=y
BR2_PACKAGE_PERL_FILE_SLURP=y
BR2_PACKAGE_PERL_IO_SOCKET_MULTICAST=y
BR2_PACKAGE_PERL_JSON_MAYBEXS=y
BR2_PACKAGE_PERL_LIBWWW_PERL=y
BR2_PACKAGE_PERL_MIME_TOOLS=y
BR2_PACKAGE_PERL_MODULE_BUILD=y
BR2_PACKAGE_PERL_NUMBER_BYTES_HUMAN=y
BR2_PACKAGE_PERL_SYS_MEMINFO=y
BR2_PACKAGE_PERL_SYS_MMAP=y
BR2_PACKAGE_PERL_TERMREADKEY=y
BR2_PACKAGE_PERL_TEMPLATE_TOOLKIT=y
BR2_PACKAGE_PERL_X10=y



Christopher McCrory (17):
  perl-cgi: add host
  perl-html-parser: add host
  perl-html-tagset: add host
  perl-class-std-fast: new package
  perl-data-optlist: new package
  perl-module-runtime: add host
  perl-dist-checkconflicts: new package
  perl-io-socket-multicast: new package
  perl-mime-tools: new package
  perl-module-implementation: new package
  perl-package-stash: new package
  perl-template-toolkit: new package
  perl-time-parsedate: new package
  perl-x10: new package
  perl-module-build: add target
  perl-class-load: new package
  perl-termreadkey: new package

 DEVELOPERS                                               | 13 +++++++++++++
 package/Config.in                                        | 13 +++++++++++++
 package/perl-cgi/perl-cgi.mk                             |  2 ++
 package/perl-class-load/Config.in                        | 15 +++++++++++++++
 package/perl-class-load/perl-class-load.hash             |  6 ++++++
 package/perl-class-load/perl-class-load.mk               | 14 ++++++++++++++
 package/perl-class-std-fast/Config.in                    |  7 +++++++
 package/perl-class-std-fast/perl-class-std-fast.hash     |  6 ++++++
 package/perl-class-std-fast/perl-class-std-fast.mk       | 14 ++++++++++++++
 package/perl-data-optlist/Config.in                      | 12 ++++++++++++
 package/perl-data-optlist/perl-data-optlist.hash         |  6 ++++++
 package/perl-data-optlist/perl-data-optlist.mk           | 14 ++++++++++++++
 package/perl-dist-checkconflicts/Config.in               |  7 +++++++
 .../perl-dist-checkconflicts.hash                        |  6 ++++++
 .../perl-dist-checkconflicts/perl-dist-checkconflicts.mk | 16 ++++++++++++++++
 package/perl-html-parser/perl-html-parser.mk             |  2 ++
 package/perl-html-tagset/perl-html-tagset.mk             |  1 +
 package/perl-io-socket-multicast/Config.in               | 11 +++++++++++
 .../perl-io-socket-multicast.hash                        |  6 ++++++
 .../perl-io-socket-multicast/perl-io-socket-multicast.mk | 14 ++++++++++++++
 package/perl-mime-tools/Config.in                        |  7 +++++++
 package/perl-mime-tools/perl-mime-tools.hash             |  6 ++++++
 package/perl-mime-tools/perl-mime-tools.mk               | 14 ++++++++++++++
 package/perl-module-build/Config.in                      |  6 ++++++
 package/perl-module-build/perl-module-build.mk           |  1 +
 package/perl-module-implementation/Config.in             |  8 ++++++++
 .../perl-module-implementation.hash                      |  6 ++++++
 .../perl-module-implementation.mk                        | 14 ++++++++++++++
 package/perl-module-runtime/perl-module-runtime.mk       |  2 ++
 package/perl-package-stash/Config.in                     |  8 ++++++++
 package/perl-package-stash/perl-package-stash.hash       |  6 ++++++
 package/perl-package-stash/perl-package-stash.mk         | 15 +++++++++++++++
 package/perl-template-toolkit/Config.in                  | 11 +++++++++++
 package/perl-template-toolkit/perl-template-toolkit.hash |  6 ++++++
 package/perl-template-toolkit/perl-template-toolkit.mk   | 14 ++++++++++++++
 package/perl-termreadkey/Config.in                       | 10 ++++++++++
 package/perl-termreadkey/perl-termreadkey.hash           |  6 ++++++
 package/perl-termreadkey/perl-termreadkey.mk             | 13 +++++++++++++
 package/perl-time-parsedate/Config.in                    |  6 ++++++
 package/perl-time-parsedate/perl-time-parsedate.hash     |  6 ++++++
 package/perl-time-parsedate/perl-time-parsedate.mk       | 12 ++++++++++++
 package/perl-x10/Config.in                               | 13 +++++++++++++
 package/perl-x10/perl-x10.hash                           |  6 ++++++
 package/perl-x10/perl-x10.mk                             | 14 ++++++++++++++
 44 files changed, 395 insertions(+)
 create mode 100644 package/perl-class-load/Config.in
 create mode 100644 package/perl-class-load/perl-class-load.hash
 create mode 100644 package/perl-class-load/perl-class-load.mk
 create mode 100644 package/perl-class-std-fast/Config.in
 create mode 100644 package/perl-class-std-fast/perl-class-std-fast.hash
 create mode 100644 package/perl-class-std-fast/perl-class-std-fast.mk
 create mode 100644 package/perl-data-optlist/Config.in
 create mode 100644 package/perl-data-optlist/perl-data-optlist.hash
 create mode 100644 package/perl-data-optlist/perl-data-optlist.mk
 create mode 100644 package/perl-dist-checkconflicts/Config.in
 create mode 100644 package/perl-dist-checkconflicts/perl-dist-checkconflicts.hash
 create mode 100644 package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk
 create mode 100644 package/perl-io-socket-multicast/Config.in
 create mode 100644 package/perl-io-socket-multicast/perl-io-socket-multicast.hash
 create mode 100644 package/perl-io-socket-multicast/perl-io-socket-multicast.mk
 create mode 100644 package/perl-mime-tools/Config.in
 create mode 100644 package/perl-mime-tools/perl-mime-tools.hash
 create mode 100644 package/perl-mime-tools/perl-mime-tools.mk
 create mode 100644 package/perl-module-build/Config.in
 create mode 100644 package/perl-module-implementation/Config.in
 create mode 100644 package/perl-module-implementation/perl-module-implementation.hash
 create mode 100644 package/perl-module-implementation/perl-module-implementation.mk
 create mode 100644 package/perl-package-stash/Config.in
 create mode 100644 package/perl-package-stash/perl-package-stash.hash
 create mode 100644 package/perl-package-stash/perl-package-stash.mk
 create mode 100644 package/perl-template-toolkit/Config.in
 create mode 100644 package/perl-template-toolkit/perl-template-toolkit.hash
 create mode 100644 package/perl-template-toolkit/perl-template-toolkit.mk
 create mode 100644 package/perl-termreadkey/Config.in
 create mode 100644 package/perl-termreadkey/perl-termreadkey.hash
 create mode 100644 package/perl-termreadkey/perl-termreadkey.mk
 create mode 100644 package/perl-time-parsedate/Config.in
 create mode 100644 package/perl-time-parsedate/perl-time-parsedate.hash
 create mode 100644 package/perl-time-parsedate/perl-time-parsedate.mk
 create mode 100644 package/perl-x10/Config.in
 create mode 100644 package/perl-x10/perl-x10.hash
 create mode 100644 package/perl-x10/perl-x10.mk

-- 
2.14.4
