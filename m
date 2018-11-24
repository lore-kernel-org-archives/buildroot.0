From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 24 Nov 2018 10:07:14 +0100
Subject: [Buildroot] [PATCH/next v3 0/8] suppport/testing: Perl interpreter
 and CPAN modules
Message-ID: <20181124090723.14722-1-francois.perrad@gadz.org>
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

V2-> V3
  - test core module 'IO::Handle' instead of 'IO'

V1 -> V2
  - refactor with TestPerlBase class
  - check "This is perl 5"

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
 support/testing/tests/package/test_perl.py    | 66 ++++++++++++++++++
 .../tests/package/test_perl_class_load.py     | 28 ++++++++
 .../tests/package/test_perl_gdgraph.py        | 22 ++++++
 .../tests/package/test_perl_libwww_perl.py    | 41 ++++++++++++
 .../tests/package/test_perl_mail_dkim.py      | 28 ++++++++
 .../testing/tests/package/test_perl_x10.py    | 22 ++++++
 .../tests/package/test_perl_xml_libxml.py     | 22 ++++++
 utils/scancpan                                | 67 +++++++++++++++++++
 9 files changed, 303 insertions(+)
 create mode 100644 support/testing/tests/package/test_perl.py
 create mode 100644 support/testing/tests/package/test_perl_class_load.py
 create mode 100644 support/testing/tests/package/test_perl_gdgraph.py
 create mode 100644 support/testing/tests/package/test_perl_libwww_perl.py
 create mode 100644 support/testing/tests/package/test_perl_mail_dkim.py
 create mode 100644 support/testing/tests/package/test_perl_x10.py
 create mode 100644 support/testing/tests/package/test_perl_xml_libxml.py

-- 
2.17.1
