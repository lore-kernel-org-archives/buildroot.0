From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 21 Nov 2018 20:58:14 +0100
Subject: [Buildroot] [PATCH 0/8] suppport/testing: Perl interpreter and CPAN
 modules
Message-ID: <20181121195822.15379-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

test_perl.py allows to test the Perl interpreter and some of its core modules,
and it is used as base class for testing CPAN modules.

Now, scancpan could generate test for CPAN modules.
Currently, there are more than 100 CPAN modules, 25 of them are XS modules.
In order to limit the number of tests (and the execution time),
a test is generated only if the module have more than one direct dependencies
and have at least one XS dependencies.

Francois Perrad (8):
  support/testing: add perl test
  scancpan: add generation of test
  support/testing: add perl-class-load test
  support/testing: add perl-gdgraph test
  support/testing: add perl-libwww-perl test
  support/testing: add perl-mail-dkim test
  support/testing: add perl-x10 test
  support/testing: add perl-xml-libxml test

 .gitlab-ci.yml                                |  7 ++
 support/testing/tests/package/test_perl.py    | 59 +++++++++++++++++
 .../tests/package/test_perl_class_load.py     | 27 ++++++++
 .../tests/package/test_perl_gdgraph.py        | 21 ++++++
 .../tests/package/test_perl_libwww_perl.py    | 40 +++++++++++
 .../tests/package/test_perl_mail_dkim.py      | 27 ++++++++
 .../testing/tests/package/test_perl_x10.py    | 21 ++++++
 .../tests/package/test_perl_xml_libxml.py     | 21 ++++++
 utils/scancpan                                | 66 +++++++++++++++++++
 9 files changed, 289 insertions(+)
 create mode 100644 support/testing/tests/package/test_perl.py
 create mode 100644 support/testing/tests/package/test_perl_class_load.py
 create mode 100644 support/testing/tests/package/test_perl_gdgraph.py
 create mode 100644 support/testing/tests/package/test_perl_libwww_perl.py
 create mode 100644 support/testing/tests/package/test_perl_mail_dkim.py
 create mode 100644 support/testing/tests/package/test_perl_x10.py
 create mode 100644 support/testing/tests/package/test_perl_xml_libxml.py

-- 
2.17.1
