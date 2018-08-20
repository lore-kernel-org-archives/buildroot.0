From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:55:01 -0700
Subject: [Buildroot] [PATCH 00/13] perl modules again
Message-ID: <20180820115519.24046-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hopefully this resolves the issues with the previous submissions.

perl-dbi-add-host-package.patch
  host needed by dbd-mysql, sorry Fran?ois.  I cannot see a way to avoid
it :(

perl-time-parsedate-new-package.patch
  LICENSE is unknown, more later

perl-sys-cpu-new-package.patch
  metacpan returns unknown for license, but readme states same as perl

perl-package-stash-new-package.patch
  fixed from last submission

perl-template-toolkit-new-package.patch
perl-xml-parser-new-package.patch
  submitting with my original sed hack in case the better way needs more
work.  

perl-soap-wsdl-new-package.patch
  needs template-toolkit and xml-parser

At this point zoneminder perl bits run, Yea!

perl-termreadkey
  this on caused a discussion lat time.
 used PERL_TERMREADKEY_LICENSE = Artistic or GPL-1.0+, and Copyright only
  https://src.fedoraproject.org/rpms/perl-TermReadKey/blob/master/f/perl-TermReadKey.spec
  https://github.com/jonathanstowe/TermReadKey/issues/11
  Fedora has a team of people on licencing issues, that is what they
came up with.  I'm not sure what debian did.  Good enough?

pkg-utils.mk
  As suggested and written by Fran?ois.  Not sure if this is the correct
or best place to put it.  If anyone wants to tweek it in any way before
commiting, I'm good with that.  Actually the same goes for any of these.

perl-template-toolkit and perl-xml-parser
  Now use call patch_sub_makefile from previous patch

perl-soap-wsdl 
  add dependancy on perl-termreadkey if it gets commited.  This package
works for me without termreadkey,  but add it anyway for completeness.


Christopher McCrory (18):
  perl-dbi: add host package
  perl-dbd-mysql: new package
  perl-data-dump: new package
  perl-time-parsedate: new package
  perl-x10: new package
  perl-sys-cpu: new package
  perl-dist-checkconflicts: new package
  perl-package-stash: new package
  perl-class-load: new package
  perl-template-toolkit: new package
  perl-xml-parser: new package
  perl-soap-wsdl: new package
  perl-time-parsedate: add license
  perl-termreadkey: new package
  pkg-utils.mk: patch_sub_makefile
  perl-template-toolkit: use new patch_sub_makefile
  perl-xml-parser: use new patch_sub_makefile
  perl-soap-wsdl: add dependancy on perl-termreadkey

 DEVELOPERS                                         | 12 +++++++++++
 package/Config.in                                  | 12 +++++++++++
 package/perl-class-load/Config.in                  | 15 ++++++++++++++
 package/perl-class-load/perl-class-load.hash       |  6 ++++++
 package/perl-class-load/perl-class-load.mk         | 14 +++++++++++++
 package/perl-data-dump/Config.in                   |  6 ++++++
 package/perl-data-dump/perl-data-dump.hash         |  6 ++++++
 package/perl-data-dump/perl-data-dump.mk           | 13 ++++++++++++
 package/perl-dbd-mysql/Config.in                   | 12 +++++++++++
 package/perl-dbd-mysql/perl-dbd-mysql.hash         |  6 ++++++
 package/perl-dbd-mysql/perl-dbd-mysql.mk           | 15 ++++++++++++++
 package/perl-dbi/perl-dbi.mk                       |  1 +
 package/perl-dist-checkconflicts/Config.in         |  7 +++++++
 .../perl-dist-checkconflicts.hash                  |  6 ++++++
 .../perl-dist-checkconflicts.mk                    | 14 +++++++++++++
 package/perl-package-stash/Config.in               |  8 ++++++++
 package/perl-package-stash/perl-package-stash.hash |  6 ++++++
 package/perl-package-stash/perl-package-stash.mk   | 14 +++++++++++++
 package/perl-soap-wsdl/Config.in                   | 19 +++++++++++++++++
 package/perl-soap-wsdl/perl-soap-wsdl.hash         |  6 ++++++
 package/perl-soap-wsdl/perl-soap-wsdl.mk           | 14 +++++++++++++
 package/perl-sys-cpu/Config.in                     |  5 +++++
 package/perl-sys-cpu/perl-sys-cpu.hash             |  2 ++
 package/perl-sys-cpu/perl-sys-cpu.mk               | 13 ++++++++++++
 package/perl-template-toolkit/Config.in            | 11 ++++++++++
 .../perl-template-toolkit.hash                     |  6 ++++++
 .../perl-template-toolkit/perl-template-toolkit.mk | 21 +++++++++++++++++++
 package/perl-termreadkey/Config.in                 | 10 +++++++++
 package/perl-termreadkey/perl-termreadkey.hash     |  6 ++++++
 package/perl-termreadkey/perl-termreadkey.mk       | 15 ++++++++++++++
 package/perl-time-parsedate/Config.in              |  6 ++++++
 .../perl-time-parsedate/perl-time-parsedate.hash   |  6 ++++++
 package/perl-time-parsedate/perl-time-parsedate.mk | 14 +++++++++++++
 package/perl-x10/Config.in                         | 13 ++++++++++++
 package/perl-x10/perl-x10.hash                     |  6 ++++++
 package/perl-x10/perl-x10.mk                       | 14 +++++++++++++
 package/perl-xml-parser/Config.in                  | 12 +++++++++++
 package/perl-xml-parser/perl-xml-parser.hash       |  6 ++++++
 package/perl-xml-parser/perl-xml-parser.mk         | 24 ++++++++++++++++++++++
 package/pkg-utils.mk                               | 16 +++++++++++++++
 40 files changed, 418 insertions(+)
 create mode 100644 package/perl-class-load/Config.in
 create mode 100644 package/perl-class-load/perl-class-load.hash
 create mode 100644 package/perl-class-load/perl-class-load.mk
 create mode 100644 package/perl-data-dump/Config.in
 create mode 100644 package/perl-data-dump/perl-data-dump.hash
 create mode 100644 package/perl-data-dump/perl-data-dump.mk
 create mode 100644 package/perl-dbd-mysql/Config.in
 create mode 100644 package/perl-dbd-mysql/perl-dbd-mysql.hash
 create mode 100644 package/perl-dbd-mysql/perl-dbd-mysql.mk
 create mode 100644 package/perl-dist-checkconflicts/Config.in
 create mode 100644 package/perl-dist-checkconflicts/perl-dist-checkconflicts.hash
 create mode 100644 package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk
 create mode 100644 package/perl-package-stash/Config.in
 create mode 100644 package/perl-package-stash/perl-package-stash.hash
 create mode 100644 package/perl-package-stash/perl-package-stash.mk
 create mode 100644 package/perl-soap-wsdl/Config.in
 create mode 100644 package/perl-soap-wsdl/perl-soap-wsdl.hash
 create mode 100644 package/perl-soap-wsdl/perl-soap-wsdl.mk
 create mode 100644 package/perl-sys-cpu/Config.in
 create mode 100644 package/perl-sys-cpu/perl-sys-cpu.hash
 create mode 100644 package/perl-sys-cpu/perl-sys-cpu.mk
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
 create mode 100644 package/perl-xml-parser/Config.in
 create mode 100644 package/perl-xml-parser/perl-xml-parser.hash
 create mode 100644 package/perl-xml-parser/perl-xml-parser.mk

-- 
2.14.4
