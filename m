From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  6 Dec 2015 15:14:33 +0100
Subject: [Buildroot] [V4 0/3] SpamAssassin
Message-ID: <1449411276-27492-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

V3 -> V4: add remarks from Bernd Kuhls
- SpamAssassin
    - add perl-db-file as optional dependency
    - set VENDORPREFIX
    - set INSTALLVENDORCONF
- fix perl-db-file
    - patch from Bernd Kuhls, see https://patchwork.ozlabs.org/patch/553054/

V3:
- fix Perl/CPAN infrastructure
- patch SpamAssassin in order to avoid host-perl modules dependencies

See previous discussion in https://patchwork.ozlabs.org/patch/464635/

Francois Perrad (2):
  pkg-perl: avoid insertion of host-perl in shebang of scripts
  perl-mail-spamassassin: new package
Bernd Kuhls (1):
  package/perl-db-file: Fix berkeleydb detection

 package/Config.in                                  |  1 +
 package/perl-db-file/perl-db-file.mk               |  8 +++
 .../0001-without-host-perl-dependencies.patch      | 64 ++++++++++++++++++++++
 package/perl-mail-spamassassin/Config.in           | 26 +++++++++
 .../perl-mail-spamassassin.hash                    |  3 +
 .../perl-mail-spamassassin.mk                      | 38 +++++++++++++
 package/pkg-perl.mk                                |  1 +
 7 files changed, 141 insertions(+)
 create mode 100644 package/perl-mail-spamassassin/0001-without-host-perl-dependencies.patch
 create mode 100644 package/perl-mail-spamassassin/Config.in
 create mode 100644 package/perl-mail-spamassassin/perl-mail-spamassassin.hash
 create mode 100644 package/perl-mail-spamassassin/perl-mail-spamassassin.mk

--
2.5.0
