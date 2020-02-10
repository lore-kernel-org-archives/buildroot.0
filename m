From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 10 Feb 2020 11:46:53 +0100
Subject: [Buildroot] [PATCH 00/12] More perl packages + chartjs
Message-ID: <20200210104706.19186-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

I found some more perl packages under the carpet ;-)

Best regards,
Thomas


Joeri Barbarien (7):
  package/perl-locale-maketext-lexicon: new package
  package/perl-i18n: new package
  package/perl-mojolicious-plugin-authorization: new package
  package/perl-mojolicious-plugin-cspheader: new package
  package/perl-mojolicious-plugin-i18n: new package
  package/perl-mojolicious-plugin-securityheader: new package
  package/chartjs: new package

Thomas De Schampheleire (5):
  package/perl-mozilla-ca: new package
  package/perl-lwp-protocol-https: new package
  package/perl-path-class: new host package
  package/perl-crypt-ssleay: new package
  support/testing: add missing test file for perl-html-parser

 DEVELOPERS                                    | 11 +++++
 package/Config.in                             | 10 +++++
 package/chartjs/Config.in                     |  7 +++
 package/chartjs/chartjs.hash                  |  3 ++
 package/chartjs/chartjs.mk                    | 21 +++++++++
 package/perl-crypt-ssleay/Config.in           | 12 ++++++
 .../perl-crypt-ssleay/perl-crypt-ssleay.hash  |  6 +++
 .../perl-crypt-ssleay/perl-crypt-ssleay.mk    | 18 ++++++++
 package/perl-i18n/Config.in                   |  7 +++
 package/perl-i18n/perl-i18n.hash              |  6 +++
 package/perl-i18n/perl-i18n.mk                | 14 ++++++
 .../perl-locale-maketext-lexicon/Config.in    |  6 +++
 .../perl-locale-maketext-lexicon.hash         |  6 +++
 .../perl-locale-maketext-lexicon.mk           | 14 ++++++
 package/perl-lwp-protocol-https/Config.in     | 14 ++++++
 .../perl-lwp-protocol-https.hash              |  6 +++
 .../perl-lwp-protocol-https.mk                | 14 ++++++
 .../Config.in                                 |  7 +++
 ...perl-mojolicious-plugin-authorization.hash |  6 +++
 .../perl-mojolicious-plugin-authorization.mk  | 15 +++++++
 .../Config.in                                 |  8 ++++
 .../perl-mojolicious-plugin-cspheader.hash    |  6 +++
 .../perl-mojolicious-plugin-cspheader.mk      | 14 ++++++
 .../perl-mojolicious-plugin-i18n/Config.in    |  7 +++
 .../perl-mojolicious-plugin-i18n.hash         |  3 ++
 .../perl-mojolicious-plugin-i18n.mk           | 14 ++++++
 .../Config.in                                 |  7 +++
 ...erl-mojolicious-plugin-securityheader.hash |  6 +++
 .../perl-mojolicious-plugin-securityheader.mk | 14 ++++++
 package/perl-mozilla-ca/Config.in             |  6 +++
 package/perl-mozilla-ca/perl-mozilla-ca.hash  |  6 +++
 package/perl-mozilla-ca/perl-mozilla-ca.mk    | 14 ++++++
 package/perl-path-class/perl-path-class.hash  |  6 +++
 package/perl-path-class/perl-path-class.mk    | 15 +++++++
 package/perl-try-tiny/perl-try-tiny.mk        |  1 +
 .../tests/package/test_perl_crypt_ssleay.py   | 43 +++++++++++++++++++
 .../tests/package/test_perl_html_parser.py    | 20 +++++++++
 .../package/test_perl_lwp_protocol_https.py   | 42 ++++++++++++++++++
 38 files changed, 435 insertions(+)
 create mode 100644 package/chartjs/Config.in
 create mode 100644 package/chartjs/chartjs.hash
 create mode 100644 package/chartjs/chartjs.mk
 create mode 100644 package/perl-crypt-ssleay/Config.in
 create mode 100644 package/perl-crypt-ssleay/perl-crypt-ssleay.hash
 create mode 100644 package/perl-crypt-ssleay/perl-crypt-ssleay.mk
 create mode 100644 package/perl-i18n/Config.in
 create mode 100644 package/perl-i18n/perl-i18n.hash
 create mode 100644 package/perl-i18n/perl-i18n.mk
 create mode 100644 package/perl-locale-maketext-lexicon/Config.in
 create mode 100644 package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.hash
 create mode 100644 package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.mk
 create mode 100644 package/perl-lwp-protocol-https/Config.in
 create mode 100644 package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
 create mode 100644 package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
 create mode 100644 package/perl-mojolicious-plugin-authorization/Config.in
 create mode 100644 package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.hash
 create mode 100644 package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk
 create mode 100644 package/perl-mojolicious-plugin-cspheader/Config.in
 create mode 100644 package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.hash
 create mode 100644 package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.mk
 create mode 100644 package/perl-mojolicious-plugin-i18n/Config.in
 create mode 100644 package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.hash
 create mode 100644 package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.mk
 create mode 100644 package/perl-mojolicious-plugin-securityheader/Config.in
 create mode 100644 package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.hash
 create mode 100644 package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.mk
 create mode 100644 package/perl-mozilla-ca/Config.in
 create mode 100644 package/perl-mozilla-ca/perl-mozilla-ca.hash
 create mode 100644 package/perl-mozilla-ca/perl-mozilla-ca.mk
 create mode 100644 package/perl-path-class/perl-path-class.hash
 create mode 100644 package/perl-path-class/perl-path-class.mk
 create mode 100644 support/testing/tests/package/test_perl_crypt_ssleay.py
 create mode 100644 support/testing/tests/package/test_perl_html_parser.py
 create mode 100644 support/testing/tests/package/test_perl_lwp_protocol_https.py

-- 
2.24.1
