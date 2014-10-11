From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 11 Oct 2014 08:36:41 +0200
Subject: [Buildroot] [V2 0/4] host-perl
Message-ID: <1413009405-13870-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

perl infrastructure using a host-perl instead of the system perl

V1 -> V2:
  - rebase the serie
  - XML-Parser doesn't use the infrastructure

Note: no test done for metacity

Francois Perrad (4):
  libxml-parser-perl: restore it like before perl infra
  perl: add host variant
  pkg-perl: refactor with host-perl
  perl: remove useless hacks

 package/Makefile.in                                |  3 --
 package/intltool/intltool.mk                       |  5 ++-
 package/libxml-parser-perl/libxml-parser-perl.mk   | 34 +++++++++++++++++++
 package/metacity/metacity.mk                       |  2 +-
 package/perl-gd/Config.in                          |  2 --
 package/perl-gdgraph/Config.in                     |  1 -
 .../perl-gdgraph-01-fix-Makefile-PL.patch          | 24 --------------
 package/perl-xml-parser/perl-xml-parser.mk         | 17 ----------
 package/perl/perl.mk                               | 38 +++++++++-------------
 package/pkg-perl.mk                                | 23 +++++++------
 10 files changed, 65 insertions(+), 84 deletions(-)
 create mode 100644 package/libxml-parser-perl/libxml-parser-perl.mk
 delete mode 100644 package/perl-gdgraph/perl-gdgraph-01-fix-Makefile-PL.patch
 delete mode 100644 package/perl-xml-parser/perl-xml-parser.mk

-- 
1.9.1
